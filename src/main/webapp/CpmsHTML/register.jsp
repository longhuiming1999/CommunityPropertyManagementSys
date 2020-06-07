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
    <title>小区物业管理系统注册界面</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <meta name="viewport" content="width=device-width">
    <link rel="stylesheet" href="<%=basePath %>css/templatemo_main.css">
</head>
<body>
<div id="main-wrapper">
    <div class="navbar navbar-inverse" role="navigation">
        <div class="navbar-header">
            <div class="logo"><h1>XX小区物业管理系统</h1></div>
        </div>
    </div>
    <div class="template-page-wrapper">
        <form class="form-horizontal templatemo-signin-form" role="form"
              action="<%=webPath %>/User/register" method="post" onsubmit="return register()">
            <div class="form-group">
                <div class="col-md-12">
                    <label for="username" class="col-sm-2 control-label">用户名</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="username" name="account" onchange="confirmName()">
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-12">
                    <label class="col-sm-2 control-label"></label>
                    <div class="col-sm-10">
                        <span id="userSpanId">长度6-15,英文开头,不能含有特殊字符</span>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-12">
                    <label for="password" class="col-sm-2 control-label">密码</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="password" name="pwd" onchange="confirmPwd1()">
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-12">
                    <label class="col-sm-2 control-label"></label>
                    <div class="col-sm-10">
                        <span id="userPwdId">长度6-10,由英文字母下划线组成,不能含有特殊字符</span>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-12">
                    <label for="password" class="col-sm-2 control-label">确认密码</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="cfmpassword" name="cfmPwd"
                               onchange="confirmPwd2()">
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-12">
                    <label class="col-sm-2 control-label"></label>
                    <div class="col-sm-10">
                        <span id="userCfmPwdId">再次输入密码</span>
                    </div>
                </div>
            </div>


            <div class="form-group">
                <div class="col-md-12">
                    <label for="password" class="col-sm-2 control-label">手机号码</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="phone" name="phone" onchange="confirmPhone()">
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-12">
                    <label class="col-sm-2 control-label"></label>
                    <div class="col-sm-10">
                        <span id="userPhoneId">11位手机号码</span>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-12">
                    <label for="password" class="col-sm-2 control-label">Email</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="email" name="email" onchange="confirmEmail()">
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-12">
                    <label class="col-sm-2 control-label"></label>
                    <div class="col-sm-10">
                        <span id="userEmailId">正确的邮箱格式</span>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-12">
                    <div class="col-sm-offset-2 col-sm-10">
                        <input type="submit" value="注册" class="btn btn-default">
                        <input type="button" class="btn btn-default" value="去登录"
                               onclick="location.href='<%=webPath%>/CpmsHTML/sign-in.jsp'">
                        <span>${msg}</span>
                    </div>
                </div>
            </div>
        </form>


    </div>
</div>
<script src="/CpmsHTML/js/login.js"></script>
</body>
</html>