<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <!--[if IE]>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
    <title>我要投诉</title>
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
        <!--
              作者：1040892417@qq.com
              时间：2020-01-11
              描述：主页导航栏信息
      -->
        <%@include file="UserHead.jsp" %>

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
                    <li class="active">我要投诉</li>
                </ol>
                <!--
                    作者：1040892417@qq.com
                    时间：2020-01-11
                    描述：标题
                -->
                <h1>投诉</h1>
                <p>在这您可以向物业公司诉说你的问题.</p>

                <div class="row margin-bottom-30">
                    <div class="col-md-12">
                        <ul class="nav nav-pills">
                            <li class="active"><a href="#">反馈 <span class="badge">42</span></a></li>
                            <li><a href="#">投诉 <span class="badge">107</span></a></li>
                            <li><a href="#">可靠 <span class="badge">34</span></a></li>
                        </ul>
                    </div>
                </div>

                <!--
                    作者：1040892417@qq.com
                    时间：2020-01-11
                    描述：form 投诉区域
                -->
                <div class="row">
                    <div class="col-md-12">


                        <form role="form" id="templatemo-preferences-form"
                              action="${pageContext.request.contextPath}/Complaint/addComplaint"
                              method="post">
                            <!--
                                作者：1040892417@qq.com
                                时间：2020-01-11
                                描述：投诉人名字
                            -->
                            <div class="row">
                                <div class="col-md-6 margin-bottom-15">
                                    <label for="name" class="control-label">投诉人名字</label>
                                    <input type="text" class="form-control" id="name" name="resName" value="John">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 margin-bottom-15">
                                    <label for="content">投诉内容</label>
                                    <textarea class="form-control" rows="3" name="content" id="content"></textarea>
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