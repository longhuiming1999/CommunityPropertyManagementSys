<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <!--[if IE]>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
    <title>我的房产</title>
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
        <!--
               作者：1040892417@qq.com
               时间：2020-01-11
               描述：主页导航栏信息
       -->
        <%@include file="UserHead.jsp" %>
        <div class="templatemo-content-wrapper">
            <div class="templatemo-content">
                <!--
                    作者：1040892417@qq.com
                    时间：2020-01-11
                    描述：导航栏
                -->
                <ol class="breadcrumb">
                    <li>主页</li>
                    <li>小区相关</li>
                    <li class="active">我的房产</li>
                </ol>
                <!--
                    作者：1040892417@qq.com
                    时间：2020-01-11
                    描述：标题
                -->
                <h1>我的房产信息</h1>
                <p>在这您可以看到自己的房产信息.</p>

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
                            <h4 class="margin-bottom-15">您的房子信息如下：</h4>
                            <table class="table table-striped table-hover table-bordered">
                                <thead>
                                <tr>
                                    <th>房产编号</th>
                                    <th>栋号</th>
                                    <th>单元号</th>
                                    <th>楼层号</th>
                                    <th>房间号</th>
                                    <th>住户名称</th>
                                    <th>联系方式</th>
                                </tr>
                                </thead>

                                <c:choose>
                                    <c:when test="${!empty list }">
                                        <c:forEach var="house" items="${list}">
                                            <tbody>
                                            <tr>
                                                <td>${house.id}</td>
                                                <td>${house.buildNum}</td>
                                                <td>${house.unit}</td>
                                                <td>${house.floor}</td>
                                                <td>${house.houseNum}</td>
                                                <td>${house.name}</td>
                                                <td>${house.phone}</td>
                                            </tr>
                                            </tbody>
                                        </c:forEach>
                                    </c:when>

                                    <c:otherwise>
                                        <tbody>
                                        <tr>
                                            <td colspan="7" align="center">您在小区内还没有属于自己的房产!</td>
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