<%
session.removeAttribute("accno");
session.invalidate();
//("You are successfully logged out..!!");
response.sendRedirect("sbi_home.jsp");

%>