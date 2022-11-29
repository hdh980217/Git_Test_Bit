<%--
  Created by IntelliJ IDEA.
  User: ahngilung
  Date: 2022/11/29
  Time: 4:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
%>
<html>
<head>
    <title>board</title>
</head>
<body>
<div class="container">
    <h2>게시판 등록</h2>
    <form id="forms" name="forms" method="post" action="boardRequest.jsp">
        <table class="board_detail">
            <tr>
                <td>제목</td>
                <td><input type="text" id="title" name="title"></td>
            </tr>
            <tr>
                <td colspan="20">
                    <textarea id="content" name="content"></textarea>
                </td>
            </tr>
        </table>
        <input type="submit" id="submit" value="저장" class="btn">
    </form>
</div>
</body>
</html>
