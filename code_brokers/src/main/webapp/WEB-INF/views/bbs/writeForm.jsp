<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="writeForm">
	<form action="/codeBrokers/write.bbs" method="post" id="frm"> 
		<div id="title">
			<input type="text" class="form-control" name="title" placeholder="제목을 입력하세요.">
		</div>
	    <textarea name="content" id="smarteditor" rows="10" cols="100" style="width:890px; height:412px;"></textarea>
	    <div id="saveFormBtn">
	    	<button class="btn btn-default" id="savebutton" type="submit">등록</button>
	    	<button class="btn btn-default" id="cancelSave" type="button">취소</button>
	    </div>
	    <input type="hidden" name="category" value="${category}">
	</form>
</div>
<script>
$(function() {
    //전역변수선언
    var editor_object = [];
     
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
    	document.location.href="./list.bbs?pageNum=1";
    })
})
</script>
