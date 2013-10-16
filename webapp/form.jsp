<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>사진올려버렷!</h1>
	<form action="/board" method="post" enctype="multipart/form-data">
		제목 : <input type="text" name="title"><br>
		<textarea rows="5" cols="30" name="contents">라라루리라 </textarea>
		
		<input type="file" name="file" size=30><br>
		<input type="submit" value="Upload File" />
	</form>
</body>
</html>