<%@page import="com.mongodb.client.MongoCursor"%>
<%@page import="com.mongodb.client.MongoCollection"%>
<%@page import="com.mongodb.client.MongoDatabase"%>
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
	
	MongoClient client = new MongoClient("localhost", 27017);
	MongoDatabase db = client.getDatabase("db01");
	MongoCollection<Document> collection = db.getCollection("user");
	
	BasicDBObject query = new BasicDBObject("id", id);
	
	
	MongoCursor<Document> cursor = collection.find(query).iterator();
 	
	while (cursor.hasNext()) {
	 		Document doc = cursor.next();
	 		String name = doc.getString("name");
	 		
	 		if(pw.equals(doc.get("pw"))) {
	 			session.setAttribute("userName",name);
	 			
	 			out.println("<h1>로그인 성공</h1>");
	 			out.println("<a href='index.jsp'>처음으로</a>");
	 		}else {
	 			out.println("<h1>로그인 실패</h1>");
	 			out.println("<a href='index.jsp'>처음으로</a>");
	 		}
     }	
	
	client.close();
	
%>
</body>
</html>