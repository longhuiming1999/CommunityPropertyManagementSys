<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
                    <li>个人管理</li>
                    <li class="active">维修信息表</li>
                </ol>
                <h1>维修信息</h1>
                <p>通过向物业公司提醒小区需要维护的事项，让您所在的小区更加美好</p>

                <div class="row margin-bottom-30">
                    <div class="col-md-12">
                        <ul class="nav nav-pills">
                            <li class="active"><a href="#">建设小区 <span class="badge">42</span></a></li>
                            <li><a href="#">意见 <span class="badge">107</span></a></li>
                        </ul>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">


                        <form role="form" id="templatemo-preferences-form"
                              action="${pageContext.request.contextPath}/Server/submitServer"
                              method="post">

                            <div class="row">
                                <div class="col-md-6 margin-bottom-15">
                                    <label for="singleSelect">维修类型</label>
                                    <select class="form-control margin-bottom-15" id="singleSelect" name="type">
                                        <option value="公共设施">公共设施</option>
                                        <option value="单元设施">单元设施</option>
                                        <option value="其他">其他</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 margin-bottom-15">
                                    <label for="content">维修内容说明</label>
                                    <textarea class="form-control" rows="3" id="content" name="content" required></textarea>
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
<script src="/CpmsHTML/js/jquery.min.js"></script>
<script src="/CpmsHTML/js/bootstrap.min.js"></script>
<script src="/CpmsHTML/js/templatemo_script.js"></script>
</body>
</html>