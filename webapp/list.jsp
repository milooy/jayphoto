<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리스트지롱</title>
<link rel= "stylesheet" media="screen" type="text/css" href="/stylesheets/newList.css" />
</head>
<body>

<div style="z-index:99;top:0px;left:0px;right:0px;position:absoulte !important; position:fixed;">
상단바 고정. 로그아웃, 글쓰기 등등 들어간다.
</div>


	<div id="topHead"><h1>Timeline</h1></div>

	<span id="topList">
		<a href="/board/form"><input type="button" value="글쓰기" /></a>
	</span>
	
<div id="wrap">
	<div id="formArea">
	<form action="/board" method="post" enctype="multipart/form-data">
		<div id=title>
			Title : <input type="text" name="title"><br>
		</div>
		<textarea rows="10" cols="70" name="contents" placeholder="예쁜 글을 남겨주세요~"></textarea>
		
		<input type="file" name="file" size=30 />
		<input type="submit" value="Upload File" />
		
	</form>
	</div>
</div>	
	
<!-- for문을 돌며 보드에 게시물을 하나씩 올리고.. -->
	<c:forEach items="${boards}" var="board"> 

	
<div id="wrap">
	
	<div id="center">
		<header>
			<h1>${board.title}</h1>
		</header>
		
		<!-- 파일안올리면그림안보이기 아직구현못함  -->
		<c:if test="${not empty board.fileName}">
			<img src="/images/${board.fileName}" height="300" width="300" />
		</c:if>
	
		<br /> 내용 : ${board.contents}
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
	
	
	
	
	
	
	
	</c:forEach>
</body>
</html>