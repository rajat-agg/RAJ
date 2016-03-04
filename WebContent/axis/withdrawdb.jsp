<%@page import="java.sql.*"%>
<%!
String fname,accno,pass,amount;
int amt;
Connection con;
PreparedStatement ps;
ResultSet rs;
%>
<%
 accno= request.getParameter("accno");
 pass= request.getParameter("pass");
 amount= request.getParameter("amount");
 request.getSession();
 
 session.setAttribute("accno",accno);
 
 

 Connection con = null;
 try {
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

          ps = con.prepareStatement("select * from axis where ACCNO='"+accno+"' AND PASS='"+pass+"'");
  	   	
  	   //	sqlStatement = "select * from TABLE1 where ACCNO='"+accno1+"' AND PASS='"+pass1+"'";
  	   	
  	   	ResultSet rs = ps.executeQuery();
  	   
           //con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","12345");
          // ps=con.prepareStatement("select * from allahabad where ACCNO='"+accno+"' AND PASSWORD='"+pass+"'");
           // rs=ps.executeQuery();
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
               request.setAttribute("withdrawdb","Please check your Account number and Password");
			%>
			<jsp:forward page="withdraw.jsp"></jsp:forward> 
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
  
   String sql = "update axis set AMOUNT='"+amt+"' where ACCNO='"+accno+"' and PASS='"+pass+"'";
   stmt.executeUpdate(sql);
  
            //ps=con.prepareStatement("update TABLE2 set AMOUNT='"+amt+"' where ACCNO='"+accno+"' and PASS='"+pass+"'");
            //rs=ps.executeUpdate();
            
            if(stmt!=null)
           //con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","12345");
           // ps=con.prepareStatement("update allahabad set AMOUNT='"+amt+"' where ACCNO='"+accno+"' and PASSWORD='"+pass+"'");
            //rs=ps.executeQuery();
            {
                out.print("<html>");
                out.println("<body style='background-color:#99CCFF'>");
                out.println("<img src='images/axis.jpg' alt='LOGO' style='width:1350px; height:170px;'>");
                out.println("<br>");
                out.println("<br><a href='logout.jsp'><img src='images/exit.png' style='width:40px; height:40px' align='left'></a>");
                out.print("Hii "+fname);
                out.print("<br>");
                out.print("Your account has been debited with Rs"+amount);
                out.print("<br>");
                out.print("Now current balance in your account is Rs"+amt);
                out.print("</body>");
                out.print("</html>");
            }
          }
        
        catch(Exception ex)
        {
      ex.printStackTrace();
        }
%>