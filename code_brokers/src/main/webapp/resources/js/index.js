$.ajaxSetup ({
	type: "post",
	dataType : "text",
	error : function(xhr) {
		alert("error : " + xhr.statusText);
	}	
})

$(function() {
	var loginModalLayer = $("#loginModalLayer");
	var modalLink = $(".modalLink");
	var loginView = $(".loginView");
	var marginLeft = loginView.outerWidth() / 2;
	var marginTop = loginView.outerHeight() / 2;
	
	modalLink.on("click", function(event) {
		event.preventDefault();
		wrapWindowByMask();
		loginModalLayer.fadeIn("fast");
		loginView.css({"margin-top": -marginTop, "margin-left": -marginLeft, "border-radius": "0.3em"});
		$("#id").focus();
	})
	
	$(".loginView .glyphicon").on("click", function() {
		loginModalLayer.fadeOut("fast");
		$("#mask").hide();
	})
	
	$("#mask").on("click", function() {
		$(this).hide();
		loginModalLayer.hide();
	})
	
	$("ul.nav li.dropdown").hover(function() {
		$(this).find(".dropdown-menu").stop(true, true).delay(10).fadeIn(200);
	}, function() {
		$(this).find(".dropdown-menu").stop(true, true).delay(10).fadeOut(200);
	})
	
	$("#writeBtn").on("click", function() {
		alert("aaa");
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
	
	$("#showNotice").on("click", function() {
		event.preventDefault();
		$.ajax ({
			url : "/codeBrokers/list.bbs?pageNum=1&category=notice",
			success : function(data) {
				$("#content").html(data);
			}
		})
	})
	
	$("#showApiLab").on("click", function() {
		event.preventDefault();
		$.ajax ({
			url : "/codeBrokers/list.bbs?pageNum=1&category=apiLab",
			success : function(data) {
				$("#content").html(data);
			}
		})
	})
	
	$("#showPatternLab").on("click", function() {
		event.preventDefault();
		$.ajax ({
			url : "/codeBrokers/list.bbs?pageNum=1&category=patternLab",
			success : function(data) {
				$("#content").html(data);
			}
		})
	})
	
	$("#showExceptionLab").on("click", function() {
		event.preventDefault();
		$.ajax ({
			url : "/codeBrokers/list.bbs?pageNum=1&category=exceptionLab",
			success : function(data) {
				$("#content").html(data);
			}
		})
	})
	
	$("#showKnowhow").on("click", function() {
		event.preventDefault();
		$.ajax ({
			url : "/codeBrokers/list.bbs?pageNum=1&category=knowhow",
			success : function(data) {
				$("#content").html(data);
			}
		})
	})
	
	$("#showQna").on("click", function() {
		event.preventDefault();
		$.ajax ({
			url : "/codeBrokers/list.bbs?pageNum=1&category=qna",
			success : function(data) {
				$("#content").html(data);
			}
		})
	})
	
	$("#showFree").on("click", function() {
		event.preventDefault();
		$.ajax ({
			url : "/codeBrokers/list.bbs?pageNum=1&category=free",
			success : function(data) {
				$("#content").html(data);
			}
		})
	})
	
	$("#showTest").on("click", function() {
		event.preventDefault();
		$.ajax ({
			url : "/codeBrokers/test.bbs",
			success : function(data) {
				$("#content").html(data);
			}
		})
	})

})

function wrapWindowByMask() {
	var maskHeight = $(document).height();
	var maskWidth = $(window).width();
	
	$("#mask").css({"width": maskWidth, "height": maskHeight});
	$("#mask").fadeIn("fast");
	$("#mask").fadeTo("fast", 0.4);
}
