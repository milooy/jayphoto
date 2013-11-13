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
	//클릭 이벤트 핸들러 등록 
	function eventHandle() {
		var formList = document.querySelectorAll('#comment input[type=submit]');
		for ( var j=0 ; j < formList.length ; j++) {
			formList[j].addEventListener('click',writeComments, false);
		}
	}
	
	function writeComments(e){
		e.preventDefault();	//submit이 자동으로 동작되는 것을 막는다 
		var eleForm = e.currentTarget.form; //form element 
		var oFormData = new FormData(eleForm); //form data들을 자동으로 묶어준다.
		var sID = eleForm[0].value; // 현재페이지의 ID값을 확인한다.
		var url = "/board/" +sID + "/comments.json"; // 서버로 보낼 주소	
		
		var request = new XMLHttpRequest();
		request.open("POST" , url, true);
		
		request.onreadystatechange = function() {
			if(request.readyState ==4 && request.status ==200) {
				/* console.log(“응답이 왔어요~”); */
				var obj = JSON.parse(request.responseText);
				var eleCommentList = eleForm.parentNode.previousElementSibling;
		        eleCommentList.insertAdjacentHTML("beforeend" , "<p><span>"+ obj.contents +"</span></p>");
			}; 
		};
		
		request.send(oFormData);
	}
	window.onload = initPage;
</script>
</head>




<body>
	<!-- 상단의 재규어로고 고정 -->
	<div style="z-index: 99; top: 0px; left: 0px; right: 0px; position: absoulte !important; position: fixed;">
		<div id="roundline"><img src="./images/underline.png" width="850px"></div>
		<div id="logo">Moves like Jaguar</div>
		<span id="topList"> <a href="/board/form"><input type="button" value="글쓰기" /></a></span>
	</div>	

	<!--상단의 글쓰는페이지-->
	<div id="formArea">
		<form action="/board" method="post" enctype="multipart/form-data">
			<div id=title>Title : <input type="text" name="title"><br></div>
			<textarea rows="10" cols="70" name="contents" placeholder="예쁜 글을 남겨주세요~"></textarea>
			<input type="file" name="file" size=30 /> <input type="submit" value="Upload File" />
		</form>
	</div>

	<!-- for문을 돌며 보드에 게시물을 하나씩 올리기.. -->
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
		
		
		
		<div id="cbp-so-scroller" class="cbp-so-scroller">
 
    <section class="cbp-so-section">
        <article class="cbp-so-side cbp-so-side-left">
            <h2>Lemon drops</h2>
            <p>Fruitcake toffee jujubes. Topping biscuit sesame snaps jelly caramels jujubes tiramisu fruitcake. Marzipan tart lemon drops chocolate sesame snaps jelly beans.</p>
        </article>
        <figure class="cbp-so-side cbp-so-side-right">
            <img src="images/1.png" alt="img01">
        </figure>
    </section>
 
    <section class="cbp-so-section">
        <figure class="cbp-so-side cbp-so-side-left">
            <img src="images/2.png" alt="img01">
        </figure>
        <article class="cbp-so-side cbp-so-side-right">
            <h2>Plum caramels</h2>
            <p>Lollipop powder danish sugar plum caramels liquorice sweet cookie. Gummi bears caramels gummi bears candy canes cheesecake sweet roll icing dragée. Gummies jelly-o tart. Cheesecake unerdwear.com candy canes apple pie halvah chocolate tiramisu.</p>
        </article>
    </section>
 
    <section>
        <!-- ... -->
    </section>
    <!-- ... -->
     
</div>
		
		
		
		
		
	</c:forEach>
</body>
</html>