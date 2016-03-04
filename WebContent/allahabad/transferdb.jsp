<%@page import="java.sql.*"%>
<%!
String fname,accno,taccno,pass,amount;
int amt,tamt;
Connection con;
PreparedStatement ps;
ResultSet rs;
%>
<%
 accno= request.getParameter("accno");
 taccno= request.getParameter("taccno");
 pass= request.getParameter("pass");
 amount= request.getParameter("amount");
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
           ps=con.prepareStatement("select * from TABLE2 where ACCNO='"+accno+"' AND PASS='"+pass+"'");
            rs=ps.executeQuery();
           if(rs.next())
           {
               fname=rs.getString("FNAME");
               amt=rs.getInt("AMOUNT");
              if(amt>Integer.parseInt(amount))
              {
               amt=amt-Integer.parseInt(amount);
              }
              else
              { 
                  out.println("You have insufficient balance");
                  out.close();
              }
           }
           else
           {
               request.setAttribute("transferdb","Please check your Account number and Password");
			%>
			<jsp:forward page="transfer.jsp"></jsp:forward> 
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
	   String sql = "update TABLE2 set AMOUNT='"+amt+"' where ACCNO='"+accno+"' and PASS='"+pass+"'";
	   stmt.executeUpdate(sql);
	  
	            //ps=con.prepareStatement("update TABLE2 set AMOUNT='"+amt+"' where ACCNO='"+accno+"' and PASS='"+pass+"'");
	            //rs=ps.executeUpdate();
	            
	            //if(stmt!=null)
           //con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","12345");
            //ps=con.prepareStatement("update allahabad set AMOUNT='"+amt+"' where ACCNO='"+accno+"' and PASSWORD='"+pass+"'");
            //rs=ps.executeQuery();
          }
        
        catch(Exception ex)
        {
      ex.printStackTrace();
        }
  try
          {
           //con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","12345");
           ps=con.prepareStatement("select AMOUNT from TABLE2 where ACCNO='"+taccno+"'");
            rs=ps.executeQuery();
           if(rs.next())
           {
               
               tamt=rs.getInt("AMOUNT");
              
               tamt=tamt+Integer.parseInt(amount);
             
              
           }
       }
         catch(Exception ex)
        {
             ex.printStackTrace();
        }
  
  Statement stmt1 = null;
  
  try {
  
  stmt1 = con.createStatement();
  String sql1 = "update TABLE2 set AMOUNT='"+tamt+"' where ACCNO='"+taccno+"'";
  stmt1.executeUpdate(sql1);
 
           //ps=con.prepareStatement("update TABLE2 set AMOUNT='"+amt+"' where ACCNO='"+accno+"' and PASS='"+pass+"'");
           //rs=ps.executeUpdate();
           
           if(stmt1!=null)
           {
           //con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","12345");
            //ps=con.prepareStatement("update allahabad set AMOUNT='"+tamt+"' where ACCNO='"+taccno+"'");
           // rs=ps.executeQuery();
          
            
            out.print("<html>");
            out.println("<body style='background-color:#99CCFF'>");
            out.println("<img src='images/allahabad.jpg' alt='LOGO' style='width:1350px; height:170px;'>");
            
            out.println("<br>");
            out.println("<br><a href='logout.jsp'><img src='images/exit.png' style='width:40px; height:40px' align='left'></a>");
            out.print("Hii "+fname+" !");
            out.print("<br>");
            out.print("Rs"+amount+"/- has been successfully transferred form your A/C no "+accno+" to A/C no "+taccno);
            out.print("<br>");
            out.print("Now current balance in your account is Rs"+amt+"/-");
            out.print("</body>");
            out.print("</html>");
            
            
            }
                
                }
        
        catch(Exception ex)
        {
      ex.printStackTrace();
        }
%>