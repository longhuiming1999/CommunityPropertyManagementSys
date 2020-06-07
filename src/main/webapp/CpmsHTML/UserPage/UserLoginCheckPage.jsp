<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/3/2
  Time: 11:20
  To change this template use File | Settings | File Templates.
--%>
<%
    Object userLogin = request.getSession(true).getAttribute("userLogin");
    if (userLogin == null) {
        response.sendRedirect(request.getContextPath() + "/CpmsHTML/sign-in.jsp");
    }
%>