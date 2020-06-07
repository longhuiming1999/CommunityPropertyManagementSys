<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <!--[if IE]>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
    <title>小区投诉信息</title>
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
                    <li>小区相关</li>
                    <li class="active">投诉信息</li>
                </ol>
                <!--
                    作者：1040892417@qq.com
                    时间：2020-01-11
                    描述：标题
                -->
                <h1>小区所有投诉信息</h1>
                <p>在这里管理员可以看到小区所有的投诉信息.</p>

                <div class="row margin-bottom-30">
                    <div class="col-md-12">
                        <ul class="nav nav-pills">
                            <li class="active"><a href="#">和谐 <span class="badge">42</span></a></li>
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
                            <h4 class="margin-bottom-15">投诉信息如下：<a id="addInfo" class="btn btn-default">添加</a>
                                <form class="infoForm" action="#">
                                    <input class='infoSeach' placeholder="请输入投诉人名字" name="name"/>
                                    <input class='infoSeach' placeholder="请输入投诉内容" name="content"/>
                                    <input class='infoSeach' placeholder="请输入起始日期" type="date" name="startDate"/>
                                    <input class='infoSeach' placeholder="请输入结束日期" type="date" name="endDate"/>
                                    投诉状态:
                                    <select class='infoSeach' name="state" required>
                                        <option value="1">已解决</option>
                                        <option value="0">未解决</option>
                                    </select>
                                    <button class='infoSeachBtn' type="button">搜索</button>
                                </form>
                            </h4>
                            <table class="table table-striped table-hover table-bordered">
                                <thead>
                                <tr>
                                    <th>投诉单编号</th>
                                    <th>投诉人Id</th>
                                    <th>投诉人名称</th>
                                    <th>投诉内容</th>
                                    <th>投诉日期</th>
                                    <th>处理状态(0-未解决 1-已解决)</th>
                                    <th>修改</th>
                                    <th>删除</th>
                                </tr>
                                </thead>
                                <tbody class="tbody">
                                <c:choose>
                                    <c:when test="${!empty list}">
                                        <c:forEach var="complaint" items="${list}">

                                            <tr>
                                                <td>${complaint.id}</td>
                                                <td>${complaint.resId}</td>
                                                <td>${complaint.resName}</td>
                                                <td>${complaint.content}</td>
                                                <td>${complaint.date}</td>
                                                <c:choose>
                                                    <c:when test="${complaint.state != 0}">
                                                        <td>已解决</td>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <td>未解决</td>
                                                    </c:otherwise>
                                                </c:choose>
                                                <!--
                                                  作者：1040892417@qq.com
                                                  时间：2020-01-11
                                                  描述：修改
                                               -->
                                                <td class="display_form" data-index="${complaint}"><a href="#"
                                                                                                      class="btn btn-default">Edit</a>
                                                </td>

                                                <!--
                                                    作者：1040892417@qq.com
                                                    时间：2020-01-11
                                                    描述：删除
                                                -->
                                                <td>
                                                    <a onclick="deleteConfirm(${complaint.id})" class="btn btn-link">Delete</a>
                                                </td>
                                            </tr>

                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td colspan="7" align="center">${msg}</td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                                </tbody>
                            </table>
                        </div>

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
        <form class="box_form-body" action="${pageContext.request.contextPath }/Complaint/updateComplaint"
              method="post">
            <h2 class="titleInfo">修改投诉单信息</h2>
            <div class="box_form-item">
                <label class="col-sm-2">投诉单编号:</label>
                <input type="text" name="id" readonly="readonly" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">投诉人Id:</label>
                <input type="text" name="resId" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">投诉人名称:</label>
                <input type="text" name="resName" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">投诉内容:</label>
                <input type="text" name="content" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">投诉日期:</label>
                <input type="date" name="date" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">处理状态:</label>
                <%--                <input type="text" name="state">--%>
                <select name="state" required>
                    <option value="1">已解决</option>
                    <option value="0">未解决</option>
                </select>
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
        <form class="box_form-body" action="${pageContext.request.contextPath }/Complaint/adminAddComplaint"
              method="post">
            <h2 class="titleInfo">添加投诉单信息</h2>
            <div class="box_form-item">
                <label class="col-sm-2">投诉人Id:</label>
                <input type="text" name="resId" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">投诉人名称:</label>
                <input type="text" name="resName" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">投诉内容:</label>
                <input type="text" name="content" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">投诉日期:</label>
                <input type="date" name="date" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">处理状态:</label>
                <%--                <input type="text" name="state">--%>
                <select name="state" required>
                    <option value="1">已解决</option>
                    <option value="0">未解决</option>
                </select>
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
<script src="/CpmsHTML/js/AdminComplaints.js"></script>
</body>
</html>