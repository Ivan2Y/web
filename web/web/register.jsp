<%@ page import="java.io.File" %>
<%@ page import="java.io.FileWriter" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Register</title>
    <style>
        h1
        {
            background: silver;
        }
        .in{
            border: 1px solid black;
            padding: 6px 0px;
            border-radius: 2px;
            padding-left:6px;
        }
        .but
        {
            border:2px solid;
            padding:8px 25px;
            background: lightskyblue;
            -webkit-border-radius: 25px;
        }
        body{
            background:url("8.jpg") no-repeat;
            background-size: 100%;
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
            Username:<input type="text" name="username" class="in" placeholder="Input your username"><br><br>
            Password:&nbsp<input type="password" name="password1" class="in" placeholder="Input your password"><br><br>
            Password:&nbsp<input type="password" name="password2" class="in" placeholder="Input your password again"><br><br><br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <input type="submit" class="but" value="Register">&nbsp
            <button type="button" class="but"><a href="#" onclick="window.location.href='index.jsp';return false">Return</a></button>
        </div>
    </form>
    <%
        String username = request.getParameter("username");
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");

        if(username != null){
            if(!password1.equals("") && password1.equals(password2)){
                try{
                    File file = new File("C:\\Users\\SKT丶666\\Desktop\\web\\web\\userlist.txt");
                    FileWriter fw = new FileWriter(file);
                    fw.write(username+" "+password1);
                    fw.close();
                    out.print("<html>" +
                            "<body>" +
                            "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                            "           alert(\'Register successful!\');\n" +
                            "           window.document.location.href=\'index.jsp\';\n" +
                            "</script>" +
                            "</body>");
                }catch (Exception e){}
            }
            else if(password1.equals("") || password2.equals("") ){
                out.print("<html>" +
                        "<body>" +
                        "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                        "           alert(\'Password can not be empty!\');\n" +
                        "           window.document.location.href=\'register.jsp\';\n" +
                        "</script>" +
                        "</body>");
            }
            else if(!password1.equals(password2)){
                out.print("<html>" +
                        "<body>" +
                        "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                        "           alert(\'Password do not match!\');\n" +
                        "           window.document.location.href=\'register.jsp\';\n" +
                        "</script>" +
                        "</body>");
            }
        }
    %>
</body>
</html>
