<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리스트지롱</title>
<link rel="stylesheet" media="screen" type="text/css"
	href="/stylesheets/newList.css" />

<script>
	function initPage() {
		console.log('로딩되버렸다...');
		countComments();
		registerEvents();
	}

	function countComments() {
		//코딩하기 
		var commentList = document.querySelectorAll('#commentArea');
		var commentNum = document.getElementsByClassName('commentNum');

		for ( var i = 0; i < commentList.length; i++) {
			var currentNode = commentList[i];
			var nPlistCount = currentNode.querySelectorAll('p').length;
			console.log(nPlistCount);
			
			commentNum[i].innerHTML = "댓글수: " + nPlistCount;
		}
	}

	function registerEvents() {
		//이벤트 추가하기 
		var eleList = document.getElementsByClassName('commentClick');
		for ( var i = 0; i < eleList.length; i++) {
			eleList[i].addEventListener('click', toggleComments, false);
		}
	}

	function toggleComments(e) {
		var commentBodyNode = e.target.parentNode.nextElementSibling;
		var ssstyle = getComputedStyle(commentBodyNode).display;

		if (ssstyle == "none") {
			commentBodyNode.style.display = "inherit";
		} else {
			commentBodyNode.style.display = "none";
		}
		e.preventDefault(); //a태그클릭했을때 스크롤이동방지 

	}

	window.onload = initPage;
</script>

</head>
<body>

	<div
		style="z-index: 99; top: 0px; left: 0px; right: 0px; position: absoulte !important; position: fixed;">
		상단바 고정. 로그아웃, 글쓰기 등등 들어간다.</div>


	<div id="topHead">
		<h1>Timeline</h1>
	</div>

	<span id="topList"> <a href="/board/form"><input
			type="button" value="글쓰기" /></a>
	</span>

	<div id="wrap">
		<div id="formArea">
			<form action="/board" method="post" enctype="multipart/form-data">
				<div id=title>
					Title : <input type="text" name="title"><br>
				</div>
				<textarea rows="10" cols="70" name="contents"
					placeholder="예쁜 글을 남겨주세요~"></textarea>

				<input type="file" name="file" size=30 /> <input type="submit"
					value="Upload File" />

			</form>
		</div>
	</div>

	<!-- for문을 돌며 보드에 게시물을 하나씩 올리고.. -->
	<c:forEach items="${boards}" var="board">
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
	
	<div class="commentNum">
	</div>	
	
	<div class = "commentClick">
		<a href="#">댓글보여줘</a>
	</div>
	
	<div id="commentArea">	
		<div id="commentList">
			<!-- 댓글달기 -->
			
			<c:forEach items="${board.getComments()}" var="comment"> 
				<p>${comment.contents}<br /></p>
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
	</c:forEach>
</body>
</html>