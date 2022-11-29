<%@ page import="com.mongodb.MongoClient" %>
<%@ page import="com.mongodb.DB" %>
<%@ page import="com.mongodb.DBCollection" %>
<%@ page import="com.mongodb.BasicDBObject" %>
<%@ page import="com.mongodb.DBCursor" %>
<%@ page import="org.bson.Document" %>
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
	
	MongoClient mongo = new MongoClient("localhost", 27017);
	DB db = mongo.getDB("db");
	DBCollection table = db.getCollection("user");
	
	BasicDBObject query = new BasicDBObject("id", id);
	DBCursor cursor = table.find(query);
	cursor.hasNext();
	Document doc = (Document) cursor.next();
	
	String name = doc.getString("name");
	
	if(pw.equals(doc.get("pw"))) {
		session.setAttribute("userName",name);
		System.out.println("로그인 성공");
		response.sendRedirect("index.jsp");
	}else {
		System.out.println("로그인 실패");
		response.sendRedirect("firstView.jsp");
	}
%>
</body>
</html>