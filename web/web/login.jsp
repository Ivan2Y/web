<%@ page import="web.model.Message" %>
<%@ page import="java.util.Vector" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Welcome</title>
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
        <h1>Welcome<%=session.getAttribute("username")%></h1>
    </div>
    <div align="center">
        <h2>心灵旅途</h2>
        <form action="postMessage" method="post">
            <br>&nbsp&nbsp&nbsp&nbsp&nbspTitle&nbsp<input type="text" name="title" size="78" placeholder="Input your title here."><br>
            <br>Content&nbsp<textarea rows="20" cols="80" name="content" placeholder="韶华易逝，虽无法挽留却带给我们许多美丽的瞬间，或悲伤或欣喜，那些美好，让我们陪你记录点滴。"></textarea><br><br>
            <input type="submit" class="in" value="Publish"><br><br>
        </form>
        <%
            if(session.getAttribute("message")==null){
                session.setAttribute("message",new Vector<Message>());
            }
            Vector<Message> message =(Vector<Message>)session.getAttribute("message");
        %>
    </div>
    <div align="center">
        <h1>My Sweet Remember</h1><br>
        <%
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd  HH:mm:ss");
            for(Message m:message){
                out.println(String.format("<p><h3>Title：%s</h3> <p>Author：%s <p>Content：%s <p>Submit_Time：%s",m.getTitle(),m.getAuthor(),m.getContent(),df.format(m.getTime())));
            }
        %>
        <div align="center">
            <button class="but"><a href="update.jsp">Modify</a></button>
            <button class="but"><a href="logout.jsp">Logout</a></button>
        </div>
    </div>
    <br><br><br><br>
</body>
</html>
