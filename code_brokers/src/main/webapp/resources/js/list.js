$.ajaxSetup ({
	type: "post",
	dataType : "text",
	error : function(xhr) {
		alert("error : " + xhr.statusText);
	}	
})

$(function() {
	$("#writeBtn").on("click", function() {
		$.ajax ({
			url : "/codeBrokers/writeForm.bbs",
			data : {
				category : $("input[name=category]").val()
			},
			success : function(data) {
				$("#content").html(data);
			} 
		})
	})

})