$.ajaxSetup ({
	type: "post",
	dataType : "text",
	error : function(xhr) {
		alert("error : " + xhr.statusText);
	}	
})

$(function() {
	var articleNum = $("input[name=articleNum]").val();
	var pageNum = $("input[name=pageNum]").val();
	var category = $("input[name=category]").val();
	
	$(".btn-list").on("click", function() {
		document.location.href="./list.bbs?&pageNum=" + pageNum + "&category=" + category;
	})
	
	$(".btn-update").on("click", function() {
		$.ajax({
			url : "/codeBrokers/updateForm.bbs?articleNum=" + articleNum + "&pageNum=" + pageNum + "&category=" + category,
			success : function(data) {
				$("#content").html(data);
			}
		})
	})
	
	$(".btn-delete").on("click", function() {
		document.location.href="./delete.bbs?articleNum=" + articleNum + "&pageNum=" + pageNum + "&category=" + category;
	})

})