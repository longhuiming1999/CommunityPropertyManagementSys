<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>

<div class="navbar-collapse collapse templatemo-sidebar">
    <!--
        作者：1040892417@qq.com
        时间：2020-01-11
        描述：菜单
    -->
    <ul class="templatemo-sidebar-menu">
        <li class="active"><a href="${pageContext.request.contextPath}/CpmsHTML/UserPage/UserIndex.jsp"><i class="fa fa-home"></i>主页</a></li>
        <li class="sub open">
            <a href="javascript:;">
                <i class="fa fa-users"></i> 个人账号管理
                <div class="pull-right"><span class="caret"></span></div>
            </a>
            <ul class="templatemo-submenu">
                <li><a href="${pageContext.request.contextPath}/CpmsHTML/UserPage/UserInfoUpd.jsp">修改账号信息</a></li>
            </ul>
        </li>

        <li class="sub open">
            <a href="javascript:;">
                <i class="fa fa-database"></i> 小区相关
                <div class="pull-right"><span class="caret"></span></div>
            </a>
            <ul class="templatemo-submenu">
                <li><a href="${pageContext.request.contextPath}/House/findHouseById">我的房产</a></li>
                <li><a href="${pageContext.request.contextPath}/Car/findCarPortByResId">我的车位</a></li>
                <li><a href="${pageContext.request.contextPath}/Pay/findPayById">缴费相关</a></li>
                <li><a href="${pageContext.request.contextPath}/CpmsHTML/UserPage/UserServer.jsp">申请维修</a></li>
                <li><a href="${pageContext.request.contextPath}/CpmsHTML/UserPage/UserRepair.jsp">申请报修</a></li>
                <li><a href="${pageContext.request.contextPath}/CpmsHTML/UserPage/UserComplaints.jsp">我要投诉</a></li>
            </ul>
        </li>


        <li><a href="#" data-toggle="modal" data-target="#confirmModal"><i class="fa fa-sign-out"></i>Sign Out</a></li>
    </ul>
</div>
<!--/.navbar-collapse -->