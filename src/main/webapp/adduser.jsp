<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입</h1>
	
	<form method="post" action="insert.jsp">
		<label>아이디</label>
		<input type="text" name="id"><br/>
		<label>비밀번호</label>
		<input type="text" name="pw"><br/>
		<label>이름</label>
		<input type="text" name="name"><br/>
		<input type="submit" value="가입">	
	</form>
</body>
</html>