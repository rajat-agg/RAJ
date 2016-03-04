<%@page import="java.sql.*"%>
<%!
String pass1,accno1,fname;
int balance;
//int accno;
Connection con;
PreparedStatement ps;
//Statement stmt;              
ResultSet rs;
%>
<%
 accno1= request.getParameter("accno");
 pass1= request.getParameter("pass");
 request.getSession();

 
 session.setAttribute("accno",accno1);

 Connection con = null;
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

	   try {
		  
	   	ps = con.prepareStatement("select * from federal where ACCNO='"+accno1+"' AND PASS='"+pass1+"'");
	   	
	   //	sqlStatement = "select * from TABLE1 where ACCNO='"+accno1+"' AND PASS='"+pass1+"'";
	   	
	   	ResultSet rs = ps.executeQuery();
	   	
	   	if(rs.next())
        {
	   		out.println("<html>");
            
            out.println("<style>");
            out.println("table, th, td {\n" +
"    border: 0px solid black;\n" +
"  border-collapse: collapse;  \n" +
"} th,td {\n" +
"    padding: 3px;\n" +
"  text-align: left;  \n" +
"} font {\n" +
"    color: #006600;\n" +
"}");
           out.println("</style>"); 
         out.println("<head>");
         out.println(" <link href='style.css' rel='stylesheet' type='text/css'>");
         out.println("</head>");
         fname=rs.getString("FNAME");
         balance=rs.getInt("AMOUNT");
           
         out.println("<body style='background-color:#99CCFF'>");
          out.println("<img src='images/federal.png' alt='LOGO' style='width:1350px; height:170px;'>");
          out.println("<br>");
          out.println("<br><a href='logout.jsp'><img src='images/exit.png' style='width:40px; height:40px' align='left'></a>");
          out.println("<b>");
          out.println("<i>");
          out.println("Hii ");
          out.println("<font>");
          out.println(fname+" !");
          out.println("</font>");
          out.println("</i>");
          out.println("</b>");
          out.println("<br>");
          out.println("<b>Your current balance is Rs "+balance+"<b>");
          out.print("</html>");
          
	   		
            }
        else
        {
            
                          
	request.setAttribute("checkbaldb","Please check your Account number and Password");
			%>
			<jsp:forward page="checkbal.jsp"></jsp:forward> 
			<%
        }

    
	   	
	     } catch (SQLException e) {
	    		
	   	out.println("Error creating statement: " + e);
	         }
          %>
      