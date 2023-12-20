package com.spring.farm.controller;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.farm.user.KakaoVO;
import com.spring.farm.user.NaverVO;
import com.spring.farm.user.UserService;

@Controller
public class NavKaoController {
	
	@Autowired
	private UserService userService;
	
	private static final String NAVER_AUTH_URL = "https://nid.naver.com/oauth2.0/authorize";
	private static final String NAVER_TOKEN_URL = "https://nid.naver.com/oauth2.0/token";
	private static final String NAVER_PROFIL_URL = "https://openapi.naver.com/v1/nid/me";
	private static final String NAVER_LOGOUT_URL = "https://nid.naver.com/nidlogin.logout";
	
	private String REDIRECT_URL = "http://www.farmheidi.kro.kr/main.jsp";
	private static int inOutCheck;
	private static String tokenchk;
	
	public static final String KAKAO_AUTH_URL = "https://kauth.kakao.com/oauth/authorize";
	public static final String KAKAO_TOKEN_URL = "https://kauth.kakao.com/oauth/token";
	public static final String KAKAO_USER_INFO_URL = "https://kapi.kakao.com/v2/user/me";
	public static final String KAKAO_LOGOUT_URL = "https://kapi.kakao.com/v1/user/logout";
	public static final String KAKAO_UNLINK_URL = "https://kapi.kakao.com/v1/user/unlink";
	private static String id ;
	
	public String REDIRECT_URI = ""; // 공란 
			
	// 네이버 로그아웃 
	@RequestMapping("/naverLogout.do")
	public String naverLogout(Model model, NaverVO vo) {
		HttpClient client = HttpClientBuilder.create().build();
		HttpGet get = new HttpGet(NAVER_LOGOUT_URL);
		model.addAttribute("navInfo", null);
		try {
			HttpResponse res = client.execute(get);
			res = client.execute(get);
		}catch(Exception e) {
			e.printStackTrace();
		}		
		return "redirect:/main.jsp";
	}	
		
	// 네이버 Auth url 설정 
	@RequestMapping("/getNaverAuthUrl.do")
	public String getNaverAuthUrl(NaverVO vo) {
		System.out.println("getNaverAuthurl 접근");
		inOutCheck = vo.getInout();
		REDIRECT_URL = vo.getCallback_url();
		System.out.println("getNaverAuthurl 콜백 불러오기: "+vo.getCallback_url());
		String result = NAVER_AUTH_URL + "?state=success&response_type=code&auth_type=reauthenticate&client_id="+vo.getClientId()+"&redirect_uri="+REDIRECT_URL;
		System.out.println("getNaverAuthurl 리다이렉트값 : "+result);
		return "redirect:"+result;
	}		
	
	// 네이버 Auth 접근
	@RequestMapping(value = "/navJoin.do")
	public String oauthNaver(NaverVO vo, Model model, HttpSession session) throws Exception {
		System.out.println("nav vo: "+ vo);
		String asToken = getToken(vo);
		vo.setAccess_token(asToken);
		System.out.println((inOutCheck==1?"로그인":"로그아웃" )+"의 토큰값: "+asToken);
		HashMap<String, String> userInfo = getProfile(vo);
		userService.navJoin(userInfo);
				
		session.setAttribute("user_id", userInfo.get("idN"));
		model.addAttribute("naverInfo", userInfo);		
		System.out.println("navJoin 가져옴 :userinfo= "+ userInfo);
		
		return "redirect:/main.jsp";
	}
	
	// 네이버 토큰 요청, 응답 
	public String getToken(NaverVO vo) throws Exception{
		String apiUrl = NAVER_TOKEN_URL;
		
		HttpClient client = HttpClientBuilder.create().build();
		
		HttpPost post = new HttpPost(NAVER_TOKEN_URL);
		Map<String, String> m = new HashMap<String, String>();
		m.put("grant_type", "authorization_code");
		m.put("client_id", vo.getClientId());
		m.put("client_secret", vo.getClientSecret());
		m.put("redirect_url", URLEncoder.encode(vo.getCallback_url(), "UTF-8"));
		m.put("code", vo.getCode());
		m.put("state", vo.getState());
		
		try {
			post.setEntity(new UrlEncodedFormEntity(convtParam(m)));
			HttpResponse res = client.execute(post);
			
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(body);
			tokenchk = rootNode.get("access_token").asText();
			
		}catch (Exception e) { e.printStackTrace(); }	
		
		REDIRECT_URL = "리다이렉트 URL";
		return tokenchk;
	}
	
	// 네이버 토큰요청에서 Http 파라미터 생성 
	List<NameValuePair> convtParam(Map<String, String> paramMap){
		List<NameValuePair> paramList = new ArrayList<NameValuePair>();
		Set<Entry<String, String>> entries = paramMap.entrySet();
		for(Entry<String, String> entry : entries) {
			paramList.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
		}
		return paramList;
	}
	
	
	// 네이버 정보(profile) 가져오기 
	public HashMap<String, String> getProfile(NaverVO vo) throws Exception {
        System.out.println("vo: "+vo);
        String header = "Bearer " + vo.getAccess_token();

        HttpClient client = HttpClientBuilder.create().build(); 
		HttpGet get = new HttpGet(NAVER_PROFIL_URL);
		HashMap<String, String> map = null;
		get.setHeader("Authorization", header); 
		try {
			HttpResponse res = client.execute(get); 
			ObjectMapper mapper = new ObjectMapper(); 
			String body = EntityUtils.toString(res.getEntity()); 
			
			System.out.println("네이버 정보 가져오기 body: "+body);
			JsonNode rootNode = mapper.readTree(body); 
			JsonNode response = rootNode.get("response"); 
			
			if(! rootNode.asText().equals("null")) {
				map = new HashMap<String, String>();
				System.out.println("id: "+response.get("id").asText() );
				System.out.println("name: "+response.get("name").asText() );
				System.out.println("email: "+ response.get("email").asText() );
				System.out.println("mobile: "+response.get("mobile").asText());
				
				map.put("msg","ok" );
				map.put("idN", response.get("id").asText() );
				map.put("nameN", response.get("name").asText() );
				map.put("emailN", response.get("email").asText() );
				map.put("mobileN", response.get("mobile").asText());
			}
		} catch (Exception e) { e.printStackTrace(); }
    	return map;         
    }
	
	// ------------------------------------------------------------------------------
	// ------------------------------------------------------------------------------

	// 카카오 AuthUrl 설정 
	@RequestMapping("/getKakaoAuthUrl.do")
	public String getKaoToken(KakaoVO vo) {
		REDIRECT_URI = vo.getREDIRECT_URI() + "/getKaoToken";
		String result = KAKAO_AUTH_URL + "?response_type=code&scope=account_email,profile_nickname,name,phone_number&client_id="+vo.getREST_API_KEY()+"&redirect_uri="+REDIRECT_URI;
		System.out.println("카카오 result : "+result);
		return "redirect:"+result;
	}
	
	@RequestMapping(value = "/getKaoToken")
	public String oauthKakao(KakaoVO vo, Model model, HttpSession session, HttpServletRequest request) throws Exception {
		System.out.println("kakao_getKaoToken의 request :"+request);
		String access_Token = getAccessToken(vo.getCode());
		
		
		HashMap<String, Object> userkInfo = getUserkInfo(access_Token);
		System.out.println("카카오 oauth 정보 체크: "+userkInfo.get("idK") );
		userService.kaoJoin(userkInfo);
		session.setAttribute("user_id", userkInfo.get("id"));
		model.addAttribute("kakaoInfo", userkInfo);

		System.out.println("카카오 oauth토큰체크 : "+vo );
		return "redirect:/main.jsp";
	}
	
	//카카오 로그아웃
		@RequestMapping(value = "/logout")
		public String logoutKakao(KakaoVO vo) throws Exception {
			System.out.println("id555: "+id);
			String addURL ="?target_id_type=user_id&target_id="+id;
			HttpClient client = HttpClientBuilder.create().build(); 
			HttpGet get = new HttpGet(KAKAO_LOGOUT_URL+addURL);
			get.setHeader("Authorization", "KakaoAK " + vo.getADMIN_KEY()); 
			
			HttpResponse res = client.execute(get); 
			ObjectMapper mapper = new ObjectMapper(); 
			String body = EntityUtils.toString(res.getEntity()); 
			System.out.println("body555: "+body);
			
	        return "redirect:/unlinkKakao";
		}
		
		//카카오 계정 끊기
		@RequestMapping(value = "/unlinkKakao")
		public String unlinkKakao(KakaoVO vo, Model model) {
			System.out.println("id333: "+id);
			String addURL = "?target_id_type=user_id&target_id="+id ;
			HttpClient client = HttpClientBuilder.create().build(); 
			HttpGet get = new HttpGet(KAKAO_UNLINK_URL+addURL);
			get.setHeader("Authorization", "KakaoAK " + vo.getADMIN_KEY()); 
			try {
				HttpResponse res = client.execute(get); 
				ObjectMapper mapper = new ObjectMapper(); 
				String body = EntityUtils.toString(res.getEntity()); 
				System.out.println("body333: "+body);
				
			}catch (Exception e) { 
				e.printStackTrace(); 
			}    
			
			model.addAttribute("kakaoInfo", null);
			return "/home";
		}
	
	// 토큰 발급 
	public String getAccessToken(String authorize_code) {
		KakaoVO vo = new KakaoVO();
		REDIRECT_URI = vo.getREDIRECT_URI()+"/getKaoToken";
		
		String result="";
		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(KAKAO_TOKEN_URL);
		Map<String, String> km = new HashMap<String, String>();
		km.put("grant_type", "authorization_code");
		km.put("client_id", vo.getREST_API_KEY());
		km.put("redirect_uri", REDIRECT_URI);
		km.put("code", authorize_code);
		System.out.println("토큰부분 authorize_code  : "+ authorize_code);
		try {
			post.setEntity(new UrlEncodedFormEntity(convertParameter(km)));
			HttpResponse res = client.execute(post);
			
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());
			
			JsonNode rootNode = mapper.readTree(body);
			result = rootNode.get("access_token").asText();
		} catch (Exception e) { e.printStackTrace();	}		
		return result;		
	}
	
	
	List<NameValuePair> convertParameter(Map<String,String> paramMap){
		List<NameValuePair> kparamList = new ArrayList<NameValuePair>(); 
		Set<Entry<String,String>> entries = paramMap.entrySet();
		for(Entry<String,String> entry : entries) {
			kparamList.add(new BasicNameValuePair(entry.getKey(), entry.getValue())); 
		} 
		return kparamList; 
	}
	
	
	// 카카오 정보 가져오기
	public HashMap<String, Object> getUserkInfo(String access_Token){
		HttpClient client = HttpClientBuilder.create().build();
		HttpGet get = new HttpGet(KAKAO_USER_INFO_URL);
		HashMap<String, Object> kmap = new HashMap<String, Object>();;
		get.setHeader("Authorization", "Bearer " + access_Token);
		try {
			HttpResponse res = client.execute(get);
			ObjectMapper mapper = new ObjectMapper(); 
			String body = EntityUtils.toString(res.getEntity()); 
							
			System.out.println("카카오 정보 가져오기 body: "+body );
			
			JsonNode rootNode = mapper.readTree(body); 
			if(rootNode.asText().equals("null")) {
				kmap.put("msg","토큰 내용 xx " );
			} else {
				id = rootNode.get("id").asText();
				System.out.println("userkIngo id 찍어보기: "+id );
				kmap.put("msg","ok");
				kmap.put("id", id);
				kmap.put("access_Token", access_Token);
				kmap.put("connected_at",rootNode.get("connected_at").asText() );
				kmap.put("idK", rootNode.get("properties").get("nickname").asText());
				kmap.put("mailK", rootNode.get("kakao_account").get("email").asText());
				kmap.put("nameK", rootNode.get("kakao_account").get("name").asText());
				kmap.put("phoneK", rootNode.get("kakao_account").get("phone_number").asText());
			}			
		} catch (Exception e) { e.printStackTrace(); }		
		
		return kmap;
	}
}
