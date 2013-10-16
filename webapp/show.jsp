<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>${board.title}</h1>
	 <br /> 내용 : ${board.contents}
        <br /> 이미지 :
        <img src="/images/${board.fileName}" height="200" width="200" />

        <form name="modifiy" method="post" action="/board/${board.id}/modifiy">
                <input type="submit" value="내용수정">
        </form>

        <form name="delete" method="post" action="/board/${board.id}/delete">
                <input type="submit" value="삭제">
        </form>

</body>
</html>