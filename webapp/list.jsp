<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리스트지롱</title>
</head>
<body>
	<h1>여기는 게시물 리스트 입니다</h1>
<!-- for문을 돌며 보드에 게시물을 하나씩 올리고.. -->
	<c:forEach items="${boards}" var="board"> 
	${board.title}<br />
	<hr />
	</c:forEach>
</body>
</html>