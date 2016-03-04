<%
session.removeAttribute("accno");
session.invalidate();
//("You are successfully logged out..!!");
response.sendRedirect("hdfc_home.jsp");

%>