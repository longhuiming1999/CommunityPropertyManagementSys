<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>

<head>
    <meta charset="utf-8">
    <!--[if IE]>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
    <title>小区车位表</title>
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
                    <li>主页</li>
                    <li>个人管理</li>
                    <li class="active">车位信息表</li>
                </ol>
                <h1>小区所有车位信息</h1>
                <p>在这里管理员可以看到小区所有的车位信息.</p>

                <div class="row margin-bottom-30">
                    <div class="col-md-12">
                        <ul class="nav nav-pills">
                            <li class="active"><a href="#">华丽 <span class="badge">42</span></a></li>
                            <li><a href="#">专属 <span class="badge">107</span></a></li>
                            <li><a href="#">独特 <span class="badge">3</span></a></li>
                        </ul>
                    </div>
                </div>
                <div class="row">
                        <!--
                            时间：2020-01-11
                            描述：车位信息表头
                        -->
                        <div class="table-responsive">
                            <!--
                                作者：1040892417@qq.com
                                时间：2020-01-11
                                描述：添加功能按钮
                            -->

                            <h4 class="margin-bottom-15">车位信息如下： <a href="#" class="btn btn-default" id="addInfo">添加</a>
                                <form class="infoForm" action="#">
                                    <input class='infoSeach' placeholder="请输入业主姓名" name="name"/>
                                    <input class='infoSeach' placeholder="请输入车牌号 " name="resPlateNum"/>
                                    <input class='infoSeach' placeholder="请输入出售起始金额" type="number" name="startMoney"/>
                                    -
                                    <input class='infoSeach' placeholder="请输入出售结束金额" type="number" name="endMoney"/>
                                    出租状态：
                                    <select class='infoSeach' name="isRent">
                                        <option value=""></option>
                                        <option value="1">同意</option>
                                        <option value="0">不同意</option>
                                    </select>
                                    <button class='infoSeachBtn' type="button">搜索</button>
                                </form>
                            </h4>
                            <table class="table table-striped table-hover table-bordered">
                                <thead>
                                <tr>
                                    <th>车位表Id</th>
                                    <th>业主Id</th>
                                    <th>业主名字</th>
                                    <th>业主车牌号</th>
                                    <th>出售金额</th>
                                    <th>是否转租(0-不同意转租 1-同意转租)</th>
                                    <th>修改</th>
                                    <th>删除</th>
                                </tr>
                                </thead>
                                <tbody class="tbody">
                                <c:choose>
                                    <c:when test="${!empty list}">
                                        <c:forEach var="carport" items="${list}">

                                            <tr>
                                                <td>${carport.id}</td>
                                                <td>${carport.resId}</td>
                                                <td>${carport.resName}</td>
                                                <td>${carport.resPlateNum}</td>
                                                <td>${carport.sellMoney}</td>
                                                <c:choose>
                                                    <c:when test="${carport.isRent != 0}">
                                                        <td>同意</td>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <td>不同意</td>
                                                    </c:otherwise>
                                                </c:choose>
                                                <!--
                                                  作者：1040892417@qq.com
                                                  时间：2020-01-11
                                                  描述：修改
                                               -->
                                                <td class="display_form" data-index="${carport}"><a href="#"
                                                                                                    class="btn btn-default">Edit</a>
                                                </td>

                                                <!--
                                                    作者：1040892417@qq.com
                                                    时间：2020-01-11
                                                    描述：删除
                                                -->
                                                <td>
                                                    <a onclick="deleteConfirm(${carport.id})"
                                                       class="btn btn-link">Delete</a></td>
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
        <form class="box_form-body" action="${pageContext.request.contextPath }/Car/updateCarPort"
              method="post">
            <h2 class="titleInfo">修改车位信息</h2>
            <div class="box_form-item">
                <label class="col-sm-2">车位表Id:</label>
                <input type="text" name="id" readonly="readonly" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">业主Id:</label>
                <input type="text" name="resId" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">业主姓名:</label>
                <input type="text" name="resName" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">业主车牌号:</label>
                <input type="text" name="resPlateNum" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">出售金额:</label>
                <input type="text" name="sellMoney" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">是否转租:</label>
                <%--                <input type="text" name="isRent">--%>
                <select name="isRent" required>
                    <option value="1">是</option>
                    <option value="0">否</option>
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
        <form class="box_form-body" action="${pageContext.request.contextPath }/Car/addCarPort"
              method="post">
            <h2 class="titleInfo">添加车位</h2>
            <div class="box_form-item">
                <label class="col-sm-2">业主Id:</label>
                <input type="text" name="resId" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">业主姓名:</label>
                <input type="text" name="resName" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">业主车牌号:</label>
                <input type="text" name="resPlateNum" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">出售金额:</label>
                <input type="text" name="sellMoney" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">是否转租:</label>
                <%--                <input type="text" name="isRent" >--%>
                <select name="isRent" required>
                    <option value="1">是</option>
                    <option value="0">否</option>
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
<script src="/CpmsHTML/js/AdminCar.js"></script>
</body>
</html>