<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>보여주는 페이지</title>
</head>
<body>
	<h1>${board.title}</h1>
	<br /> 내용 : ${board.contents}
	<br /> 이미지 :

	<!-- 파일안올리면그림안보이기 아직구현못함  -->
	<c:if test="${not empty board.fileName}">
		<img src="/images/${board.fileName}" height="200" width="200" />
	</c:if>


	<form name="modifiy" method="post" action="/board/${board.id}/modifiy">
		<input type="submit" value="내용수정">
	</form>

	<form name="delete" method="post" action="/board/${board.id}/delete">
		<input type="submit" value="삭제">
	</form>

	<form name="boardlist" method="post" action="/board/">
		<input type="submit" value="보드리스트">
	</form>

	<!-- 댓글달기 -->
	<c:forEach items="${board.getComments()}" var="board"> 
	    ${board.contents}<br />
		<hr />
		
	</c:forEach>

	<form name="comment" method="post" action="/board/${board.id}/comments">
		<textarea name="contents" rows="5" cols="60"></textarea>
		<input type="submit" value="댓글달기">
	</form>




</body>
</html>