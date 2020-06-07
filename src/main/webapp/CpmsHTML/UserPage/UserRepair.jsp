<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
<%@include file="UserLoginCheckPage.jsp" %>
<div id="main-wrapper">
    <div class="navbar navbar-inverse" role="navigation">
        <div class="navbar-header">
            <div class="logo"><h1>小区报修</h1></div>
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
                    <li class="active">报修</li>
                </ol>
                <h1>报修页面</h1>
                <p>向物业公司请求帮助,解决困扰您的问题！</p>

                <div class="row margin-bottom-30">
                    <div class="col-md-12">
                        <ul class="nav nav-pills">
                            <li class="active"><a href="#">服务 <span class="badge">42</span></a></li>
                            <li><a href="#">问题解决 <span class="badge">107</span></a></li>
                        </ul>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">


                        <form role="form" id="templatemo-preferences-form"
                              action="${pageContext.request.contextPath}/Repair/submitRepair"
                              method="post">
                            <div class="row">
                                <div class="col-md-6 margin-bottom-15">
                                    <label for="resName" class="control-label">报修人名字</label>
                                    <input type="text" class="form-control" id="resName" name="resname" value="您的名字">
                                </div>
                                <div class="col-md-6 margin-bottom-15">
                                    <label for="phone" class="control-label">报修人电话</label>
                                    <input type="text" class="form-control" id="phone" name="phone"
                                           value="${userLogin.phone}">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 margin-bottom-15">
                                    <label for="singleSelect">报修类型</label>
                                    <select class="form-control margin-bottom-15" id="singleSelect" name="type">
                                        <option value="修理类">修理类</option>
                                        <option value="服务类">服务类</option>
                                        <option value="售后类">售后类</option>
                                        <option value="其他">其他</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 margin-bottom-15">
                                    <label for="content">报修说明</label>
                                    <textarea class="form-control" rows="3" id="content" name="content"></textarea>
                                </div>
                            </div>

                            <div class="row templatemo-form-buttons">
                                <div class="col-md-12">
                                    <button type="submit" class="btn btn-primary">提交</button>
                                    <button type="reset" class="btn btn-default">重置</button>
                                </div>
                            </div>
                        </form>

                        <div class="row">
                            <div class="col-md-12 margin-bottom-15">
                                <label>${msg}</label>
                            </div>
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