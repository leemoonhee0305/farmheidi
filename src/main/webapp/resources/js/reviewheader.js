function selTrReview(val){
	location.href = "getReview.do?review_num="+val;
}

$(document).ready(function(){ 
	$("#Reviewinsert").click(function(){
	location.href = "insertReview.do";
	});



	$("#ReviewListget").click(function(){
	location.href = "getReviewList.do";
	});

	$("#Reviewupdate").click(function(){
	location.href = "updateReview.do";
	});



	
	$("#Reviewdelete").click(function(){
			let con_test = confirm("정말로 삭제하시겠습니까?");
			if(con_test == true){
				let s = $(document.fm.review_num).val();
				let w = $(document.fm.review_writer).val();
				let f = $(document.fm.review_filename).val();			
				location.href = "deleteReview.do?review_num="+s+"&review_filename="+f+"&review_writer="+w;
			}
			else if(con_test == false){
			  	return false;
			}
	
	});
	});