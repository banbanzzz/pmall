<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>用户注册</title>
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
    <!-- 中间内容 -->
	<div class="container-fluid">
            <form id="regForm">
                <div class="layadmin-user-login layadmin-user-display-show" style="padding-top:30px;padding-bottom:30px;"
                    id="LAY-user-login">
                    <div class="layadmin-user-login-main">
                        <div class="layadmin-user-login-box layadmin-user-login-header">
                            <h2>用户注册</h2>
                        </div>
                        <div class="layadmin-user-login-box layadmin-user-login-body layui-form">
                            <div class="layui-form-item">
                                <label
                                    class="layadmin-user-login-icon layui-icon layui-icon-username"
                                    for="user_name">
                                </label>
                                <input type="text" name="user_name" id="user_name" lay-verify="nickname"
                                    placeholder="昵称" class="layui-input">
                            </div>
                            <div class="layui-form-item">
                                <label
                                    class="layadmin-user-login-icon layui-icon layui-icon-password"
                                    for="user_pass">
                                </label>
                                <input type="password" name="user_pass" id="user_pass" lay-verify="pass"
                                    placeholder="密码" class="layui-input">
                            </div>
                            <div class="layui-form-item">
                                <label
                                    class="layadmin-user-login-icon layui-icon layui-icon-password"
                                    for="repass">
                                </label>
                                <input type="password"
                                    name="repass" id="repass" lay-verify="required"
                                    placeholder="确认密码" class="layui-input">
                            </div>
                            <div class="layui-form-item">
                                <label
                                    class="layadmin-user-login-icon layui-icon layui-icon-cellphone"
                                    for="user_phone"></label> <input type="text"
                                    name="user_phone" id="user_phone"
                                    lay-verify="phone" placeholder="手机" class="layui-input">
                            </div>
                            <div class="layui-form-item">
                                <label
                                    class="layadmin-user-login-icon layui-icon layui-icon-cellphone"
                                    for="user_email"></label> <input type="text"
                                    name="user_email" id="user_email"
                                    lay-verify="email" placeholder="邮箱" class="layui-input">
                            </div>
                            <div class="layui-form-item" style="height:50px;">
                                <input type="checkbox" name="agreement" lay-skin="primary"
                                    title="同意用户协议" checked="">
                                <div
                                    class="layui-unselect layui-form-checkbox layui-form-checked"
                                    lay-skin="primary">
                                    <span>同意用户协议</span><i class="layui-icon layui-icon-ok"></i>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <button class="layui-btn layui-btn-fluid" lay-submit="" type="button"
                                    lay-filter="regSubmit">注 册</button>
                            </div>
                            <div class="layui-trans layui-form-item layadmin-user-login-other">
                                <label>社交账号注册</label> <a href="javascript:;"><i
                                    class="layui-icon layui-icon-login-qq"></i></a> <a
                                    href="javascript:;"><i
                                    class="layui-icon layui-icon-login-wechat"></i></a> <a
                                    href="javascript:;"><i
                                    class="layui-icon layui-icon-login-weibo"></i></a> <a
                                    href="view/login"
                                    class="layadmin-user-jump-change layadmin-link layui-hide-xs">用已有帐号登入</a>
                                <a href="view/login"
                                    class="layadmin-user-jump-change layadmin-link layui-hide-sm layui-show-xs-inline-block">登入</a>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <!--尾部-->
        <jsp:include page="user/include/foot.jsp" />
        <script type="text/javascript">
            layui.use(['form', 'layer'], function () {
                var form = layui.form;
                var layer = layui.layer;
                form.on('submit(regSubmit)', function (data) {
                    if(data.field.user_pass != data.field.repass){
                        layer.msg("密码不一致！", {icon: 5, anim: 6, time: 2000});
                    }else if(data.field.agreement != "on") {
                        layer.msg("未同意用户协议！", {icon: 5, anim: 6, time: 2000});
                    }else {
                        $.post("user/register", $("#regForm").serialize(), function (data) {
                            if (data == "success") {
                                layer.msg("注册成功！即将转向登陆页面！", {icon: 1, anim: 4, time: 2000}, function () {
                                    window.location.href = "view/login";
                                });
                            } else {
                                layer.msg("注册失败！", {icon: 5, anim: 6, time: 2000});
                            }
                        });
                    }
                });
            });
        </script>
</body>
</html>