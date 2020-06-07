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
    <title>物业系统用户账号管理</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <meta name="viewport" content="width=device-width">
    <link rel="stylesheet" href="/CpmsHTML/css/templatemo_main.css">
</head>
<body>
<%@include file="AdminLoginCheckPage.jsp" %>
<div id="main-wrapper">
    <div class="navbar navbar-inverse" role="navigation">
        <div class="navbar-header">
            <div class="logo"><h1>物业管理系统</h1></div>
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
    </div>
    <div class="template-page-wrapper">
        <%@include file="AdminHead.jsp" %>

        <div class="templatemo-content-wrapper">
            <div class="templatemo-content">
                <!--
                    作者：1040892417@qq.com
                    时间：2020-01-11
                    描述：导航栏
                -->
                <ol class="breadcrumb">
                    <li>主页</li>
                    <li>管理员账号管理</li>
                    <li class="active">前台用户账号管理</li>
                </ol>
                <!--
                    作者：1040892417@qq.com
                    时间：2020-01-11
                    描述：标题
                -->
                <h1>小区物业管理系统所有前台用户账号信息</h1>
                <p>在这里管理员可以看到所有的前台用户账号信息.</p>

                <div class="row margin-bottom-30">
                    <div class="col-md-12">
                        <ul class="nav nav-pills">
                            <li class="active"><a href="#">富有 <span class="badge">42</span></a></li>
                            <li><a href="#">安心 <span class="badge">107</span></a></li>
                            <li><a href="#">可靠 <span class="badge">34</span></a></li>
                        </ul>
                    </div>
                </div>

                <!--
                    作者：1040892417@qq.com
                    时间：2020-01-11
                    描述：表格区域
                -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <!--
                                作者：1040892417@qq.com
                                时间：2020-01-11
                                描述：添加功能按钮
                            -->

                            <h4 class="margin-bottom-15 infoHeader">前台用户账号信息如下：
                                <a href="#" class="btn btn-default" id="addInfo">添加</a>
                                <form class="infoForm" action="#">
                                    <input class='infoSeach' placeholder="请输入用户账号" name="account"/>
                                    <input class='infoSeach' placeholder="请输入用户联系方式" name="phone"/>
                                    <input class='infoSeach' placeholder="请输入用户邮箱" name="email"/>
                                    <button class='infoSeachBtn' type="button">搜索</button>
                                </form>
                            </h4>
                            <table class="table table-striped table-hover table-bordered">
                                <thead>
                                <tr>
                                    <th>用户账号ID</th>
                                    <th>用户账号</th>
                                    <th>用户密码</th>
                                    <th>联系方式</th>
                                    <th>用户邮箱</th>
                                    <th>修改</th>
                                    <th>删除</th>
                                </tr>
                                </thead>

                                <tbody class='tbody'>
                                <c:choose>
                                    <c:when test="${!empty list}">

                                        <c:forEach var="user" items="${list}">
                                            <tr>
                                                <td>${user.id}</td>
                                                <td>${user.account}</td>
                                                <td>${user.pwd}</td>
                                                <td>${user.phone}</td>
                                                <td>${user.email}</td>
                                                <!--
                                                   作者：1040892417@qq.com
                                                   时间：2020-01-11
                                                   描述：修改
                                                -->
                                                <td class="display_form" data-index="${user}"><a href="#"
                                                                                                 class="btn btn-default">Edit</a>
                                                </td>

                                                <!--
                                                    作者：1040892417@qq.com
                                                    时间：2020-01-11
                                                    描述：删除
                                                -->
                                                <td>
                                                    <a onclick="deleteConfirm(${user.id})"
                                                       class="btn btn-link">Delete</a>
                                                </td>
                                            </tr>
                                        </c:forEach>

                                    </c:when>

                                    <c:otherwise>
                                        <tr>
                                            <td colspan="9" align="center">当前系统暂无用户!</td>
                                        </tr>
                                    </c:otherwise>

                                </c:choose>
                                </tbody>
                            </table>
                            <!--
                                作者：1040892417@qq.com
                                时间：2020-01-11
                                描述： 分页查询
                            -->
                            <ul class="pagination pull-right">
                                <li><a href="#" id="firstPageId">首页</a></li>
                                <li><a href="#" id="prePageId">上一页</a></li>
                                <%--                            <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>--%>
                                <%--                            <li><a href="#">2 <span class="sr-only">(current)</span></a></li>--%>
                                <%--                            <li><a href="#">3 <span class="sr-only">(current)</span></a></li>--%>
                                <%--                            <li><a href="#">4 <span class="sr-only">(current)</span></a></li>--%>
                                <%--                            <li><a href="#">5 <span class="sr-only">(current)</span></a></li>--%>
                                <li><a href="#" id="nextPageId">下一页</a></li>
                                <li><a href="#" id="endPageId">末页</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%-- 退出 --%>>
        <%@include file="../AdminExit.jsp" %>
        <!--
            作者：1347515620@qq.com
            时间：2020-01-11
            描述：底部div
        -->
    </div>
</div>

<%-- 修改表单 --%>
<div class="box">
    <div class="box_form">
        <form class="box_form-body" action="${pageContext.request.contextPath }/User/updUserLogin"
              method="post">
            <h2 class="titleInfo">用户账号信息修改</h2>
            <div class="box_form-item">
                <label class="col-sm-2">用户账号编号:</label>
                <input type="text" name="id" readonly="readonly" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">用户账号:</label>
                <input type="text" name="account" readonly="readonly" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">用户密码:</label>
                <input type="password" name="pwd" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">用户手机号:</label>
                <input type="text" name="phone" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">用户邮箱:</label>
                <input type="email" name="email" required>
            </div>
            <div class="box_btn">

                <button type="submit" id='sub' class="btn btn-large btn-block btn-danger">确认</button>

                <button type="button" id='cancel' class="btn btn-large btn-block btn-default">取消</button>

            </div>
        </form>
    </div>
</div>

<%-- 添加表单 --%>
<div class="boxAdd">
    <div class="box_form">
        <form class="box_form-body" action="${pageContext.request.contextPath }/User/addUserLogin"
              method="post">
            <h2 class="titleInfo">添加用户账号信息</h2>
            <div class="box_form-item">
                <label class="col-sm-2">用户账号:</label>
                <input type="text" name="account" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">用户密码:</label>
                <input type="password" name="pwd" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">联系方式:</label>
                <input type="text" name="phone" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">邮箱:</label>
                <input type="email" name="email" required>
            </div>
            <div class="box_btn">

                <button type="submit" id='subAdd' class="btn btn-large btn-block btn-danger">确认</button>

                <button type="button" id='cancelAdd' class="btn btn-large btn-block btn-default">取消</button>

            </div>
        </form>
    </div>
</div>

<script src="/CpmsHTML/js/jquery.min.js"></script>
<script src="/CpmsHTML/js/bootstrap.min.js"></script>
<script src="/CpmsHTML/js/templatemo_script.js"></script>
<script src="/CpmsHTML/js/AdminUserLoginManage.js"></script>
</body>
</html>