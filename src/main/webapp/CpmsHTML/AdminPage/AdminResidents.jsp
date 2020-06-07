<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <!--[if IE]>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
    <title>小区业主</title>
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
                    <li class="active">小区业主</li>
                </ol>
                <!--
                    作者：1040892417@qq.com
                    时间：2020-01-11
                    描述：标题
                -->
                <h1>小区所有业主信息</h1>
                <p>在这里管理员可以看到小区所有的业主信息.</p>

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

                            <h4 class="margin-bottom-15 infoHeader">业主信息如下：
                                <a href="#" class="btn btn-default" id="addInfo">添加</a>
                                <form class="infoForm" action="#">
                                    <input class='infoSeach' placeholder="请输入姓名" name="name"/>
                                    <input class='infoSeach' placeholder="请输入起始年龄" type="number" name="startAge"/>
                                    -
                                    <input class='infoSeach' placeholder="请输入结束年龄" type="number" name="endAge"/>
                                    <select class='infoSeach' name="sex">
                                        <option value=""></option>
                                        <option value="男">男</option>
                                        <option value="女">女</option>
                                    </select>
                                    <input class='infoSeach' placeholder="请输入联系方式" name="phone"/>
                                    <input class='infoSeach' placeholder="请输入起始日期" type="date" name="startDate"/>
                                    -
                                    <input class='infoSeach' placeholder="请输入结束日期" type="date" name="endDate"/>
                                    <button class='infoSeachBtn' type="button">搜索</button>
                                </form>
                            </h4>
                            <table class="table table-striped table-hover table-bordered">
                                <thead>
                                <tr>
                                    <th>业主编号</th>
                                    <th>业主姓名</th>
                                    <th>业主年龄</th>
                                    <th>业主性别</th>
                                    <th>联系方式</th>
                                    <th>入住日期</th>
                                    <th>备注</th>
                                    <th>修改</th>
                                    <th>删除</th>
                                </tr>
                                </thead>
                                <tbody class="tbody">
                                <c:choose>
                                    <c:when test="${!empty list }">

                                        <c:forEach var="resident" items="${list}">
                                            <tr>
                                                <td>${resident.id}</td>
                                                <td>${resident.name}</td>
                                                <td>${resident.age}</td>
                                                <td>${resident.sex}</td>
                                                <td>${resident.phone}</td>
                                                <td>${resident.checkInDate}</td>
                                                <td>${resident.remark}</td>
                                                <!--
                                                   作者：1040892417@qq.com
                                                   时间：2020-01-11
                                                   描述：修改
                                                -->
                                                <td class="display_form" data-index="${resident}"><a href="#"
                                                                                                     class="btn btn-default">Edit</a>
                                                </td>

                                                <!--
                                                    作者：1040892417@qq.com
                                                    时间：2020-01-11
                                                    描述：删除
                                                -->
                                                <td>
                                                    <a onclick="deleteConfirm(${resident.id})"
                                                       class="btn btn-link">Delete</a>
                                                </td>
                                            </tr>
                                        </c:forEach>

                                    </c:when>

                                    <c:otherwise>
                                        <tr>
                                            <td colspan="9" align="center">${msg}</td>
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
        <form class="box_form-body" action="${pageContext.request.contextPath }/Resident/updResident"
              method="post">
            <h2 class="titleInfo">业主修改</h2>
            <div class="box_form-item">
                <label for="updFormResId" class="col-sm-2">业主编号:</label>
                <input id="updFormResId" type="text" name="id" readonly="readonly" required>
            </div>
            <div class="box_form-item">
                <label for="updFormResNameId" class="col-sm-2">业主姓名:</label>
                <input id="updFormResNameId" type="text" name="name" required>
            </div>
            <div class="box_form-item">
                <label for="updFormResAge" class="col-sm-2">业主年龄:</label>
                <input id="updFormResAge" type="number" name="age" required>
            </div>
            <div class="box_form-item">
                <label for="updFormResSex" class="col-sm-2">业主性别:</label>
                <select id="updFormResSex" name="sex" required>
                    <option value="男">男</option>
                    <option value="女">女</option>
                </select>
            </div>
            <div class="box_form-item">
                <label for="updFormResPhone" class="col-sm-2">联系方式:</label>
                <input id="updFormResPhone" type="text" name="phone" required>
            </div>
            <div class="box_form-item">
                <label for="updFormResCheckInDate" class="col-sm-2">入住日期:</label>
                <input id="updFormResCheckInDate" type="date" name="checkInDate" required>
            </div>
            <div class="box_form-item">
                <label for="updFormResRemark" class="col-sm-2">备注:</label>
                <%--                备注:<textarea id="updFormResRemark" name="remark" required/>--%>
                <input id="updFormResRemark" type="text" name="remark" required/>
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
        <form class="box_form-body" action="${pageContext.request.contextPath }/Resident/addResident"
              method="post">
            <h2 class="titleInfo">添加业主</h2>
            <div class="box_form-item">
                <label class="col-sm-2">业主姓名:</label>
                <input type="text" name="name" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">业主年龄:</label>
                <input type="number" name="age" required digits=true>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">业主性别:</label>
                <select name="sex" required>
                    <option value="男">男</option>
                    <option value="女">女</option>
                </select>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">联系方式:</label>
                <input type="text" name="phone" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">入住日期:</label>
                <input type="date" name="checkInDate" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">备注:</label>
                <input type="text" name="remark" required>
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
<script src="/CpmsHTML/js/AdminResident.js"></script>
</body>
</html>