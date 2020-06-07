<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <!--[if IE]>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
    <title>小区维修</title>
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

        <%@include file="AdminHead.jsp" %>

        <div class="templatemo-content-wrapper">
            <div class="templatemo-content">
                <ol class="breadcrumb">
                    <li><a>主页</a></li>
                    <li><a>个人管理</a></li>
                    <li class="active">维修信息表</li>
                </ol>
                <h1>小区所有维修信息</h1>
                <p>在这里管理员可以看到小区所有的维修信息.</p>

                <div class="row margin-bottom-30">
                    <div class="col-md-12">
                        <ul class="nav nav-pills">
                            <li class="active"><a href="#">改造 <span class="badge">42</span></a></li>
                            <li><a href="#">创新 <span class="badge">107</span></a></li>
                            <li><a href="#">完善 <span class="badge">3</span></a></li>
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
                        <!--
                            作者：1347515620@qq.com
                            时间：2020-01-11
                            描述：车位信息表头
                        -->
                        <div class="table-responsive">
                            <h4 class="margin-bottom-15">维修信息: <a href="#" class="btn btn-default" id="addInfo">添加</a>
                                <form class="infoForm" action="#">
                                    维修类型:
                                    <select class='infoSeach' name="type" required>
                                        <option value=""></option>
                                        <option value="公共设施">公共设施</option>
                                        <option value="单元设施">单元设施</option>
                                        <option value="其他">其他</option>
                                    </select>
                                    <input class='infoSeach' placeholder="请输入维修内容" name="content"/>
                                    <input class='infoSeach' placeholder="请输入维修起始金额" type="number" name="startMoney"/>
                                    -
                                    <input class='infoSeach' placeholder="请输入维修结束金额" type="number" name="endMoney"/>
                                    <input class='infoSeach' placeholder="请输入维修起始日期" type="date" name="startDate"/>
                                    -
                                    <input class='infoSeach' placeholder="请输入维修结束日期" type="date" name="endDate"/>
                                    维修状态:
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
                                    <th>维修编号</th>
                                    <th>维修类型</th>
                                    <th>维修内容</th>
                                    <th>维修花费</th>
                                    <th>维修日期</th>
                                    <th>维修状态(0-未解决 1-已解决)</th>
                                    <th>修改</th>
                                    <th>删除</th>
                                </tr>
                                </thead>
                                <!--
                                    作者：1347515620@qq.com
                                    时间：2020-01-11
                                    描述：车位信息表内容
                                -->
                                <tbody class="tbody">
                                <c:choose>
                                    <c:when test="${!empty list}">
                                        <c:forEach var="service" items="${list}">

                                            <tr>
                                                <td>${service.id}</td>
                                                <td>${service.type}</td>
                                                <td>${service.content}</td>
                                                <td>${service.cost}</td>
                                                <td>${service.date}</td>
                                                <c:choose>
                                                    <c:when test="${service.state != 0}">
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
                                                <td class="display_form" data-index="${service}"><a href="#"
                                                                                                    class="btn btn-default">Edit</a>
                                                </td>

                                                <!--
                                                    作者：1040892417@qq.com
                                                    时间：2020-01-11
                                                    描述：删除
                                                -->
                                                <td>
                                                    <a onclick="deleteConfirm(${service.id})"
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
                                </tbody>
                            </table>
                        </div>

                        <!--
                            作者：1347515620@qq.com
                            时间：2020-01-11
                            描述：分页查询
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
    <!--
    	作者：1347515620@qq.com
    	时间：2020-01-11
    	描述：使用的样式链接
    -->
</div>

<%-- 修改表单 --%>
<div class="box">
    <div class="box_form">
        <form class="box_form-body" action="${pageContext.request.contextPath }/Server/updateService"
              method="post">
            <h2 class="titleInfo">修改维修信息</h2>
            <div class="box_form-item">
                <label class="col-sm-2">维修编号:</label>
                <input type="text" name="id" readonly="readonly" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">维修类型:</label>
                <select name="type" required>
                    <option value="公共设施">公共设施</option>
                    <option value="单元设施">单元设施</option>
                    <option value="其他">其他</option>
                </select>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">维修内容:</label>
                <input type="text" name="content" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">维修花费:</label>
                <input type="text" name="cost" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">维修日期</label>
                <input type="date" name="date" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">维修状态:</label>
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
        <form class="box_form-body" action="${pageContext.request.contextPath }/Server/addService"
              method="post">
            <h2 class="titleInfo">添加维修信息</h2>
            <div class="box_form-item">
                <label class="col-sm-2">维修类型:</label>
                <select name="type" required>
                    <option value="公共设施">公共设施</option>
                    <option value="单元设施">单元设施</option>
                    <option value="其他">其他</option>
                </select>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">维修内容:</label>
                <input type="text" name="content" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">维修花费:</label>
                <input type="text" name="cost" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">维修日期</label>
                <input type="date" name="date" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">维修状态:</label>
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
<script src="/CpmsHTML/js/AdminServer.js"></script>
</body>
</html>