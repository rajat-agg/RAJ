<%
session.removeAttribute("accno");
session.invalidate();
//("You are successfully logged out..!!");
response.sendRedirect("icici_home.jsp");

%>