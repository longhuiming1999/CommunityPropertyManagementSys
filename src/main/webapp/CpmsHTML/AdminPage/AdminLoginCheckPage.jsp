<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/3/2
  Time: 11:20
  To change this template use File | Settings | File Templates.
--%>
<%
    Object admin = request.getSession(true).getAttribute("admin");
    if (admin == null) {
        response.sendRedirect(request.getContextPath() + "/CpmsHTML/AdminLogin.jsp");
    }
%>