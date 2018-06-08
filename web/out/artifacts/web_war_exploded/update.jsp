<%@ page import="java.util.Scanner" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileWriter" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Modify</title>
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
    <br>
    <div align="center">
        <h1>
        User<%=session.getAttribute("username")%>Hello,please modify your password
        </h1><br>
    </div>
    <form action="update.jsp" method="post">
        <div align="center">
            Origin Password:<input type="password" name="password" class="in" placeholder="Input your original password"><br>
            New Password:<input type="password" name="password1" class="in" placeholder="Input your new password"><br><br>
            <input type="submit" class="but" value="Modify">
            <button type="button" class="but"><a href="#" onclick="window.location.href='login.jsp';return false">Return</a></button>

        </div>
    </form>
    <%
        String username = (String)session.getAttribute("username");
        String password = request.getParameter("password");
        String password1 = request.getParameter("password1");

        File file = new File("C:\\Users\\SKT丶666\\Desktop\\web\\web\\userlist.txt");
        Scanner cin = new Scanner(file);
        if(password!=null) {
            if (cin.hasNextLine()) {
                String s = cin.nextLine();
                String[] str = s.trim().split("\\s+");
                System.out.println(str[1] + " " + password);
                if (password.equals(str[1])) {
                    if (password1 != null && !password1.equals("")) {
                        FileWriter fw = new FileWriter(file);
                        fw.write(username + " " + password1);
                        fw.close();
                        out.print("<html>" +
                                "<body>" +
                                "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                                "           alert(\'Modify password successful!\');\n" +
                                "           window.document.location.href=\'index.jsp\';\n" +
                                "</script>" +
                                "</body>");
                    }
                } else {
                    out.print("<html>" +
                            "<body>" +
                            "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                            "           alert(\'Origin password error!\');\n" +
                            "           window.document.location.href=\'update.jsp\';\n" +
                            "</script>" +
                            "</body>");
                }
            }
        }
    %>
</body>
</html>
