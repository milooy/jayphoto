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
	//this fixes an issue with the old method, ambiguous values
	//with this test document.cookie.indexOf( name + "=" );
	function Get_Cookie( check_name ) {
		// first we'll split this cookie up into name/value pairs
		// note: document.cookie only returns name=value, not the other components
		var a_all_cookies = document.cookie.split( ';' );
		var a_temp_cookie = '';
		var cookie_name = '';
		var cookie_value = '';
		var b_cookie_found = false; // set boolean t/f default f
	
		for ( i = 0; i < a_all_cookies.length; i++ )
		{
			// now we'll split apart each name=value pair
			a_temp_cookie = a_all_cookies[i].split( '=' );
	
	
			// and trim left/right whitespace while we're at it
			cookie_name = a_temp_cookie[0].replace(/^\s+|\s+$/g, '');
	
			// if the extracted name matches passed check_name
			if ( cookie_name == check_name )
			{
				b_cookie_found = true;
				// we need to handle case where cookie has no value but exists (no = sign, that is):
				if ( a_temp_cookie.length > 1 )
				{
					cookie_value = unescape( a_temp_cookie[1].replace(/^\s+|\s+$/g, '') );
				}
				// note that in cases where cookie is initialized but no value, null is returned
				return cookie_value;
				break;
			}
			a_temp_cookie = null;
			cookie_name = '';
		}
		if ( !b_cookie_found )
		{
			return null;
		}
	}

	
	
	
	
	function initPage() {
		console.log('로딩되버렸다...');
		countComments();
		registerEvents();
		eventHandle();
		
		if (Get_Cookie('open') == 'true')
		{
			var commentBodyNode = document.getElementById('commentArea')
			commentBodyNode.style.display = "inherit";
		}
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
			document.cookie = "open=true";
		} else {
			commentBodyNode.style.display = "none";
			document.cookie = "open=false";
		} 
		e.preventDefault();	//a태그클릭했을때 스크롤이동방지 
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
				<input type="hidden" name="id" value="${board.id}" />
				<textarea name="contents" rows="3" cols="80" placeholder="Leave a comment"></textarea>
				<input type="submit" value="댓글쓰기"/>
				<!-- <span><input type="submit" value="댓글달기"></span> -->
			</form>
		</div>
	</div>


</div>
</body>
</html>