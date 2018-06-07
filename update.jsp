<%@ page import="java.util.Scanner" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.FileOutputStream" %>
<%@ page import="java.io.FileWriter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Modify Your Password</title>
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
    <br>
    <div align="center">
        <h1>
        当前用户：<%=session.getAttribute("username")%>
        </h1><br>
    </div>

    <form action="update.jsp" method="post">
        <div align="center">
            Password:<input type="password" name="password" class="in" placeholder="Password"><br>
            Verify Password:<input type="password" name="password1" class="in" placeholder="Verify Password"><br><br>
            <input type="submit" class="but" value="Update">
            <button type="button" class="but"><a href="#" onclick="window.location.href='login.jsp';return false">Back</a></button>

        </div>
    </form>
    <%
        String username = (String)session.getAttribute("username");
        String password = request.getParameter("password");
        String password1 = request.getParameter("password1");

        File file = new File("userlist.txt");
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
                                "           alert(\'Password Modify Successful!!!\');\n" +
                                "           window.document.location.href=\'index.jsp\';\n" +
                                "</script>" +
                                "</body>");
                    }
                } else {
                    out.print("<html>" +
                            "<body>" +
                            "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                            "           alert(\'Original Password Error!!!\');\n" +
                            "           window.document.location.href=\'update.jsp\';\n" +
                            "</script>" +
                            "</body>");
                }
            }
        }
    %>
</body>
</html>
