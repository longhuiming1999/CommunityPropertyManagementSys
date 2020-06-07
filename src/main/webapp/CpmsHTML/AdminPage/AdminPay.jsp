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
<%@include file="AdminLoginCheckPage.jsp" %>
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
        <%@include file="AdminHead.jsp" %>

        <div class="templatemo-content-wrapper">
            <div class="templatemo-content">
                <ol class="breadcrumb">
                    <li>主页</li>
                    <li>小区相关</li>
                    <li class="active">缴费信息</li>
                </ol>
                <h1>小区所有缴费信息</h1>
                <p>在这里管理员可以看到小区所有的缴费信息.</p>

                <div class="row margin-bottom-30">
                    <div class="col-md-12">
                        <ul class="nav nav-pills">
                            <li class="active"><a href="#"> 日常 <span class="badge">42</span></a></li>
                            <li><a href="#">费用 <span class="badge">107</span></a></li>
                        </ul>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <h4 class="margin-bottom-15">缴费信息如下： <a href="#" class="btn btn-default" id="addInfo">添加</a>
                                <form class="infoForm" action="#">
                                    <input class='infoSeach' placeholder="请输入业主姓名" name="name"/>
                                    缴费类型：
                                    <select class='infoSeach' name="type" required>
                                        <option value=""></option>
                                        <option value="电费">电费</option>
                                        <option value="水费">水费</option>
                                        <option value="燃气费">燃气费</option>
                                        <option value="其他费用">其他费用</option>
                                    </select>
                                    <input class='infoSeach' placeholder="请输入起始金额" type="number" name="startMoney"/>
                                    -
                                    <input class='infoSeach' placeholder="请输入结束金额" type="number" name="endMoney"/>
                                    缴费状态:
                                    <select class='infoSeach' name="state" required>
                                        <option value=""></option>
                                        <option value="1">已缴费</option>
                                        <option value="0">未缴费</option>
                                    </select>
                                    <button class='infoSeachBtn' type="button">搜索</button>
                                </form>
                            </h4>
                            <table class="table table-striped table-hover table-bordered">
                                <thead>
                                <tr>
                                    <th>支付id</th>
                                    <th>用户id</th>
                                    <th>用户名字</th>
                                    <th>缴费类型</th>
                                    <th>缴费金额</th>
                                    <th>缴费状态(0-未缴费 1-已缴费)</th>
                                    <th>修改</th>
                                    <th>删除</th>
                                </tr>
                                </thead>

                                <tbody class="tbody">
                                <c:choose>
                                    <c:when test="${!empty list}">
                                        <c:forEach var="pay" items="${list}">

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
                                                <!--
                                                  作者：1040892417@qq.com
                                                  时间：2020-01-11
                                                  描述：修改
                                               -->
                                                <td class="display_form" data-index="${pay}"><a href="#"
                                                                                                class="btn btn-default">Edit</a>
                                                </td>

                                                <!--
                                                    作者：1040892417@qq.com
                                                    时间：2020-01-11
                                                    描述：删除
                                                -->
                                                <td>
                                                    <a onclick="deleteConfirm(${pay.payId})"
                                                       class="btn btn-link">Delete</a>
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
        <form class="box_form-body" action="${pageContext.request.contextPath }/Pay/updatePay"
              method="post">
            <h2 class="titleInfo">缴费修改</h2>
            <div class="box_form-item">
                <label class="col-sm-2">缴费编号:</label>
                <input type="text" name="payId" readonly="readonly" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">业主编号:</label>
                <input type="text" name="resId" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">业主姓名:</label>
                <input type="text" name="resName" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">缴费类型:</label>
                <%--                <input type="text" name="type">--%>
                <select name="type" required>
                    <option value="电费">电费</option>
                    <option value="水费">水费</option>
                    <option value="燃气费">燃气费</option>
                    <option value="其他费用">其他费用</option>
                </select>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">缴费金额:</label>
                <input type="text" name="money" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">缴费状态:</label>
                <%--                <input type="text" name="state">--%>
                <select name="state" required>
                    <option value="1">已缴费</option>
                    <option value="0">未缴费</option>
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
        <form class="box_form-body" action="${pageContext.request.contextPath }/Pay/addPay" method="post">
            <h2 class="titleInfo">缴费添加</h2>
            <div class="box_form-item">
                <label class="col-sm-2">业主编号:</label>
                <input type="text" name="resId" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">业主姓名:</label>
                <input type="text" name="resName" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">缴费类型:</label>
                <%--                <input type="text" name="type">--%>
                <select name="type" required>
                    <option value="电费">电费</option>
                    <option value="水费">水费</option>
                    <option value="燃气费">燃气费</option>
                    <option value="其他费用">其他费用</option>
                </select>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">缴费金额:</label>
                <input type="text" name="money">
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">缴费状态:</label>
                <%--                <input type="text" name="state">--%>
                <select name="state" required>
                    <option value="1">已缴费</option>
                    <option value="0">未缴费</option>
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
<script src="/CpmsHTML/js/AdminPay.js"></script>
</body>
</html>