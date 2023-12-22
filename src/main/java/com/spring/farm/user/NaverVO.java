package com.spring.farm.user;

public class NaverVO {		
	
	private String clientId = ""; // 네이버 클라이언트 아이디 값
    private String clientSecret = ""; //네이버 클라이언트 시크릿값
    private String callback_url = ""; // 네이버 리다이렉트url
    
    // 콜백 정보 
    private String code;
    private String state;
    
    //접근토근 요청/응답정보
  	private String grant_type;
  	private String access_token;
  	private String refresh_token;
  	private String token_type;
  	private int expires_in;
  	
  	
  	//공통 - 연동결과 응답정보, 접근토근 응답정보
  	private String error;
  	private String error_description;
  	
  	private int inout;

	public String getClientId() {
		return clientId;
	}

	public void setClientId(String clientId) {
		this.clientId = clientId;
	}

	public String getClientSecret() {
		return clientSecret;
	}

	public void setClientSecret(String clientSecret) {
		this.clientSecret = clientSecret;
	}

	public String getCallback_url() {
		return callback_url;
	}

	public void setCallback_url(String callback_url) {
		this.callback_url = callback_url;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getGrant_type() {
		return grant_type;
	}

	public void setGrant_type(String grant_type) {
		this.grant_type = grant_type;
	}

	public String getAccess_token() {
		return access_token;
	}

	public void setAccess_token(String access_token) {
		this.access_token = access_token;
	}

	public String getRefresh_token() {
		return refresh_token;
	}

	public void setRefresh_token(String refresh_token) {
		this.refresh_token = refresh_token;
	}

	public String getToken_type() {
		return token_type;
	}

	public void setToken_type(String token_type) {
		this.token_type = token_type;
	}

	public int getExpires_in() {
		return expires_in;
	}

	public void setExpires_in(int expires_in) {
		this.expires_in = expires_in;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public String getError_description() {
		return error_description;
	}

	public void setError_description(String error_description) {
		this.error_description = error_description;
	}

	public int getInout() {
		return inout;
	}

	public void setInout(int inout) {
		this.inout = inout;
	}

	@Override
	public String toString() {
		return "NavKaoVO [clientId=" + clientId + ", clientSecret=" + clientSecret + ", callback_url=" + callback_url
				+ ", code=" + code + ", state=" + state + ", grant_type=" + grant_type + ", access_token="
				+ access_token + ", refresh_token=" + refresh_token + ", token_type=" + token_type + ", expires_in="
				+ expires_in + ", error=" + error + ", error_description=" + error_description + ", inout=" + inout
				+ "]";
	}
    
    
	

}
