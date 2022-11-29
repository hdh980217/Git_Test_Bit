<%@ page import="java.util.List" %>

<%@ page import="com.mongodb.client.MongoClients" %>
<%@ page import="com.mongodb.client.MongoDatabase" %>
<%@ page import="com.mongodb.client.MongoCollection" %>
<%@ page import="org.bson.Document" %>
<%@ page import="com.mongodb.client.MongoCursor" %>
<%@ page import="com.mongodb.MongoClient" %>
<%@ page import="java.rmi.UnknownHostException" %>
<%@ page import="example.DAOClass" %>
<%@ page import="java.util.Objects" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    //  List<Member> list = (List<Member>) session.getAttribute("list");

    if(Objects.isNull(session)){
        response.sendRedirect("/firstView.jsp");
    }
    MongoCursor<Document> cursor = DAOClass.loadDatabase();

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

    <tr><th>아이디</th><th>삭제</th><th>수정</th>
            <%
		while (cursor.hasNext()){
          Document doc = cursor.next();
			%>
    <tr>
        <td><%=doc.get("title")%></td>
        <td> <a href="/delete.jsp?name=<%=doc.get("title")%>"><h2>삭제</h2></a></td>
        <td><a href="/update.jsp?name=<%=doc.get("title")%>"><h2>수정</h2></a></td>
    </tr>
    <%
        }
    %>

    <a href="/index.jsp"><h2>홈으로</h2></a>
</table>
</body>
</html>
