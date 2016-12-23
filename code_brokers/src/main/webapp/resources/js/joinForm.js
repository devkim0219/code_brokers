$(function() {
    $("#joinForm").on("submit", function() {
    	var inputId = $(".joinForm input[name=id]");
    	var inputPassword = $(".joinForm input[name=password]");
    	var id = $(".joinForm input[name=id]").val();
    	var password = $(".joinForm input[name=password]").val();
    	
    	if (id == "") {
    		alert("아이디를 입력하세요.");
    		$(inputId).focus();
    		return false;
    	}
    	
    	for (var i = 0; i < id.length; i++) {
    		chk = id.charAt(i);
    		if (!(chk >= 0 && chk <= 9) && !(chk >= "a" && chk <= "z")) {
    			alert("아이디는 영문 소문자, 숫자만 입력 가능합니다.");
    			$(inputId).val("");
    			$(inputId).focus();
    			return false;
    		}
    	}
    	
    	if (id.indexOf(" ") >= 0) {
    		alert("아이디에 공백을 사용할 수 없습니다.");
    		$(inputId).val("");
    		$(inputId).focus();
    		return false;
    	}
    	
    	if ((id.charAt(0) >= 0) && (id.charAt(0) <= 9)) {
    		alert("아이디 첫글자에 숫자가 올 수 없습니다.");
    		$(inputId).val("");
    		$(inputId).focus();
    		return false;
    	}
    	
    	if (id.length < 6 || id.length > 12) {
    		alert("아이디를 6~12자까지 입력해주세요.");
    		$(inputId).val("");
    		$(inputId).focus();
    		return false;
    	}
    	
    	if (password == "") {
    		alert("비밀번호를 입력하세요.");
    		$(inputPassword).val("");
    		$(inputPassword).focus();
    		return false;
    	}
    	
    	if (password.length < 8 || password.length > 14) {
    		alert("비밀번호를 8~14자까지 입력해주세요.");
    		$(inputPassword).val("");
    		$(inputPassword).focus();
    		return false;
    	}

    	for (var i = 0; password.length; i++) {
    		chk = password.charAt(i);
    		if (!(chk >= 0 && chk <= 9) && !(chk >= "a" && chk <= "z")) {
    			alert("비밀번호는 영문 소문자, 숫자만 입력 가능합니다.");
    			$(inputPassword).val("");
    			$(inputPassword).focus();
    			return false;
    		}
    	}
    		
//    	for (i = 0; password.length; i++) {
//    		chk = password.charAt(i);
//    		if ((chk >=0 && chk <= 9) && !(chk >= "a" && chk <= "z")) {
//    			alert("영문 소문자, 숫자가 조합된 비밀번호만 가능합니다.");
//    			$(inputPassword).val("");
//    			$(inputPassword).focus();
//    			return false;
//    		}
//    		
//    		if (!(chk >=0 && chk <=9) && (chk >= "a" && chk <= "z")) {
//    			alert("영문 소문자, 숫자가 조합된 비밀번호만 가능합니다.");
//    			$(inputPassword).val("");
//    			$(inputPassword).focus();
//    			return  false;
//    		}
//    	}
    	
    })
})