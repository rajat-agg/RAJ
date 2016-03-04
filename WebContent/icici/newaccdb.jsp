

<%@page import="java.sql.*"%>
<%@page import="java.util.*;"%>
<link href="style.css" rel="stylesheet" type="text/css">
<%!
String fname,lname,pass,cpass,amount,addr,ph,bank,accno,a,b,c;
Connection con;
PreparedStatement ps;
ResultSet rs;
Random t = new Random();
%>
<%
	bank= "ICICI Bank";
	fname = request.getParameter("fname");
	lname = request.getParameter("lname");
	amount = request.getParameter("amount");
	addr = request.getParameter("addr");
	ph = request.getParameter("ph");
	pass = request.getParameter("pass");
	request.getSession();
	a = ph.substring(5, 10);
	b = Integer.toString(t.nextInt(89) + 10);
	c = Integer.toString(t.nextInt(89) + 10);
	// d = (int) Math.pow(10, Math.floor(Math.log10(a))+1)*b + a;
	//accno = (int) Math.pow(10, Math.floor(Math.log10(d))+1)*c + d;
	accno = b + a + c;

	session.setAttribute("accno", accno);

	try {

		Class.forName("com.ibm.db2.jcc.DB2Driver");
		String jdbcurl = "jdbc:db2://awh-yp-small02.services.dal.bluemix.net:50000/BLUDB"; // use ssljdbcurl to connect via SSL
		String user = "dash101196";
		String password = "7XRSp3mVWWJM";
		con = DriverManager.getConnection(jdbcurl, user, password);

	} catch (SQLException e) {
		out.println("SQL Exception: " + e);
		return;
	} catch (ClassNotFoundException e) {
		out.println("ClassNotFound Exception: " + e);
		return;
	}

	Statement stmt = null;

	try {

		stmt = con.createStatement();

		String sql = "INSERT INTO icici " + "VALUES ('" + bank + "','"
				+ accno + "','" + fname + "','" + lname + "','"
				+ amount + "','" + addr + "','" + ph + "','" + pass
				+ "')";
		stmt.executeUpdate(sql);
		// stmt.executeUpdate("insert into TABLE1 values('"+bank+"','"+accno+"','"+fname+"','"+lname+"','"+amount+"','"+addr+"','"+ph+"','"+pass+"')");

		// 	ps = con.prepareStatement("insert into TABLE1 values('"+bank+"','"+accno+"','"+fname+"','"+lname+"','"+amount+"','"+addr+"','"+ph+"','"+pass+"')");

		//	sqlStatement = "select * from TABLE1 where ACCNO='"+accno1+"' AND PASS='"+pass1+"'";

		//	ResultSet rs = ps.executeUpdate();

		// if(rs.next())
		if (stmt != null) {
			out.println("<html>");

			out.println("<style>");
			out.println("table, th, td {\n"
					+ "    border: 0px solid black;\n"
					+ "  border-collapse: collapse;  \n"
					+ "} th,td {\n" + "    padding: 3px;\n"
					+ "  text-align: left;  \n" + "} font {\n"
					+ "    color: #006600;\n" + "}");
			out.println("</style>");
			out.println("<head>");
			out.println(" <link href='style.css' rel='stylesheet' type='text/css'>");
			out.println("</head>");

			out.println("<body style='background-color:#99CCFF'>");
			out.println("<img src='images/icici.jpg' alt='LOGO' style='width:1350px; height:170px;'>");
			/* out.println("<div id='navigation' style='background-color:black'>");
			 out.println("<ul><li><a href='allah_home.jsp'>HOME</a></li>");
			 out.println("<li><a href='newacc.jsp'>NEW ACCOUNT</a></li>");
			  out.println(" <li><a href='checkbal.jsp'>BALANCE</a></li>");
			   out.println("<li><a href='deposit.jsp'>DEPOSIT</a></li>");
			    out.println(" <li><a href='withdraw.jsp'>WITHDRAW</a></li>");
			     out.println("<li><a href='transfer.jsp'>TRANSFER</a></li>");
			     out.println("<li><a href='close.jsp'>CLOSE A/C</a></li>");
			     out.println("<li><a href='about.jsp'>Contact Us</a></li>"); 
			     out.println("<br>");
			    
			     
			     
			     
			     out.println("</ul>");
			     out.println("</div>"); */
			out.println("<br>");
			out.println("<br><a href='logout.jsp'><img src='images/exit.png' style='width:40px; height:40px' align='left'></a>");
			out.println("<b>");
			out.println("<i>");
			out.println("Hii ");
			out.println("<font>");
			out.println(fname + " !");
			out.println("</font>");
			out.println("</i>");
			out.println("</b>");
			out.println("<br>");
			out.println("Welcome to " + bank);
			out.println("<br>");
			out.println("<br>");
			out.println("<u>");
			out.println("Here are your details:");
			out.println("</u>");
			out.println("<br>");

			out.println("<table align='left' style='width:20%'>");
			out.println("<tr>");
			out.println("<th>First Name</th>");
			out.println("<td>:</td>");
			out.println("<td>");
			out.println(fname);
			out.println("</td>");
			out.println("</tr>");
			out.println("<tr>");
			out.println("<th>Last Name</th>");
			out.println("<td>:</td>");
			out.println("<td>");
			out.println(lname);
			out.println("</td>");
			out.println("</tr>");
			out.println("<tr>");
			out.println("<th>Mobile Number</th>");
			out.println("<td>:</td>");
			out.println("<td>");
			out.println(ph);
			out.println("</td>");
			out.println("</tr>");
			out.println("<tr>");
			out.println("<th>Account Number</th>");
			out.println("<td>:</td>");
			out.println("<td>");
			out.println(accno);
			out.println("</td>");
			out.println("</tr>");
			out.println("<tr>");
			out.println("<th>Balance</th>");
			out.println("<td>:</td>");
			out.println("<td>");
			out.println(amount);
			out.println("</td>");
			out.println("</tr>");
			out.println("<tr>");
			out.println("<th>Password</th>");
			out.println("<td>:</td>");
			out.println("<td>");
			out.println(pass);
			out.println("</td>");
			out.println("</tr>");
			out.println("<tr>");
			out.println("<th>Address</th>");
			out.println("<td>:</td>");
			out.println("<td>");
			out.println(addr);
			out.println("</td>");
			out.println("</tr>");
			out.println("</table></br>");
			out.println("<br>");
			out.println("<br>");
			out.println("<table>");

			out.println("<h2>");
			out.println("<i>");
			out.println("Thanks for choosing us !");
			out.println("</i>");
			out.println("<h2>");
			out.println("</table>");
			out.println("</body>");
			out.println("</html>");

			out.print("Hii " + fname + " !");
			out.print("<br>");
			out.print("Welcome to ICICI Bank");
			out.print("<br>");
			out.print("Your Account number is " + accno);
			out.print("<br>");
			out.print("Thanks for choosing us !");
			out.print("</body>");
			out.print("</html>");
			// request.getRequestDispatcher("successuser.jsp").include(request,response);
		} else {
			out.print("error");
		}

	}

	catch (Exception ex) {
		ex.printStackTrace();
		out.print("ERROR OCCURED");
	}
%>
 