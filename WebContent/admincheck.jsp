
<%@ page import="java.sql.*" %>
<%

String name=request.getParameter("name");
String pwd=(String)request.getParameter("pwd");
/* 	
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","java");

*/
	int ind=0;
    
if((name.equals("admin"))&&(pwd.equals("rajat"))){
 response.sendRedirect("adminhome.jsp");
}else{response.sendRedirect("adminfailure.jsp");}


	%>