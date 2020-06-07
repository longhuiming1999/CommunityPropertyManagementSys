<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":"
            + request.getServerPort() + request.getContextPath() + "/CpmsHTML/";
%>
<head>
    <meta charset="utf-8">
    <!--[if IE]>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
    <title>我的信息</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <meta name="viewport" content="width=device-width">
    <link rel="stylesheet" href="<%=basePath %>css/templatemo_main.css">
</head>
<body>
<%@include file="UserLoginCheckPage.jsp" %>
<div id="main-wrapper">
    <div class="navbar navbar-inverse" role="navigation">
        <div class="navbar-header">
            <div class="logo"><h1>小区物业管理系统</h1></div>
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Tonavigationggle </span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
    </div>
    <div class="template-page-wrapper">
        <!--
              作者：1040892417@qq.com
              时间：2020-01-11
              描述：主页导航栏信息
      -->
        <%@include file="UserHead.jsp" %>

        <div class="templatemo-content-wrapper">
            <div class="templatemo-content">
                <ol class="breadcrumb">
                    <li>主页</li>
                    <li>小区相关</li>
                    <li class="active">我的信息</li>
                </ol>
                <h1>个人信息管理</h1>
                <p>查看自己的个人信息</p>

                <div class="row margin-bottom-30">
                    <div class="col-md-12">
                        <ul class="nav nav-pills">
                            <li class="active"><a href="#">个人 <span class="badge">42</span></a></li>
                            <li><a href="#">安全 <span class="badge">107</span></a></li>
                            <li><a href="#">账号 <span class="badge">3</span></a></li>
                        </ul>
                    </div>
                </div>
                <div class="row">
                    <!--
                        作者：1347515620@qq.com
                        时间：2020-01-11
                        描述：车位排序
                    -->
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <!--
                                作者：1040892417@qq.com
                                时间：2020-01-11
                                描述：添加功能按钮
                            -->

                            <h4 class="margin-bottom-15">您的个人信息如下：</h4>
                            <form class="form-horizontal" role="form" method="post" action="${pageContext.request.contextPath}/User/updUserInfo">
                                <div class="form-group">
                                    <label for="account" class="col-sm-2 control-label">账号</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="account" name="account"
                                               value="${userLogin.account}" readonly="readonly">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="pwd" class="col-sm-2 control-label">密码</label>
                                    <div class="col-sm-10">
                                        <input type="password" class="form-control" id="pwd" name="pwd"
                                               value="${userLogin.pwd}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="phone" class="col-sm-2 control-label">手机号码</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="phone" name="phone"
                                               value="${userLogin.phone}" readonly="readonly">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="email" class="col-sm-2 control-label">邮箱</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="email" name="email"
                                               value="${userLogin.email}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button type="submit" class="btn btn-default">提交修改</button>
                                        <span>${msg}</span>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%-- 退出 --%>>
        <%@include file="../UserLoginExit.jsp" %>
        <!--
            作者：1347515620@qq.com
            时间：2020-01-11
            描述：底部div
        -->
    </div>
</div>
</div>
<script src="<%=basePath%>js/jquery.min.js"></script>
<script src="<%=basePath%>js/bootstrap.min.js"></script>
<script src="<%=basePath%>js/templatemo_script.js"></script>
</body>
</html>