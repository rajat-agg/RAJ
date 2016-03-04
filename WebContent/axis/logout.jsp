<%
session.removeAttribute("accno");
session.invalidate();
//("You are successfully logged out..!!");
response.sendRedirect("axis_home.jsp");

%>