<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>	

<div id="h3"><h3>회원가입</h3></div>
<form action="/codeBrokers/join.member" method="post" id="joinForm">
	<div class="joinForm">
		<label>아이디</label>
		<input type="text" class="form-control"name="id" placeholder="영문, 숫자 포함 6~12자">
		<label>비밀번호</label>
		<input type="password" class="form-control" name="password" placeholder="영문, 숫자 포함 8~14자">
		<label>비밀번호 확인</label>
		<input type="password" class="form-control" name="password2" placeholder="한번 더 입력해 주세요.">
		<label>이메일</label>
		<input type="text" class="form-control" name="email" placeholder="example@gamil.com">
		<label>닉네임</label>
		<input type="text" class="form-control" name="nickname" placeholder="한글 2~6자 or 영문 6~12자">
		<label>메일링 가입</label>
		<input type="radio" name="mailPermit" value="yes" checked="checked">&nbsp;예
		<p><input type="radio" name="mailPermit" value="no">&nbsp;아니오</p>
		<label>쪽지 허용</label>
		<input type="radio" name="notePermit" value="all" checked="checked">&nbsp;모두 허용
		<p><input type="radio" name="notePermit" value="friends">&nbsp;등록된 친구만 허용</p>
		<p><input type="radio" name="notePermit" value="ignore">&nbsp;모두 무시</p>
	</div>
	<div class="submitDiv">
		<button class="btn btn-default" id="cancel" type="button" onclick="location.href='/codeBrokers/index.bbs'">취소</button>
		<button class="btn btn-primary" id="join" type="submit">등록</button>
	</div>
</form>
