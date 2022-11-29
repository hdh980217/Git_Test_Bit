<%@page import="com.mongodb.BasicDBObject"%>
<%@ page import="java.util.List" %>

<%@ page import="com.mongodb.client.MongoClients" %>
<%@ page import="com.mongodb.client.MongoDatabase" %>
<%@ page import="com.mongodb.client.MongoCollection" %>
<%@ page import="org.bson.Document" %>
<%@ page import="com.mongodb.client.MongoCursor" %>
<%@ page import="com.mongodb.MongoClient" %>
<%@ page import="java.rmi.UnknownHostException" %>
<%@ page import="java.util.Objects" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    //  List<Member> list = (List<Member>) session.getAttribute("list");

    String db = "db01";
    String table = "board";
    String title = (String) request.getParameter("title");
    MongoClient mongoClient = new MongoClient();
    MongoDatabase mongoDb = mongoClient.getDatabase(db);
    MongoCollection<Document> collection = mongoDb.getCollection(table);
    
	BasicDBObject query = new BasicDBObject("title", title);

    MongoCursor<Document> cursor = collection.find(query).iterator();
    String content = null;
    String name = null;
    while (cursor.hasNext()) {
 		Document doc = cursor.next();
 		content = doc.getString("content");
 		name = doc.getString("name");
 	}	

    if(Objects.isNull(session)){
        response.sendRedirect("firstView.jsp");
    }

%>
<title>CSS</title>
<style>
    table {
        width: 100%;
        border: 1px solid #444444;
        border-collapse: collapse;
    }
    th, td {
        background-color: lemonchiffon;
        border: 1px solid #444444;
        padding: 10px;
    }
</style>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<table>

    <tr><th>제목</th><th>작성자</th>
    <tr>
        <td><%=title%> </td>
        <td><%=name%> </td>
    </tr>
    <tr>
        <th>내용</th>
    </tr>
    <tr>
        <td><%=content%> </td>
    </tr>

    <a href="thirdView.jsp"><h2>목록으로</h2></a>
</table>
</body>
</html>
