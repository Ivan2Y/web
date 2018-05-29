<%@page import="java.util.*,java.io.*"%>
<%
	String userName=request.getParameter("userName").trim();
	String password=request.getParameter("password");

	boolean find=false;
	try{
		Scanner cin=new Scanner(new File("userlist.txt"));
		while(cin.hasNextLine()){
			String line=cin.nextLine();
			String ss[]=line.split("\\s+");
			if(ss[0].equals(userName)&&ss[1].equals(password)){
				find=true;
				break;
			}
		}
		cin.close();		

	}catch(Exception e){}



	if(find){
		session.setAttribute("user",userName);
		HashMap<String,Integer> shopcar=new HashMap<String,Integer>();
		shopcar.put("iPhone 8 Plus",2);
		shopcar.put("Macbook",5);
		shopcar.put("Ipad Pro",8);
		session.setAttribute("shopcar",shopcar);
		response.sendRedirect("index.jsp");
	
	}else{
		response.sendRedirect("login.html");
	}

%>