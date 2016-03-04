

<%@page import="java.sql.*"%>
<%@page import="java.util.*;"%>
<link href="style.css" rel="stylesheet" type="text/css">
<%!
String name,email,message;
Connection con;
PreparedStatement ps;
ResultSet rs;
%>
<%
 
 name= request.getParameter("name");
 email= request.getParameter("email");
message= request.getParameter("message");
 
    try {
     	
     	Class.forName("com.ibm.db2.jcc.DB2Driver");
     	String jdbcurl =  "jdbc:db2://awh-yp-small02.services.dal.bluemix.net:50000/BLUDB"; // use ssljdbcurl to connect via SSL
     	String user = "dash101196";
     	String password = "7XRSp3mVWWJM";
     	con = DriverManager.getConnection(jdbcurl, user,password);
     	
          } catch (SQLException e) {
     	out.println("SQL Exception: " + e);
     	return;
                  }
            catch (ClassNotFoundException e) {
     	out.println("ClassNotFound Exception: " + e);
     	return;
               }
   
    Statement stmt = null;
 
           try {
		  
		   stmt = con.createStatement();
		   
		   String sql = "INSERT INTO TABLE3 " +
                   "VALUES ('"+name+"','"+email+"','"+message+"')";
		   stmt.executeUpdate(sql);
		 
        	 if(stmt!=null)
            {
        		 response.sendRedirect("index.jsp");
            
           }
           }
        
        catch(Exception ex)
        {
      		ex.printStackTrace();
      		out.print("ERROR OCCURED");
        }
%>
 