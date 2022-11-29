<%@ page import="com.mongodb.client.MongoClient" %>
<%@ page import="com.mongodb.client.MongoClients" %>
<%@ page import="com.mongodb.client.MongoDatabase" %>
<%@ page import="org.bson.Document" %>
<%@ page import="com.mongodb.client.MongoCollection" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    MongoClient mongo =  MongoClients.create();
    MongoDatabase database = mongo.getDatabase("db01");
    MongoCollection<Document> collection = database.getCollection("board");
    String title = (String) request.getParameter("title");
    Document query = new Document("name",title);
    collection.deleteOne(query);
    response.sendRedirect("thirdView.jsp");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
