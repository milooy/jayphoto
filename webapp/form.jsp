<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel= "stylesheet" media="screen" type="text/css" href="/stylesheets/newWrite.css" />
</head>
<body>
<div id="wrap">
	<header>
		<h1><b>사진올려버렷!</b></h1>
	</header>
	
	<div id="formArea">
	<form action="/board" method="post" enctype="multipart/form-data">
		<div id=title>
			제목 : <input type="text" name="title"><br>
		</div>
		<textarea rows="13" cols="30" name="contents" placeholder="예쁜 글을 남겨주세요~"></textarea>
		
		<input type="file" name="file" size=30 />
		<input type="submit" value="Upload File" />
		
	</form>
	</div>
</div>
</body>
</html>