<%
session.removeAttribute("accno");
session.invalidate();
//("You are successfully logged out..!!");
response.sendRedirect("allah_home.jsp");

%>