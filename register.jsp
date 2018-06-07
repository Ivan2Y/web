<%@ page import="java.io.File" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.FileOutputStream" %>
<%@ page import="java.io.FileWriter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Welocme To Register!</title>
    <style>
        h1
        {
            background: aqua;
        }
        .in{
            border: 1px solid #ccc;
            padding: 7px 0px;
            border-radius: 3px;
            padding-left:5px;
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
    <form action="register.jsp" method="post">
        <br>
        <div align="center">
            <h1>Register</h1><br>
        </div>
        <div align="center">
            UserName:<input type="text" name="username" class="in" placeholder="UserName"><br>
            Password:<input type="password" name="password1" class="in" placeholder="Password"><br>
            Verify Password:<input type="password" name="password2" class="in" placeholder="Verify password"><br><br>
            <input type="submit" class="but" value="register">
        </div>
    </form>
    <%
        String username = request.getParameter("username");
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");

        if(username != null){
            if(!password1.equals("") && password1.equals(password2)){
                try{
                    File file = new File("userlist.txt");
                    FileWriter fw = new FileWriter(file);
                    fw.write(username+" "+password1);
                    fw.close();
                    out.print("<html>" +
                            "<body>" +
                            "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                            "           alert(\'Register Successful!!!\');\n" +
                            "           window.document.location.href=\'index.jsp\';\n" +
                            "</script>" +
                            "</body>");
                }catch (Exception e){}
            }
            else if(password1.equals("") || password2.equals("") ){
                out.print("<html>" +
                        "<body>" +
                        "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                        "           alert(\'Password Can Not Be Empty!!!\');\n" +
                        "           window.document.location.href=\'register.jsp\';\n" +
                        "</script>" +
                        "</body>");
            }
            else if(!password1.equals(password2)){
                out.print("<html>" +
                        "<body>" +
                        "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                        "           alert(\'Password Do Not Match!!!\');\n" +
                        "           window.document.location.href=\'register.jsp\';\n" +
                        "</script>" +
                        "</body>");
            }
        }
    %>
</body>
</html>
