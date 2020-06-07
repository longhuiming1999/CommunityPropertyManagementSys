<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <!--[if IE]>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
    <title>小区物业报修页面</title>
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
                <ol class="breadcrumb">
                    <li>主页</li>
                    <li>小区相关</li>
                    <li class="active">报修</li>
                </ol>
                <h1>小区所有报修信息</h1>
                <p>在这里管理员可以看到小区所有的报修信息.</p>

                <div class="row margin-bottom-30">
                    <div class="col-md-12">
                        <ul class="nav nav-pills">
                            <li class="active"><a href="#">服务 <span class="badge">42</span></a></li>
                            <li><a href="#">贴心 <span class="badge">107</span></a></li>
                            <li><a href="#">高效 <span class="badge">3</span></a></li>
                        </ul>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <h4 class="margin-bottom-15">报修信息:<a href="#" class="btn btn-default" id="addInfo">添加</a>
                                <form class="infoForm" action="#">
                                    <input class='infoSeach' placeholder="请输入用户姓名" name="name"/>
                                    <input class='infoSeach' placeholder="请输入用户电话 " name="phone"/>
                                    报修类型：
                                    <select class='infoSeach' name="type" required>
                                        <option value=""></option>
                                        <option value="修理类">修理类</option>
                                        <option value="服务类">服务类</option>
                                        <option value="售后类">售后类</option>
                                        <option value="其他">其他</option>
                                    </select>
                                    <input class='infoSeach' placeholder="请输入报修内容" name="content"/>
                                    <input class='infoSeach' placeholder="请输入起始时间" type="date" name="startDate"/>
                                    <input class='infoSeach' placeholder="请输入结束时间" type="date" name="endDate"/>
                                    报修状态:
                                    <select class='infoSeach' name="state" required>
                                        <option value=""></option>
                                        <option value="1">已解决</option>
                                        <option value="0">未解决</option>
                                    </select>
                                    <button class='infoSeachBtn' type="button">搜索</button>
                                </form>
                            </h4>
                            <table class="table table-striped table-hover table-bordered">
                                <thead>
                                <tr>
                                    <th>报修单编号</th>
                                    <th>报修人ID</th>
                                    <th>用户名字</th>
                                    <th>用户电话</th>
                                    <th>报修类型</th>
                                    <th>报修说明</th>
                                    <th>报修时间</th>
                                    <th>报修状态(0-未解决 1-已解决)</th>
                                    <th>修改</th>
                                    <th>删除</th>
                                </tr>
                                </thead>
                                <tbody class="tbody">
                                <c:choose>
                                    <c:when test="${!empty list}">
                                        <c:forEach var="repair" items="${list}">

                                            <tr>
                                                <td>${repair.id}</td>
                                                <td>${repair.resId}</td>
                                                <td>${repair.resname}</td>
                                                <td>${repair.phone}</td>
                                                <td>${repair.type}</td>
                                                <td>${repair.content}</td>
                                                <td>${repair.repdate}</td>
                                                <c:choose>
                                                    <c:when test="${repair.state != 0}">
                                                        <td>已付款</td>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <td>未付款</td>
                                                    </c:otherwise>
                                                </c:choose>
                                                <!--
                                                  作者：1040892417@qq.com
                                                  时间：2020-01-11
                                                  描述：修改
                                               -->
                                                <td class="display_form" data-index="${repair}"><a href="#"
                                                                                                   class="btn btn-default">Edit</a>
                                                </td>

                                                <!--
                                                    作者：1040892417@qq.com
                                                    时间：2020-01-11
                                                    描述：删除
                                                -->
                                                <td>
                                                    <a onclick="deleteConfirm(${repair.id})"
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
        <form class="box_form-body" action="${pageContext.request.contextPath }/Repair/updateRepair"
              method="post">
            <h2 class="titleInfo">修改报修信息</h2>
            <div class="box_form-item">
                <label class="col-sm-2">报修单编号:</label>
                <input type="text" name="id" readonly="readonly" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">缴费人ID:</label>
                <input type="text" name="resId" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">用户名字:</label>
                <input type="text" name="resname" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">用户电话:</label>
                <input type="text" name="phone" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">报修类型:</label>
                <select class="form-control margin-bottom-15" id="singleSelect" name="type" required>
                    <option value="修理类">修理类</option>
                    <option value="服务类">服务类</option>
                    <option value="售后类">售后类</option>
                    <option value="其他">其他</option>
                </select>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">报修说明:</label>
                <input type="text" name="content" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">报修时间:</label>
                <input type="date" name="repdate" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">报修状态:</label>
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
        <form class="box_form-body" action="${pageContext.request.contextPath }/Repair/addRepair"
              method="post">
            <h2 class="titleInfo">添加报修信息</h2>
            <div class="box_form-item">
                <label class="col-sm-2">缴费人ID:</label>
                <input type="text" name="resId" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">用户名字:</label>
                <input type="text" name="resname" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">用户电话:</label>
                <input type="text" name="phone" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">报修类型:</label>
                <select class="form-control margin-bottom-15" name="type" required>
                    <option value="修理类">修理类</option>
                    <option value="服务类">服务类</option>
                    <option value="售后类">售后类</option>
                    <option value="其他">其他</option>
                </select>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">报修说明:</label>
                <input type="text" name="content" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">报修时间:</label>
                <input type="date" name="repdate" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">报修状态:</label>
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
<script src="/CpmsHTML/js/AdminRepair.js"></script>
</body>
</html>