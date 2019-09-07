<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link rel="stylesheet" href="resources/css/layui.css">
    <script src="resources/js/jquery.1.12.4.min.js"></script>
    <script type="text/javascript" src="resources/js/layui.js"></script>
</head>
<body>
    <div class="layui-card">
        <div class="layui-card-header">修改密码</div>
        <div class="layui-card-body">
            <form action="" id="passForm">
                <div class="layui-form">
                    <div class="layui-form-item">
                        <label class="layui-form-label">当前密码</label>
                        <div class="layui-input-inline">
                            <input type="password" name="oldPass" lay-verify="required|oldPass"
                             id="oldPass" lay-vertype="tips" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">新密码</label>
                        <div class="layui-input-inline">
                            <input type="password" name="newPass" lay-verify="required|newPass"
                             id="newPass" lay-vertype="tips" class="layui-input" autocomplete="off">
                        </div>
                        <div class="layui-form-mid layui-word-aux">6到16个字符</div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">确认密码</label>
                        <div class="layui-input-inline">
                            <input type="password" name="rePass" lay-verify="required|rePass"
                             id="rePass" lay-vertype="tips" class="layui-input" autocomplete="off">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button type="button" class="layui-btn" lay-submit="" lay-filter="update">确认修改</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <script type="text/javascript">
        layui.use(['layer','form'],function () {
            var layer = layui.layer;
            var form = layui.form;
            form.verify({
               newPass: function (value) {
                   if(!/^[a-z0-9_-]{6,16}$/.test(value)){
                       return "密码格式不正确！";
                   }
               },
               rePass: function (value) {
                   var pass = $("#newPass").val();
                   if(pass != value){
                       return "两次密码不一致!";
                   }
               } 
            });
            form.on('submit(update)',function () {
               $.post("admin/updatePass",$("#passForm").serialize(),function (data) {
                   if(data == "success"){
                       layer.msg('修改密码成功，请重新登录！',{icon:1,anim:4,time:2000},function () {
                           top.location.href = "admin/logout"; //在顶层frame中打开新页
                       });
                   }else {
                       layer.msg('旧密码错误！',{icon:5,anim:6,time:2000});
                   }
               });
            });
        })
    </script>
</body>
</html>
