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
    MongoClient mongoClient = new MongoClient();
    System.out.println(Objects.isNull(mongoClient));
    MongoDatabase mongoDb = mongoClient.getDatabase(db);
    MongoCollection<Document> collection = mongoDb.getCollection(table);
    MongoCursor<Document> cursor = collection.find().iterator();

    if(Objects.isNull(session)){
        response.sendRedirect("/firstView.jsp");
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
        background-color: cornflowerblue;
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

    <tr><th>제목</th><th>작성자</th><th>삭제</th>
            <%
		while (cursor.hasNext()){
          Document doc = cursor.next();
			%>
    <tr>
    <td> <a href="/detailView.jsp?name=<%=doc.get("title")%>"><h2><%=doc.getString("title")%>></h2></a></td>
        <td> <h2><%=doc.getString("name")%>>/td>
        <td> <a href="/delete.jsp?name=<%=doc.get("title")%>"><h2>삭제</h2></a></td>
    </tr>
    <%
        }
    %>

    <a href="/index.jsp"><h2>홈으로</h2></a>
</table>
</body>
</html>
