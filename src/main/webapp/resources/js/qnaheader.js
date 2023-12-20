function selTrQNA(val, qnasecret) {
    if (qnasecret == false) {
        location.href = "getQNA.do?qna_num=" + val;
    } else {
        // 비밀번호를 가져오기 위한 비동기 요청
        fetch("/getPassword.do?qna_num=" + val)
            .then(response => response.text())
            .then(data => {
                // 가져온 비밀번호를 password 변수에 저장
                password = data;

                // 비밀번호 입력 프롬프트
                pw = prompt('비밀번호를 입력해주세요.');

                // 사용자가 '취소'를 선택한 경우
                if (pw === null) {
                    console.log("취소했습니다.");
                } else {
                    if (pw == password) {
                        location.href = "getQNA.do?qna_num=" + val;
                    } else {
                        alert('비밀번호가 일치하지 않습니다.');
                        password = null;
                    }
                }
            })
            .catch(error => console.error("Error fetching password:", error));
    }
}


//location.href = "passwordQNA.do?qna_num="+val;
function pwgetQNA(val) {
    var enteredPassword = document.getElementById('qna_password').value;

    if (enteredPassword === password) {
        location.href = "getQNA.do?qna_num=" + val;
    }else if(enteredPassword === ''){
   		alert("비밀번호를 입력해주세요.")
    }else {
        alert("비밀번호가 일치하지 않습니다");
        history.go(-1);
    }
}

function QNAinsert(uid) {
        if (uid == null || uid == '' || uid == 'undefined') {
            alert("로그인이 필요한 항목입니다.");
            location.href = "login.do";
        } else {
            location.href = "insertQNA.do";
        }
    }
function QNAupdate(uid) {
        if (uid == null || uid == '' || uid == 'undefined') {
            alert("로그인이 필요한 항목입니다.");
        } else if(uid != qnaid){
			alert("본인이 쓴글이 아닙니다")    
			console.log(qnaid)    
        }else{
            location.href = "updateQNA.do";
        }
    }
    
function QNAdelete(uid) {
        if (uid == null || uid == '' || uid == 'undefined') {
            alert("로그인이 필요한 항목입니다.");
        }else if(uid != qnaid){
			alert("본인이 쓴글이 아닙니다")    
			console.log(qnaid)    
        }else{
           let con_test = confirm("정말로 삭제하시겠습니까?");
			if(con_test == true){
				let s = $(document.fm.qna_num).val();
				let w = $(document.fm.qna_writer).val();
				let f = $(document.fm.qna_filename).val();			
				location.href = "deleteQNA.do?qna_num="+s+"&qna_filename="+f+"&qna_writer="+w;
			}
			else if(con_test == false){
			  	return false;
			}
        }
    }
    
function updatePasswordField(checkbox) {
    var passwordField = document.getElementById("qna_password");

    passwordField.disabled = !checkbox.checked;
    var qnaSecretInput = document.getElementById("qna_secret");
    var qnaSecretValue = checkbox.checked; // 체크박스의 상태(true 또는 false)를 가져옴
    qnaSecretInput.value = qnaSecretValue;

  if (!checkbox.checked) {
        passwordField.value = "";
    }
}
    
function togglepw(checkbox) {
	  const textbox_elem = document.getElementById('qna_password');
	  textbox_elem.disabled = checkbox.checked ? false : true;
	  if(textbox_elem.disabled) {
	    textbox_elem.value = null;
	  }else {
	    textbox_elem.focus();
	  }
	}

$(document).ready(function(){ 
	$("#QNAListget").click(function(){
	location.href = "getQNAList.do";
	});

	});