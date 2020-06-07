<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<head>
    <%@include file="AdminLoginCheckPage.jsp" %>
    <meta charset="utf-8">
    <!--[if IE]>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
    <title>小区房产</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <meta name="viewport" content="width=device-width">
    <link rel="stylesheet" href="/CpmsHTML/css/templatemo_main.css">
</head>
<body>
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
                    <li class="active">小区房产</li>
                </ol>
                <!--
                    作者：1040892417@qq.com
                    时间：2020-01-11
                    描述：标题
                -->
                <h1>小区所有房产信息</h1>
                <p>在这里管理员可以看到小区所有的房产信息.</p>

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
                            <h4 class="margin-bottom-15">房子信息如下： <a href="#" class="btn btn-default" id="addInfo">添加</a>
                                <form class="infoForm" action="#">
                                    栋号:
                                    <select class='infoSeach' name="buildNum" required>
                                        <option value=""></option>
                                        <option value="A栋">A栋</option>
                                        <option value="B栋">B栋</option>
                                    </select>
                                    单元号：
                                    <select class='infoSeach' name="unit" required>
                                        <option value=""></option>
                                        <option value="1单元">1单元</option>
                                        <option value="2单元">2单元</option>
                                        <option value="3单元">3单元</option>
                                    </select>
                                    楼层号:
                                    <select class='infoSeach' name="floor" required>
                                        <option value=""></option>
                                        <option value="1楼">1楼</option>
                                        <option value="2楼">2楼</option>
                                        <option value="3楼">3楼</option>
                                        <option value="4楼">4楼</option>
                                        <option value="5楼">5楼</option>
                                        <option value="6楼">6楼</option>
                                        <option value="7楼">7楼</option>
                                        <option value="8楼">8楼</option>
                                    </select>
                                    <input class='infoSeach' placeholder="请输入房间号" name="houseNum"/>
                                    <input class='infoSeach' placeholder="请输入住户名称" name="name"/>
                                    <input class='infoSeach' placeholder="请输入联系方式" name="phone"/>
                                    <button class='infoSeachBtn' type="button">搜索</button>
                                </form>
                            </h4>
                            <table class="table table-striped table-hover table-bordered">
                                <thead>
                                <tr>
                                    <th>房产编号</th>
                                    <th>栋号</th>
                                    <th>单元号</th>
                                    <th>楼层号</th>
                                    <th>房间号</th>
                                    <th>住户编号</th>
                                    <th>住户名称</th>
                                    <th>联系方式</th>
                                    <th>修改</th>
                                    <th>删除</th>
                                </tr>
                                </thead>
                                <tbody class="tbody">
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
        <form class="box_form-body" action="${pageContext.request.contextPath }/House/updateHouse"
              method="post">
            <h2 class="titleInfo">房产修改</h2>
            <div class="box_form-item">
                <label class="col-sm-2">房子编号:</label>
                <input type="text" name="id" readonly="readonly" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">栋号:</label>
                <select name="buildNum" required>
                    <option value="A栋">A栋</option>
                    <option value="B栋">B栋</option>
                    <option value="C栋">C栋</option>
                </select>
                <%--                <input type="text" name="buildNum" required>--%>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">单元号:</label>
                <select name="unit" required>
                    <option value="1单元">1单元</option>
                    <option value="2单元">2单元</option>
                    <option value="3单元">3单元</option>
                </select>
                <%--                <input type="text" name="unit">--%>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">楼层号:</label>
                <%--                <input type="number" name="floor" required>--%>
                <select name="floor" required>
                    <option value="1楼">1楼</option>
                    <option value="2楼">2楼</option>
                    <option value="3楼">3楼</option>
                    <option value="4楼">4楼</option>
                    <option value="5楼">5楼</option>
                    <option value="6楼">6楼</option>
                    <option value="7楼">7楼</option>
                    <option value="8楼">8楼</option>
                </select>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">房间号:</label>
                <input type="text" name="houseNum" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">住户编号:</label>
                <input type="text" name="resId" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">住户名称:</label>
                <input type="text" name="name" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">联系方式:</label>
                <input type="text" name="phone" required>
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
        <form class="box_form-body" action="${pageContext.request.contextPath }/House/addHouse"
              method="post">
            <h2 class="titleInfo">添加房子</h2>
            <div class="box_form-item">
                <label class="col-sm-2">栋号:</label>
                <%--                <input type="text" name="buildNum">--%>
                <select name="buildNum" required>
                    <option value="A栋">A栋</option>
                    <option value="B栋">B栋</option>
                </select>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">单元号:</label>
                <%--                <input type="text" name="unit">--%>
                <select name="unit" required>
                    <option value="1单元">1单元</option>
                    <option value="2单元">2单元</option>
                    <option value="3单元">3单元</option>
                </select>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">楼层号:</label>
                <%--                <input type="number" name="floor" required>--%>
                <select name="floor" required>
                    <option value="1楼">1楼</option>
                    <option value="2楼">2楼</option>
                    <option value="3楼">3楼</option>
                    <option value="4楼">4楼</option>
                    <option value="5楼">5楼</option>
                    <option value="6楼">6楼</option>
                    <option value="7楼">7楼</option>
                    <option value="8楼">8楼</option>
                </select>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">房间号:</label>
                <input type="text" name="houseNum" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">住户编号:</label>
                <input type="text" name="resId" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">住户名称:</label>
                <input type="text" name="name" required>
            </div>
            <div class="box_form-item">
                <label class="col-sm-2">联系方式:</label>
                <input type="text" name="phone" required>
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
<script src="/CpmsHTML/js/AdminHouse.js"></script>
</body>
</html>