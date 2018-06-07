<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileOutputStream" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.util.Scanner" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Welcome To The Website!</title>
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
  <form action="index.jsp" method="post">
      <br>
      <div align="center">
          <h1>Login</h1><br>
      </div>
    <div align="center">
      username:<input type="text" name="username" class="in" placeholder="username"><br><br>
      password:<input type="password" name="password" class="in" placeholder="password"><br><br>
      <input type="submit" class="but" value="login">
      <button class="but"><a href="register.jsp">register</a></button>
      <%
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        File file = new File("userlist.txt");
        if(username!=null) {
            boolean flag = false;
            try {
                Scanner cin = new Scanner(file);
                while (cin.hasNextLine()) {
                    String[] str = cin.nextLine().trim().split("\\s+");
                    if (username != null && username.equals(str[0]) && password.equals(str[1])) {
                        flag = true;
                    }
                }
                if (flag) {
                    session.setAttribute("username",username);
                    session.setAttribute("password",password);
                    out.print("<html>" +
                            "<body>" +
                            "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                            "           alert(\'Login Successful!!!\');\n" +
                            "           window.document.location.href=\'login.jsp\';\n" +
                            "</script>" +
                            "</body>");
                } else {
                    out.print("<html>" +
                            "<body>" +
                            "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                            "           alert(\'Username Or Password Error!!!\');\n" +
                            "           window.document.location.href=\'index.jsp\';\n" +
                            "</script>" +
                            "</body>");
                }
            } catch (Exception e) {
            }
        }

      %>
    </div>
  </form>
  </body>
</html>
