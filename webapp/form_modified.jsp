<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Modify momomo</title>
</head>
<body>
	<h1>modifiy</h1>
	<div>
		<h2>수정 전</h2>
		제목 : ${board.title} 
		<br /> 내용 : ${board.contents} 
		<br /> 이미지 : <img src="/images/${board.fileName}" height="200" width="200" />

		<h2>수정 사항</h2>
		<form action="/board/${board.id}/complete" method="post" enctype="multipart/form-data">
			<textarea name="contents" rows="10" cols="50">내용 </textarea>
			<br /> <input type="file" name="imageName"> <input type="submit" value="수정완료">
		</form>
	</div>

</body>
</html>