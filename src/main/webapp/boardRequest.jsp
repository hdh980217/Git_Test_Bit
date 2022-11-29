<%@ page import="com.mongodb.client.MongoClient" %>
<%@ page import="com.mongodb.client.MongoClients" %>
<%@ page import="com.mongodb.client.MongoDatabase" %>
<%@ page import="org.bson.Document" %>

<%@ page import="com.mongodb.client.MongoCollection" %>
Created by IntelliJ IDEA.
User: ahngilung
Date: 2022/11/23
Time: 2:43 PM
To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    MongoClient mongo =  MongoClients.create();
    MongoDatabase database = mongo.getDatabase("db01");
    MongoCollection<Document> collection = database.getCollection("board");
    String name = (String) session.getAttribute("userName");
    String title = (String) request.getParameter("title");
    String content = (String) request.getParameter("content");
    Document document = new Document()
            .append("name",name)
            .append("title",title)
            .append("content",content);
    collection.insertOne(document);
    response.sendRedirect("/thirdView.jsp");
%>
<html>
<head>
    <title>요청 중..</title>
</head>
<body>

</body>
</html>