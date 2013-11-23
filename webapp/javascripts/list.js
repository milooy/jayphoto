function initPage() {
	console.log('로딩되버렸다...');
	countComments();
	registerEvents();
}

function countComments() {
	// 코딩하기
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
	// 이벤트 추가하기
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
	e.preventDefault(); // a태그클릭했을때 스크롤이동방지
}
// 클릭 이벤트 핸들러 등록
function eventHandle() {
	var formList = document.querySelectorAll('#comment input[type=submit]');
	for ( var j = 0; j < formList.length; j++) {
		formList[j].addEventListener('click', writeComments, false);
	}
}

function writeComments(e) {
	e.preventDefault(); // submit이 자동으로 동작되는 것을 막는다
	var eleForm = e.currentTarget.form; // form element
	var oFormData = new FormData(eleForm); // form data들을 자동으로 묶어준다.
	var sID = eleForm[0].value; // 현재페이지의 ID값을 확인한다.
	var url = "/board/" + sID + "/comments.json"; // 서버로 보낼 주소

	var request = new XMLHttpRequest();
	request.open("POST", url, true);

	request.onreadystatechange = function() {
		if (request.readyState == 4 && request.status == 200) {
			/* console.log(“응답이 왔어요~”); */
			var obj = JSON.parse(request.responseText);
			var eleCommentList = eleForm.parentNode.previousElementSibling;
			eleCommentList.insertAdjacentHTML("beforeend", "<p><span>"
					+ obj.contents + "</span></p>");
		};
	};

	request.send(oFormData);
}
window.onload = initPage;





window.addEventListener('load', function() {
	console.log('로딩되버렸다...');
	countComments();
	registerEvents();
	testtest();
	
}, false);


function testtest() {
	document.getElementById('logo').addEventListener('click', function(e) {
		e.target.style.backgroundColor="red";
		console.log(e.target.innerHTML);
		console.log(e.layerX);
		console.log(e.target.baseURI);
		console.log(e.target.childNodes);
	}, false);
	
	document.getElementById('top').addEventListener('hover', function(e) {
		e.
	})

}

