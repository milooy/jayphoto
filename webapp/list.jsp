<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Timeline</title>
	<link rel="stylesheet" media="screen" type="text/css" href="/stylesheets/newList.css" />
	<link href='http://fonts.googleapis.com/css?family=Patrick+Hand+SC' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Just+Me+Again+Down+Here' rel='stylesheet' type='text/css'>



   <script type="text/javascript" src="/javascripts/list.js"></script>


<script>
	
</script>
</head>




<body>


	<!-- 상단의 재규어로고 고정 -->
	<div style="z-index: 99; top: 0px; left: 0px; right: 0px; position: absoulte !important; position: fixed;">
		<div id="roundline"><img src="./images/underline.png" width="850px"></div>
		<div id="logo">Moves like Jaguar</div>
		<!-- <span id="topList"> <a href="/board/form"><input type="button" value="글쓰기" /></a></span> -->
	</div>	

	<!-- 위로가기 -->
	<div style="z-index: 99; bottom: 5px; right: 5px; margin: 30px; position: absoulte !important; position: fixed;">
		<div id="top"><a href="#"><img src="./images/top.png"></a></div>
	</div>
		
	<!--상단의 글쓰는페이지-->
	<div id="formArea">
		<form action="/board" method="post" enctype="multipart/form-data">
			<div id="leave">Leave your Jaguar</div>
			<div id=title>Title : <input type="text" name="title"><br></div>
			<textarea rows="10" cols="70" name="contents" placeholder="Leave your Instant Message"></textarea>
			<!-- <input type="file" name="file" size=30 /><img src="./images/upload.png"><input id="upload" type="submit" value="Upload" /> -->
			<input type="file" name="file" size=30 /><input type="image" src="./images/upload.png" id="upload" type="submit" value="Upload" />
		</form>
	</div>

<!-- 테스트 -->
	<!-- <ul class="ch-grid">
		<li>
        <div class="ch-item">
            <div class="ch-info">
                <h3>Use what you have</h3>
                <p>by Angela Duncan <a href="http://drbl.in/eOPF">View on Dribbble</a></p>
            </div>
        </div>
        </li>
     </ul> -->


 	<c:forEach items="${boards}" var="board">
 	<div id="boarditem">
		<ul class="ch-grid">
			<li>
	        <div class="ch-item" style="background-image: url(../images/${board.fileName}); background-size:400px 400px;">
	            <div class="ch-info">
	                <h3><div id="b_title">"${board.title}"</div></h3>
	                <p>by Angela Duncan<a href="http://drbl.in/eOPF">View on Dribbble</a></p>
	            </div>
	        </div>
	        </li>
	     </ul>
	            <div id="b_title">"${board.title}"</div>
				<div id="b_contents">${board.contents}</div>
				
		<div id="button">
				<form name="modifiy" method="post" action="/board/${board.id}/modifiy">
				<input type="submit" value="내용수정">
				</form>
			
			    <!-- 삭제도 구현해야함 -->
				<form name="delete" method="post" action="/board/${board.id}/delete">
					<input type="submit" value="삭제">
				</form>
			</div>
			
			<div class="commentNum"></div>	
			<div class = "commentClick"><a href="#">댓글보여줘</a></div>
			
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







<!-- for문을 돌며 보드에 게시물을 하나씩 올리기.. -->


<!-- 레알버전 -->

<%-- 
 	<c:forEach items="${boards}" var="board">
		<div id="boarditem">
			<div id="itembox">
				<!-- 파일안올리면그림안보이기 아직구현못함  -->
				<c:if test="${not empty board.fileName}">
					<img src="/images/${board.fileName}" id = "b_image" height="350" width="350" />
				</c:if>
				<div id="b_title">"${board.title}"</div>
				<div id="b_contents">${board.contents}</div>
			</div>
			
			<div id="button">
				<form name="modifiy" method="post" action="/board/${board.id}/modifiy">
				<input type="submit" value="내용수정">
				</form>
			
			    <!-- 삭제도 구현해야함 -->
				<form name="delete" method="post" action="/board/${board.id}/delete">
					<input type="submit" value="삭제">
				</form>
			</div>
			
			<div class="commentNum"></div>	
			<div class = "commentClick"><a href="#">댓글보여줘</a></div>
			
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
	</c:forEach> --%>
	
	
	
	
	<footer>Copyright © 2013 by Jay Jin. All rights reserved</footer>
</body>
</html>