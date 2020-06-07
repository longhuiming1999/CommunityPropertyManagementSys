<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%
    String webPath = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":"
            + request.getServerPort() + webPath + "/CpmsHTML/";
%>

<head>
    <meta charset="utf-8">
    <!--[if IE]>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
    <title>物业管理系统</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <meta name="viewport" content="width=device-width">
    <link rel="stylesheet" href="<%=basePath %>css/templatemo_main.css">
</head>
<body>
<%@include file="AdminLoginCheckPage.jsp" %>
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

    <!--
        作者：1040892417@qq.com
        时间：2020-01-11
        描述：主页面左上角信息
    -->
    <div class="templatemo-content-wrapper">
        <div class="templatemo-content">
            <h1>欢迎您！管理人员：${admin.account }</h1>
            <p>欢迎使用本物业管理系统！服务宗旨：方便快捷！</p>
            <div class="margin-bottom-30">
                <div class="row">
                    <div class="col-md-12">
                        <ul class="nav nav-pills">
                            <li class="active"><a href="#">专业 <span class="badge">42</span></a></li>
                            <li class="active"><a href="#">可靠 <span class="badge">126</span></a></li>
                            <li class="active"><a href="#">信息化 <span class="badge">14</span></a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="templatemo-alerts">
                        <div class="row">
                            <!--
                                作者：1040892417@qq.com
                                时间：2020-01-11
                                描述： 可看信息条部分
                            -->
                            <div class="col-md-12">
                                <div class="alert alert-success alert-dismissible" role="alert">
                                    <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span
                                            class="sr-only">Close</span></button>
                                    <strong>创安全文明小区，建安居乐业家园!</strong>
                                </div>
                                <div class="alert alert-info alert-dismissible" role="alert">
                                    <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span
                                            class="sr-only">Close</span></button>
                                    业主至上，服务至尊。
                                </div>
                                <div class="alert alert-warning alert-dismissible" role="alert">
                                    <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span
                                            class="sr-only">Close</span></button>
                                    全心全意为业主服务！创造美丽家园！
                                </div>
                                <div class="alert alert-danger alert-dismissible" role="alert">
                                    <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span
                                            class="sr-only">Close</span></button>
                                    提高物业管理意识，提升物业价值。
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="templatemo-progress">
                        <div class="list-group">
                            <a href="#" class="list-group-item active">
                                <h4 class="list-group-item-heading">温暖社区</h4>
                                <p class="list-group-item-text">
                                    我当社区服务使者，你享和谐社区生活!
                                </p>
                            </a>
                            <a href="#" class="list-group-item">
                                <h4 class="list-group-item-heading">新型小区建设</h4>
                                <p class="list-group-item-text">
                                    警民携手，共建社区平安；邻里协作，共筑一方乐园!
                                </p>
                            </a>
                        </div>

                        <!--
                            作者：1040892417@qq.com
                            时间：2020-01-11
                            描述：这是一个进度条
                        -->
                        <div class="progress">
                            <div class="progress-bar progress-bar-success" style="width: 35%">
                                <span class="sr-only">35% Complete (success)</span>
                            </div>
                            <div class="progress-bar progress-bar-warning progress-bar-striped" style="width: 20%">
                                <span class="sr-only">20% Complete (warning)</span>
                            </div>
                            <div class="progress-bar progress-bar-danger" style="width: 10%">
                                <span class="sr-only">10% Complete (danger)</span>
                            </div>
                        </div>


                        <div class="progress">
                            <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="45"
                                 aria-valuemin="0" aria-valuemax="100" style="width: 45%">
                                <span class="sr-only">45% Complete</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="templatemo-panels">
                <div class="row">
                    <div class="col-md-6 col-sm-6 margin-bottom-30">
                        <div class="panel panel-success">
                            <div class="panel-heading">Data Visualization</div>
                            <canvas id="templatemo-line-chart" height="120" width="500"></canvas>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6 margin-bottom-30">

                        <!--
                            作者：1040892417@qq.com
                            时间：2020-01-11
                            描述：管理员表单
                        -->
                        <div class="panel panel-primary">
                            <div class="panel-heading">小区管理人员名单</div>
                            <div class="panel-body">
                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>管理人员名字</th>
                                        <th>管理员账号</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>龙会铭</td>
                                        <td>@lhm001</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>


                        <!--
                            作者：1040892417@qq.com
                            时间：2020-01-11
                            描述：点击差点可以看详细信息
                        -->
                        <span class="btn btn-primary"><a href="javascript:void(0)">查看</a></span>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 col-sm-6">
                        <!--
                            作者：1040892417@qq.com
                            时间：2020-01-11
                            描述：这一块是左下栏
                        -->
                        <ul class="nav nav-tabs" role="tablist" id="templatemo-tabs">
                            <li><a href="#profile" role="tab" data-toggle="tab">小区新闻</a></li>
                            <li><a href="#messages" role="tab" data-toggle="tab">注意事项</a></li>
                        </ul>

                        <!-- Tab panes -->
                        <div class="tab-content">
                            <!--
                                作者：1040892417@qq.com
                                时间：2020-01-11
                                描述：左下第二栏
                            -->
                            <div class="tab-pane fade" id="profile">
                                <ul class="list-group">
                                    <li class="list-group-item">
                                        <span class="badge">33</span>
                                        南门道路已经翻新，新型小区全面建成!
                                    </li>
                                    <li class="list-group-item">
                                        <span class="badge">9</span>
                                        小区中心露天泳池计划2020-4-25建成!
                                    </li>
                                    <li class="list-group-item">
                                        <span class="badge">0</span>
                                        长沙最近房产地段售价
                                    </li>
                                    <li class="list-group-item">
                                        <span class="badge">14</span>
                                        专家指出国内疫情已经得到完全控制
                                    </li>
                                    <li class="list-group-item">
                                        <span class="badge">2</span>
                                        健康小区！小区将采购一批新的健身设施
                                    </li>
                                </ul>
                            </div>

                            <!--
                                作者：1040892417@qq.com
                                时间：2020-01-11
                                描述：左下第三栏
                            -->
                            <div class="tab-pane fade" id="messages">
                                <div class="list-group">
                                    <a href="#" class="list-group-item active">
                                        近段时期为非常时期，各小区业主应该要提高防疫意识，减少出门次数，做好防疫措施!
                                    </a>
                                    <a href="#" class="list-group-item">响应国家一级防疫警报</a>
                                    <a href="#" class="list-group-item">关于'新冠',你了解多少</a>
                                    <a href="#" class="list-group-item">少出门，勤洗手，保持个人卫生</a>
                                    <a href="#" class="list-group-item">垃圾分类</a>
                                </div>
                            </div>
                        </div> <!-- tab-content -->
                    </div>

                    <!--
                        作者：1040892417@qq.com
                        时间：2020-01-11
                        描述：右下栏
                    -->
                    <div class="col-md-6 col-sm-6">
                        <div class="panel-group" id="accordion">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                            联系我们：
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseOne" class="panel-collapse collapse in">
                                    <div class="panel-body">
                                        姓名：龙先生
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                                            手机号码：13030303399
                                        </a>
                                    </h4>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                                            邮箱：13215479514@qq.com
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseThree" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <button type="button" id="loading-example-btn" data-loading-text="Loading..."
                                                class="btn btn-primary">
                                            Click here
                                        </button>
                                        to load.
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
    <%@include file="../AdminExit.jsp" %>
    <!--
        作者：1347515620@qq.com
        时间：2020-01-11
        描述：底部div
    -->

    <script src="<%=basePath %>js/jquery.min.js"></script>
    <script src="<%=basePath %>js/bootstrap.min.js"></script>
    <script src="<%=basePath %>js/Chart.min.js"></script>
    <script src="<%=basePath %>js/templatemo_script.js"></script>
</div>


</body>
</html>