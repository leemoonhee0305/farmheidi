$(document).ready(function(){ 
	$( window ).resize(function() {
		var windowWidth = $( window ).width();
		if(windowWidth >= 978) {
			$("#subNavMenu").hide();
		}
	});
	
	$("#clMenu").click(function(){
		$("#subNavMenu").toggle();
	});
	
	$("#conWrite").click(function(){
		location.href = "insertNotice.do";
	});
	
	$("#conDel").click(function(){
		let con_test = confirm("정말로 삭제하시겠습니까?");
		if(con_test == true){
			let s = $(document.fm.notice_num).val();
			let w = $(document.fm.notice_writer).val();
			let f = $(document.fm.notice_filename).val();			
			location.href = "deleteNotice.do?notice_num="+s+"&notice_filename="+f+"&notice_writer="+w;
		}
		else if(con_test == false){
		  	return false;
		}
	});
	
	$("#conList").click(function(){
		location.href = "getNoticeList.do";
	});
});

function selTr(val){
	location.href = "getNotice.do?notice_num="+val;
}




function toggleBox(){
	$(function(){
		$('.hamberger').click(function(){
			$('.hamberger').addClass('active');
			$('#stNav').addClass('active');
			$('#active-box').addClass('bye');
		});
	});
	
	$(function(){
		$('.hamberger.active').click(function(){
			$('.hamberger.active').removeClass('active');
			$('#stNav.active').removeClass('active');
			$('#active-box.bye').removeClass('bye');
		});
	});
}




	


