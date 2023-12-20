// 	function test() {
// 		var p1 = document.getElementById('password1').value;
// 		var p2 = document.getElementById('password2').value;
// 		if (p1 != p2) {
// 			alert("비밀번호가 일치하지 않습니다.")
// 			return false;
// 		} else {
// 			alert("수정이 완료 되었습니다.")
// 			return true;
// 		}
// 	}
	function phoneNum(obj){
	    var number = obj.value.replace(/[^0-9]/g, "");
	    var phone = "";
	    if(number.length < 4) {
	        return number;
	    } else if(number.length < 8) {
	        phone += number.substr(0, 3);
	        phone += "-";
	        phone += number.substr(3);
	    }else if(number.length < 11){
	        phone += number.substr(0, 3);
	        phone += "-";
	        phone += number.substr(3, 3);
	        phone += "-";
	        phone += number.substr(6);
	    }else{
	        phone += number.substr(0, 3);
	        phone += "-";
	        phone += number.substr(3, 4);
	        phone += "-";
	        phone += number.substr(7);
	    }
	    obj.value = phone;
	}
	
	function upMyinfoConf(um){
		var um;
		
	}
	
	function deleteConf(a) {		
	var a;
	let delchk = confirm("정말 탈퇴하시겠습니까?");
		if (delchk == true) {
			let iv = document.miu.user_id.value;
			alert("탈퇴 되었습니다.");
			location.href = "exitUser.do?user_id=" + a;
		} else {
			alert("취소 되었습니다");
		}
	}