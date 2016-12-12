$(function() {
    var id = $("input[name=id]").val();
    
    $("#joinForm").on("submit", function() {
    	if (id = "") {
    		alert("아이디를 입력하세요.");
    		$("input[name=id]").focus();
    		return false;
    	}
    	
    	for (i = 0; i < id.length; i++) {
    		chk = id.charAt(i);
    		if (!(chk >= 0 && chk <= 9) && !(chk >= "a" && chk <= "z")) {
    			alert("아이디는 소문자, 숫자만 입력 가능합니다.");
    			$("input[name=id]").focus();
    			$("input[name=id]").select();
    			return false;
    		}
    	}
    })
})