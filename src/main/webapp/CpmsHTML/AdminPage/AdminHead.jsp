<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<div class="navbar-collapse collapse templatemo-sidebar">

    <!--
        作者：1040892417@qq.com
        时间：2020-01-11
        描述：菜单
    -->
    <ul class="templatemo-sidebar-menu">
        <li class="active"><a href="${pageContext.request.contextPath }/CpmsHTML/AdminPage/AdminIndex.jsp"><i
                class="fa fa-home"></i>主页</a></li>
        <li class="sub open">
            <a href="#">
                <i class="fa fa-users"></i> 管理员账号管理
                <div class="pull-right"><span class="caret"></span></div>
            </a>
            <ul class="templatemo-submenu">
                <li><a href="${pageContext.request.contextPath}/Admin/findAllAdmin">管理员账号信息</a></li>
                <li><a href="/CpmsHTML/AdminPage/AdminUserLoginManage.jsp">前台用户账号信息</a></li>
            </ul>
        </li>

        <li class="sub open">
            <a href="javascript:;">
                <i class="fa fa-database"></i> 小区相关
                <div class="pull-right"><span class="caret"></span></div>
            </a>
            <ul class="templatemo-submenu">
                <li><a href="/CpmsHTML/AdminPage/AdminResidents.jsp">小区业主</a></li>
                <li><a href="/CpmsHTML/AdminPage/AdminHouseInfo.jsp">小区房产</a></li>
                <li><a href="/CpmsHTML/AdminPage/AdminCar.jsp">小区车位</a></li>
                <li><a href="/CpmsHTML/AdminPage/AdminPay.jsp">缴费信息</a></li>
                <li><a href="/CpmsHTML/AdminPage/AdminServer.jsp">维修信息</a></li>
                <li><a href="/CpmsHTML/AdminPage/AdminRepair.jsp">报修信息</a></li>
                <li><a href="/CpmsHTML/AdminPage/AdminComplaintsInfo.jsp">投诉信息</a></li>
            </ul>
        </li>

        <li><a href="#" data-toggle="modal" data-target="#confirmModal"><i class="fa fa-sign-out"></i>Sign Out</a></li>
    </ul>
</div><!--/.navbar-collapse -->
</body>
</html>