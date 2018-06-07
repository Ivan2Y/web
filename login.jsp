<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Welcome!</title>
    <style>
        h1
        {
            background: aqua;
        }
        .but
        {
            border:2px solid;
            padding:3px 20px;
            background: #7D7DFF;
            -webkit-border-radius: 25px;
        }
    </style>
</head>
<body>
    <br>
    <div align="center">
        <h1>Hello</h1><br>
    </div>
    <div align="center">
        Current Time：<%=new Date().toLocaleString()%><br><br><br><br>
        <button class="but"><a href="update.jsp">modify</a></button>
        <button class="but"><a href="logout.jsp">logout</a></button>
    </div>
    <br><br><br><br>
    <div align="center">
        <img src="children.jpg">
    </div>

</body>
</html>
