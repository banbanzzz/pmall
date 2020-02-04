<%--
  Created by IntelliJ IDEA.
  User: Wxj
  Date: 2019/8/14
  Time: 18:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
    pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>用户登录</title>
    <link href="resources/css/style.css" rel="stylesheet" type="text/css">
    <link href="resources/css/layui.css" rel="stylesheet" type="text/css">
    <link href="resources/css/login.css" rel="stylesheet" type="text/css">
    <link href="resources/css/admin.css" rel="stylesheet" type="text/css">
    <link href="resources/css/pro.css" rel="stylesheet" type="text/css">
    <script src="resources/js/layui.js" type="text/javascript"></script>
    <script src="resources/js/jquery.min.js" type="text/javascript"></script>
</head>
<body>
    <!-- 导航栏 -->
    <jsp:include page="user/include/header.jsp"/>
    <!-- 中间 -->
    <div class="container-fluid">
        <form id="loginForm">
            <div class="layadmin-user-login layadmin-user-display-show"
                 style="padding-bottom:0px;padding-top:50px;height:250px;"
                 id="LAY-user-login">
                <div class="layadmin-user-login-main" style="height:200px;">
                    <div class="layadmin-user-login-box layadmin-user-login-header">
                        <h2>用户登陆</h2>
                    </div>
                    <div class="layadmin-user-login-box layadmin-user-login-body layui-form" style="height:100px;">
                        <div class="layui-form-item">
                            <label class="layadmin-user-login-icon layui-icon layui-icon-username"
                                   for="LAY-user-login-username">
                            </label>
                            <input type="text" name="user_name" id="user_name" lay-verify="required" placeholder="用户名"
                                   class="layui-input layui-form-danger">
                        </div>
                        <div class="layui-form-item">
                            <label class="layadmin-user-login-icon layui-icon layui-icon-password"
                                   for="LAY-user-login-password">
                            </label>
                            <input type="password" name="user_pass" id="user_pass" lay-verify="required" placeholder="密码"
                                   class="layui-input">
                        </div>
                        <div class="layui-form-item" style="height:50px;">
                            <input type="checkbox" name="remember" lay-skin="primary"
                                   title="记住密码">
                            <div class="layui-unselect layui-form-checkbox" lay-skin="primary">
                                <span>记住密码</span><i class="layui-icon layui-icon-ok"></i>
                            </div>
                            <a lay-href="javascript:void(0)"
                               class="layadmin-user-jump-change layadmin-link"
                               style="margin-top: 7px;">忘记密码？</a>
                        </div>
                        <div class="layui-form-item">
                            <button class="layui-btn layui-btn-fluid" type="button" lay-submit=""
                                    lay-filter="loginSubmit">登 入
                            </button>
                        </div>
                        <div class="layui-form-item layadmin-user-login-other" style="padding-bottom:1px;">
                            <label>社交账号登入</label> <a href="javascript:;"><i
                                class="layui-icon layui-icon-login-qq"></i></a> <a
                                href="javascript:;"><i
                                class="layui-icon layui-icon-login-wechat"></i></a> <a
                                href="javascript:;"><i
                                class="layui-icon layui-icon-login-weibo"></i></a> <a href="view/register"
                                class="layadmin-user-jump-change layadmin-link">注册帐号</a>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <!-- 尾部 -->
    <jsp:include page="user/include/foot.jsp"/>
    <script type="text/javascript">
        layui.use(['form','layer'], function(){
            var form = layui.form;
            var layer = layui.layer;
            form.on('submit(loginSubmit)', function () {
                $.ajax({
                    type: "post",
                    url: "user/login",
                    data: $('#loginForm').serialize(),
                    success: function (data) {
                        console.log(data);
                        if(data == "success"){
                            layer.msg("登录成功!",{icon:1,anim:2,time:2000},function() {
                                window.location.href = "view/index";
                            });
                        }else {
                            layer.msg("登录失败！请检查用户名或密码后重试！",{icon:5,anim:6,time:3000});
                        }
                    }
                });
            });
        })
    </script>
</body>
</html>
