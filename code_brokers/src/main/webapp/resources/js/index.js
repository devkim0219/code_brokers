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
		$("#loginId").focus();
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
})

function wrapWindowByMask() {
	var maskHeight = $(document).height();
	var maskWidth = $(window).width();
	
	$("#mask").css({"width": maskWidth, "height": maskHeight});
	$("#mask").fadeIn("fast");
	$("#mask").fadeTo("fast", 0.4);
}
