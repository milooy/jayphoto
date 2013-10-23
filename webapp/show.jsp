 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>보여주는 페이지</title>
<link rel= "stylesheet" media="screen" type="text/css" href="/stylesheets/newShow.css" />
</head>

<body>
<img src="../images/baby1.png" height="100">
<div id="wrap">
	<span id="topList">
		<a href="/board"><input type="button" value="리스트" /></a>
		<a href="/board/form"><input type="button" value="글쓰기" /></a>
	</span>
	
	<div id="center">
		<header>
			<h1>${board.title}</h1>
		</header>
		
		<!-- 파일안올리면그림안보이기 아직구현못함  -->
		<c:if test="${not empty board.fileName}">
			<img src="/images/${board.fileName}" height="300" width="300" />
		</c:if>
		<div class="bubble">
			<p class="label">${board.contents}</p>
			<div class="tail"></div>
		</div>
		
	</div>
	
	<div id="button">
		<form name="modifiy" method="post" action="/board/${board.id}/modifiy">
		<input type="submit" value="내용수정">
		</form>
	
		<form name="delete" method="post" action="/board/${board.id}/delete">
			<input type="submit" value="삭제">
		</form>
		
	</div>
	
	<div id="commentList">
		<!-- 댓글달기 -->
		<c:forEach items="${board.getComments()}" var="board"> 
		    ${board.contents}<br />
			<hr />
		</c:forEach>
	</div>
	
</div>

<div id="comment">
	<form name="comment" method="post" action="/board/${board.id}/comments">
		<textarea name="contents" rows="3" cols="80" placeholder="Leave a comment"></textarea>
		<span><input type="submit" value="댓글달기"></span>
	</form>
</div>

</body>
</html>