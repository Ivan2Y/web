<%@ page import="java.io.File" %>
<%@ page import="java.util.Scanner" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
    <title>Login</title>
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
  <form action="index.jsp" method="post">
      <br>
      <div align="center">
          <h1>Login</h1><br>
      </div>
    <div align="center">
      Username:<input type="text" name="username" class="in" placeholder="Input your username here"><br><br>
      Password:&nbsp<input type="password" name="password" class="in" placeholder="Input your password here"><br><br><br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
      <input type="submit" class="but" value="Login">&nbsp
      <button class="but"><a href="register.jsp">Register</a></button>
      <br><br><br><br>
      <%
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        File file = new File("C:\\Users\\SKT丶666\\Desktop\\web\\web\\userlist.txt");
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
                            "           alert(\'Login successful!\');\n" +
                            "           window.document.location.href=\'login.jsp\';\n" +
                            "</script>" +
                            "</body>");
                } else {
                    out.print("<html>" +
                            "<body>" +
                            "<script type=\'text/javascript\' language=\'javascript\'>\n" +
                            "           alert(\'Username or password error!\');\n" +
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
