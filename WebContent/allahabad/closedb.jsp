<%@page import="java.sql.*"%>
<%!
String pass,accno,fname;

//int accno;
Connection con;
PreparedStatement ps;
ResultSet rs;
%>
<%
 accno= request.getParameter("accno");
 pass= request.getParameter("pass");
 request.getSession();
 
 session.setAttribute("accno",accno);
 

 

 Connection con = null;
  try{
	  Class.forName("com.ibm.db2.jcc.DB2Driver");
	  String jdbcurl =  "jdbc:db2://awh-yp-small02.services.dal.bluemix.net:50000/BLUDB"; // use ssljdbcurl to connect via SSL
	 	String user = "dash101196";
	 	String password = "7XRSp3mVWWJM";
	 	con = DriverManager.getConnection(jdbcurl, user,password);
	 	//con.setAutoCommit(false);
	      } catch (SQLException e) {
	 	out.println("SQL Exception: " + e);
	 	return;
	              }
	        catch (ClassNotFoundException e) {
	 	out.println("ClassNotFound Exception: " + e);
	 	return;
	           }
   try
          {
          // con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","12345");
           ps=con.prepareStatement("select FNAME from TABLE2 where ACCNO='"+accno+"' AND PASS='"+pass+"'");
            rs=ps.executeQuery();
           if(rs.next())
           {
               fname=rs.getString("FNAME");
           }
           else{   
                             
	      request.setAttribute("closedb","Please check your Account number and Password");
			%>
			<jsp:forward page="close.jsp"></jsp:forward> 
			<% 
           }

       }
         catch(Exception ex)
        {
             ex.printStackTrace();
        }
Statement stmt = null;
   
   try {
   
   stmt = con.createStatement();
   String sql = "delete from TABLE2 where ACCNO='"+accno+"' AND PASS='"+pass+"'";
   stmt.executeUpdate(sql);
  
            
            if(stmt!=null)
           
           {
               out.print("<html>");
               out.println("<body style='background-color:#99CCFF'>");
               out.println("<img src='images/allahabad.jpg' alt='LOGO' style='width:1350px; height:170px;'>");
               out.println("<br>");
               out.print("Hii "+fname+" !");
               out.print("<br>");
               out.print("Your Account has been successfully closed");
               out.print("<br>");
               out.print("Hope you will come soon");
               out.print("<br>");
               out.print("Thank You !");
               
           }
           

       }
         catch(Exception ex)
        {
             ex.printStackTrace();
        }
  
%>