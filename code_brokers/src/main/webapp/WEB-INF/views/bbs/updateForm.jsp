<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="writeForm">
	<form action="/codeBrokers/update.bbs" method="post" id="frm"> 
		<div id="title">
			<input type="text" class="form-control" name="title" value="${article.title}">
		</div>
	    <textarea name="content" id="smarteditor" rows="10" cols="100" style="width:890px; height:412px;"></textarea>
	    <div id="saveFormBtn">
	    	<button class="btn btn-default" id="savebutton" type="submit">등록</button>
	    	<button class="btn btn-default" id="cancelSave" type="button">취소</button>
	    </div>
	    <input type="hidden" name="category" value="${article.category}">
		<input type="hidden" name="articleNum" value="${article.articleNum}">
		<input type="hidden" name="pageNum" value="${pageNum}">		
	</form>		
</div>
<input type="hidden" name="content" value="${article.content}">

<script>
$(function() {
    //전역변수선언
    var editor_object = [];
    var content = $("input[name=content]").val();
     
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: editor_object,
        elPlaceHolder: "smarteditor",
        sSkinURI: "resources/editor/SmartEditor2Skin.html", 
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,             
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,     
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true, 
        }, 
        fOnAppLoad : function() {
        	editor_object.getById["smarteditor"].exec("PASTE_HTML", [content]);
        }
    });
     
    //전송버튼 클릭이벤트
    $("#savebutton").click(function(){
        //id가 smarteditor인 textarea에 에디터에서 대입
        editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
         
        // 이부분에 에디터 validation 검증
         
        //폼 submit
        $("#frm").submit();
    })
    
    $("#cancelSave").on("click", function() {
    	var category = $("input[name=category]").val();
    	var pageNum = $("input[name=pageNum]").val();
    	var articleNum = $("input[name=articleNum]").val();
    	document.location.href="./content.bbs?articleNum=" + articleNum + "&pageNum=" + pageNum + "&category=" + category;
    })
})
</script>
