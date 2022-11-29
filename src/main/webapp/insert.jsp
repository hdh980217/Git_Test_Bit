<%@page import="org.bson.Document"%>
<%@page import="com.mongodb.client.MongoCollection"%>
<%@page import="com.mongodb.client.MongoDatabase"%>
S<%@page import="com.mongodb.MongoClient"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("EUC-KR");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
 
	MongoClient client = new MongoClient("localhost", 27017);
	MongoDatabase db = client.getDatabase("db01");
	MongoCollection<Document> collection = db.getCollection("user");
	
	//insert
	Document document = new Document();
	
	document.append("id", id);
	document.append("pw", pw);
	document.append("name", name);
	
	collection.insertOne(document);
	
	client.close();

	
 %>
 
 <h1>회원 가입 완료</h1>
 <a href='index.jsp'>처음으로</a>
</body>
</html>