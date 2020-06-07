<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <!--[if IE]>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
    <title>缴费信息</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <meta name="viewport" content="width=device-width">
    <link rel="stylesheet" href="/CpmsHTML/css/templatemo_main.css">
</head>
<body>
<%@include file="UserLoginCheckPage.jsp" %>
<div id="main-wrapper">
    <div class="navbar navbar-inverse" role="navigation">
        <div class="navbar-header">
            <div class="logo"><h1>小区缴费详情</h1></div>
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
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
                    <li class="active">缴费信息</li>
                </ol>
                <h1>我的缴费信息</h1>
                <p>在这您可以看到自己的缴费信息.</p>

                <div class="row margin-bottom-30">
                    <div class="col-md-12">
                        <ul class="nav nav-pills">
                            <li class="active"><a href="#">责任<span class="badge">42</span></a></li>
                            <li><a href="#">生活<span class="badge">107</span></a></li>
                        </ul>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <h4 class="margin-bottom-15">个人缴费信息</h4>
                            <table class="table table-striped table-hover table-bordered">
                                <thead>
                                <tr>
                                    <th>支付id</th>
                                    <th>用户id</th>
                                    <th>用户名字</th>
                                    <th>缴费类型</th>
                                    <th>缴费金额</th>
                                    <th>缴费状态</th>
                                </tr>
                                </thead>

                                <c:choose>
                                    <c:when test="${!empty list}">
                                        <c:forEach var="pay" items="${list}">
                                            <tbody>
                                            <tr>
                                                <td>${pay.payId}</td>
                                                <td>${pay.resId}</td>
                                                <td>${pay.resName}</td>
                                                <td>${pay.type}</td>
                                                <td>${pay.money}</td>
                                                <c:choose>
                                                    <c:when test="${pay.state != 0}">
                                                        <td>已缴费</td>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <td>未缴费</td>
                                                    </c:otherwise>
                                                </c:choose>
                                            </tr>
                                            </tbody>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tbody>
                                        <tr>
                                            <td colspan="6" align="center">${msg}</td>
                                        </tr>
                                        </tbody>
                                    </c:otherwise>


                                </c:choose>


                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%-- 退出 --%>>
        <%@include file="../UserLoginExit.jsp" %>
    </div>
</div>
<script src="/CpmsHTML/js/jquery.min.js"></script>
<script src="/CpmsHTML/js/bootstrap.min.js"></script>
<script src="/CpmsHTML/js/templatemo_script.js"></script>
</body>
</html>