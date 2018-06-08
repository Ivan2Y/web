<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Logout</title>
    <style>
        body{
            background:url("8.jpg") no-repeat;
            background-size: 100%;
        }
    </style>
</head>
<body>
    <%session.invalidate();%>
    <%
        out.print("<html>" +
                "<body>" +
                "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                "           alert(\'Logout successful!\');\n" +
                "           window.document.location.href=\'index.jsp\';\n" +
                "</script>" +
                "</body>");
    %>
</body>
</html>
