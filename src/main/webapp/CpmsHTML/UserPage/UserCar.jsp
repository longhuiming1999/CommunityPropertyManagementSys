<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <!--[if IE]>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
    <title>我的车位</title>
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
                    <li class="active">车位信息表</li>
                </ol>
                <h1>我的车位信息</h1>
                <p>查看自己的车位信息</p>

                <div class="row margin-bottom-30">
                    <div class="col-md-12">
                        <ul class="nav nav-pills">
                            <li class="active"><a href="#">专一 <span class="badge">42</span></a></li>
                            <li><a href="#">独特 <span class="badge">107</span></a></li>
                            <li><a href="#">大气 <span class="badge">3</span></a></li>
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

                            <h4 class="margin-bottom-15">您的车位信息如下：</h4>
                            <table class="table table-striped table-hover table-bordered">
                                <thead>
                                <tr>
                                    <th>车位表Id</th>
                                    <th>业主Id</th>
                                    <th>业主名字</th>
                                    <th>业主车牌号</th>
                                    <th>出售金额</th>
                                    <th>是否转租</th>
                                    <th>修改</th>
                                </tr>
                                </thead>
                                <c:choose>
                                    <c:when test="${!empty list }">
                                        <c:forEach var="carPort" items="${list}">
                                            <tbody>
                                            <tr>
                                                <td>${carPort.id}</td>
                                                <td>${carPort.resId}</td>
                                                <td>${carPort.resName}</td>
                                                <td>${carPort.resPlateNum}</td>
                                                <td>${carPort.sellMoney}</td>
                                                <c:choose>
                                                    <c:when test="${carPort.isRent != 0}">
                                                        <td>是</td>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <td>否</td>
                                                    </c:otherwise>
                                                </c:choose>

                                                <!--
                                                    作者：1040892417@qq.com
                                                    时间：2020-01-11
                                                    描述：修改
                                                -->
                                                <td class="display_form" data-index="${carPort}"><a href="#"
                                                                                                    class="btn btn-default">修改</a>
                                                </td>

                                            </tr>
                                            </tbody>
                                        </c:forEach>
                                    </c:when>

                                    <c:otherwise>
                                        <tbody>
                                        <tr>
                                            <td colspan="7" align="center">您在小区内还没有自己的车位!</td>
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
        <!--
            作者：1347515620@qq.com
            时间：2020-01-11
            描述：底部div
        -->
    </div>
    <!--
    	作者：1347515620@qq.com
    	时间：2020-01-11
    	描述：使用的样式链接
    -->
</div>
<%-- 修改表单 --%>
<div class="box">
    <div class="box_form">
        <form class="box_form-body" action="${pageContext.request.contextPath }/Car/updateCarPortFormUser"
              method="post">
            <div class="box_form-item">
                <label class="col-sm-2">车位表Id:</label>
                <input type="text" name="id" readonly="readonly">
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">业主Id:</label>
                <input type="text" name="resId" readonly="readonly">
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">业主姓名:</label>
                <input type="text" name="resName" readonly="readonly">
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">业主车牌号:</label>
                <input type="text" name="resPlateNum">
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">出售金额:</label>
                <input type="text" name="sellMoney">
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">是否转租:</label>
                <input type="text" name="isRent">
            </div>
            <div class="box_btn">

                <button type="submit" id='sub' class="btn btn-large btn-block btn-danger">确认</button>

                <button type="button" id='cancel' class="btn btn-large btn-block btn-default">取消</button>

            </div>
        </form>
    </div>
</div>
<script src="/CpmsHTML/js/jquery.min.js"></script>
<script src="/CpmsHTML/js/bootstrap.min.js"></script>
<script src="/CpmsHTML/js/templatemo_script.js"></script>
<script src="/CpmsHTML/js/UserCar.js"></script>
</body>
</html>