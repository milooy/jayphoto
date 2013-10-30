 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>보여주는 페이지</title>
<link rel= "stylesheet" media="screen" type="text/css" href="/stylesheets/newShow.css" />

<script>
	function initPage() {
		console.log('로딩되버렸다...');
		countComments();
		registerEvents();
	}
	
	function countComments() {
		//코딩하기 
		var commentList = document.querySelectorAll('#commentArea');
		
		for(var i=0; i<commentList.length; i++) {
			var currentNode = commentList[i];
			var nPlistCount = currentNode.querySelectorAll('p').length;
			console.log(nPlistCount);
		}
		document.getElementById('commentNum').innerHTML="댓글수: " + nPlistCount;
	}
	
	function registerEvents(){
		//이벤트 추가하기 
		var eleList = document.getElementsByClassName('commentClick');	 
		for(var i=0; i<eleList.length; i++) {
			eleList[i].addEventListener('click', toggleComments, false);
		}
	}
	
	function toggleComments(e) {
		var commentBodyNode = e.target.parentNode.nextElementSibling;
		var ssstyle = getComputedStyle(commentBodyNode).display;
		
		if(ssstyle=="none") {
			commentBodyNode.style.display = "inherit";
		} else {
			commentBodyNode.style.display = "none";
		} 
		e.preventDefault();	//a태그클릭했을때 스크롤이동방지 
		
	}
	
	window.onload = initPage;
</script>

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
	
	<div id="commentNum">
	</div>	
	
	<div class = "commentClick">
		<a href="#">댓글보여줘</a>
	</div>
	
	<div id="commentArea">	
	
		
		<div id="commentList">
			<!-- 댓글달기 -->
			
			<c:forEach items="${board.getComments()}" var="board"> 
				<p>${board.contents}<br /></p>
				<hr>
			</c:forEach>
		</div>
		
		<div id="comment">
			<form name="comment" method="post" action="/board/${board.id}/comments">
				<textarea name="contents" rows="3" cols="80" placeholder="Leave a comment"></textarea>
				<span><input type="submit" value="댓글달기"></span>
			</form>
		</div>
	</div>


</div>
</body>
</html>