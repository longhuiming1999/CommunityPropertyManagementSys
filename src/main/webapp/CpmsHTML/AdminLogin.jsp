<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<%
    String webPath = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":"
            + request.getServerPort() + webPath + "/CpmsHTML/";
%>
<head>
    <meta charset="utf-8">
    <!--[if IE]>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
    <title>小区物业管理系统</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <meta name="viewport" content="width=device-width">
    <link rel="stylesheet" href="<%=basePath %>css/templatemo_main.css">
</head>
<body>
<div id="main-wrapper">
    <div class="navbar navbar-inverse" role="navigation">
        <div class="navbar-header">
            <div class="logo"><h1>XX小区物业管理系统</h1></div>
        </div>
    </div>
    <div class="template-page-wrapper">

        <form class="form-horizontal templatemo-signin-form" role="form"
              action="${pageContext.request.contextPath}/Admin/AdminLogin" method="post">

            <div class="form-group">
                <div class="col-md-12">
                    <label for="username" class="col-sm-2 control-label">用户名</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="account" id="username" placeholder="用户名">
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-12">
                    <label for="password" class="col-sm-2 control-label">密码</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" name="pwd" id="password" placeholder="密码">
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-12">
                    <div class="col-sm-offset-2 col-sm-10">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox"> 记住我
                            </label>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-12">
                    <div class="col-sm-offset-2 col-sm-10">
                        <input type="submit" value="登录" class="btn btn-default">
                        <input type="button" class="btn btn-default" value="普通用户入口"
                               onclick="location.href='<%=webPath%>/CpmsHTML/sign-in.jsp'">
                        <%-- 错误信息 --%>
                        <span>${msg}</span>
                    </div>
                </div>
            </div>

        </form>
    </div>
</div>
</body>
</html>