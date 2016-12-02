<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container" id="tableContainer">
	<div class="table-responsive">
		<table class="table table-hover" >
			<thead>
				<tr>
					<th>글번호</th>
					<th>제 &nbsp;&nbsp;&nbsp; 목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>수정일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="article" items="${articleList}">
				<tr>
					<td><c:out value="${article.articleNum}"/></td>					
					<td>
						<c:if test="${article.depth == 1}">
							<img src="resources/image/reply1.png" width="${16 * article.depth}" height="16">
						</c:if>
						<c:if test="${article.depth > 1}">
							<img src="resources/image/reply.png" width="${16 * article.depth}" height="${16 / article.depth}">
							<img src="resources/image/reply1.png" width="16" height="16">
						</c:if>
						<a href="/codeBrokers/content.bbs?articleNum=${article.articleNum}&pageNum=${pageNum}" class="showContent">
							${article.title}
<%-- 							<c:if test="${article.commentCount != 0}"> --%>
<%-- 							<span style="color:red">(${article.commentCount})</span>  --%>
<%-- 							</c:if> --%>
						</a>
					</td>
					<c:if test="${id==null}">
						<td>${article.id}</td>
					</c:if>
					<c:if test="${id!=null}">
						<td><label class="memId">${article.id}</label></td>
					</c:if>
					<td>${article.writeDate}</td>
					<td>${article.updateDate}</td>
					<td>${article.hit}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<div align="center">	  
   			${pageCode}
		</div>
	</div>	
	<button class="btn btn-default" id="writeBtn">글쓰기</button>
	<input type="hidden" name="category" value="${category}">
	<input type="hidden" name="totalCount" value="${totalCount}">
</div>