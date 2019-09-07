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
    <!--若页面需默认用极速核，增加标签：-->
    <meta name="renderer" content="webkit">

    <!--若页面需默认用ie兼容内核，增加标签：-->
<%--    <meta name="renderer" content="ie-comp">--%>

    <!--若页面需默认用ie标准内核，增加标签：-->
<%--    <meta name="renderer" content="ie-stand">--%>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link rel="stylesheet" href="resources/css/layui.css">
    <script type="text/javascript" src="resources/js/jquery.1.12.4.min.js"></script>
    <script type="text/javascript" src="resources/js/layui.js"></script>
</head>
<body>
    <form class="layui-form">
        <div class="layui-form-item" style="margin: 15px;height: 30px;">
            <div style="height: 40px;width: 70px;float: left;line-height: 3;">用户名：</div>
            <input type="text" class="layui-input" style="width: 250px;float: left;" id="keyword" name="keyword" value="" lay-verify="" placeholder="请输入用户名" autocomplete="off">
            <div class="layui-input-inline" style="width: 150px;text-align: center">
                <a class="layui-btn" id="search" name="search">
                    <i class="layui-icon">&#xe615</i>搜索
                </a>
            </div>
            <div style="float:right;width:110px;height:35px;">
                <div class="layui-input-inline" style="width: 100px;">
                    <a class="layui-btn layui-btn-normal" id="delete" name="delete">
                        <i class="layui-icon">&#x1006;</i>批量删除
                    </a>
                </div>
            </div>
        </div>
    </form>
    <div>
        <table id="users" lay-filter="users"></table>
    </div>
    <!-- 模态框 -->
    <div id="formData" style="width: 700px;display: none;padding-top: 15px;">
        <form id="userForm" class="layui-form">
            <input type="hidden" id="user_id" name="user_id">
            <div class="layui-form-item">
                <label class="layui-form-label">用户名</label>
                <div class="layui-input-block">
                    <input type="text" id="user_name" name="user_name" required lay-verify="required" value="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">电话</label>
                <div class="layui-input-block">
                    <input type="text" id="user_phone" name="user_phone" required lay-verify="required"
                           placeholder="请输入电话号码" value="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">邮箱</label>
                <div class="layui-input-block">
                    <input type="text" id="user_email" name="user_email" required lay-verify="required"
                           placeholder="请输入邮箱" value="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">用户头像</label>
                <img src="" alt="" id="user_img" style="width: 160px;height: 110px;">
                <button type="button" class="layui-btn layui-btn-warm" id="uploadUserImg">
                    <i class="layui-icon">&#xe67c;</i>上传图片
                </button>
                <div id="newImg" style="display: inline-block;"></div>
            </div>
        </form>
    </div>

    <script type="text/html" id="bar">
        <a class="layui-btn layui-btn-xs layui-btn-normal" title="编辑" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-xs" title="删除" lay-event="delete">删除</a>
    </script>
    <script type="text/javascript">
        var table;
        var layer;
        var form;
        var upload;
        layui.use(['layer','table','form','upload'],function () {
            table = layui.table;
            layer = layui.layer;
            form = layui.form;
            upload = layui.upload;
            //渲染table
            var tableIns = table.render({
               elem: "#users",
               id: "users",
               url: "user/findAllUser",
               width: 1140,
               cols: [[
                   {checkbox: true, LAY_CHECKED: false},
                   {field: 'user_id', title: '用户编号', width: 100, align: 'center'},
                   {field: 'user_name', title: '用户名', width: 120, align: 'center'},
                   {field: 'user_phone', title: '用户电话', width: 150, align: 'center'},
                   {field: 'user_email', title: '用户邮箱', width: 250, align: 'center'},
                   {field: 'user_img', title: '用户头像', width: 190, align: 'center', templet: function (d) {
                       if (d.user_img == '1') {
                           var div = "<img style='width: 80px;height: 50px;' src='upload/headpic.jpg'>";
                       } else {
                           var div = "<img style='width: 80px;height: 50px;' src='upload/" + d.user_img + "'>";
                       }
                       return div;
                   }},
                   {field: 'user_state', title: '用户状态', width: 112, align: 'center', templet: function (d) {
                        if(d.user_state == 1){
                            return "<input type='checkbox' lay-filter='switchTest' name='"+d.user_id+"' lay-skin='switch' lay-text='禁用|正常'>";
                        }else {
                            return "<input type='checkbox' lay-filter='switchTest' name='"+d.user_id+"' lay-skin='switch' lay-text='禁用|正常' checked>";
                        }
                   }},
                   {title: '操作', fixed: 'right', width: 161, align: 'center', toolbar: '#bar'}
               ]],
               page: true, //开启分页
               limits: [5,10,15],
               limit: 10, //默认 10
               done: function (res,curr,count) {
                   $("#curPageIndex").val(curr);
               }
            });
            //批量删除
            $("#delete").click(function () {
               var checkStatus = table.checkStatus('users'); //获取选中行
               var count = checkStatus.data.length; //选中行数
               if(count > 0){
                   parent.layer.confirm('确定要删除吗？',{icon:3},function (index) {
                       var data = checkStatus.data; //获取选中行的数据
                       var batch_id = '';
                       for(var i = 0; i < data.length; i++){
                           batch_id += data[i].user_id + ",";
                       }
                       $.ajax({
                          type: "post",
                          url: "user/batchDelete",
                          data: {batch_id: batch_id},
                          success: function (result) {
                              if(result == "success"){
                                  parent.layer.msg('删除成功！',{icon:1,shade:0.4,time:1000});
                                  $("#search").click();//重载table数据
                              }else {
                                  parent.layer.msg('删除失败，请重试！',{icon:5,shade:0.4,time:1000})
                              }
                              parent.layer.close(index);
                          }
                       });
                   });
               }else {
                   parent.layer.msg('请至少选择一条数据',{icon:5,shade:0.4,time:1000});
               }
            });
            //搜索
            $("#search").click(function () {
                var keyword = $("#keyword").val();
                tableIns.reload({
                   where: {keyword: keyword},
                   page: {curr: 1} //从第一页开始
                });
            });
            //用户状态
            form.on('switch(switchTest)',function (data) {
                var id = data.elem.name;
                var checked = data.elem.checked;
                if(checked){
                    $.ajax({
                       type: "post",
                       url: "user/changeUserState",
                       data: {state:0, user_id:id},
                       success: function (result) {
                           if(result == "success"){
                               layer.msg('禁用用户成功！',{icon:1,time:2000});
                           }else {
                               layer.msg('禁用用户失败，请重试！',{icon:5,time:2000});
                           }
                       }
                    });
                }else {
                    $.ajax({
                        type: "post",
                        url: "user/changeUserState",
                        data: {state:1, user_id:id},
                        success: function (result) {
                            if(result == "success"){
                                layer.msg('解禁用户成功！',{icon:1,time:2000});
                            }else {
                                layer.msg('解禁用户失败，请重试！',{icon:5,time:2000});
                            }
                        }
                    });
                }
            });
            table.on('tool(users)',function (obj) {
                //tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
                var data = obj.data; //获取当前行的数据
                var layEvent = obj.event;//获取lay-event的值
                var tr = obj.tr; //获取当前行tr的DOM对象
                if(layEvent == 'edit'){
                    layer.open({
                        type: 1,
                        title: '编辑用户信息',
                        shade: 0.4,
                        fix: false,
                        shadeClose: true,
                        maxmin: false,
                        area: ['800px','400px'],
                        content: $('#formData'),
                        success: function (layero, index) {
                            var body = layer.getChildFrame('body',index);
                            $("#user_id").val(data.user_id);
                            $("#user_name").val(data.user_name);
                            if(data.user_img == '1'){
                                $("#user_img").attr("src","upload/headpic.jpg");
                            }else {
                                $("#user_img").attr("src","upload/"+data.user_img);
                            }
                            $("#user_phone").val(data.user_phone);
                            $("#user_email").val(data.user_email);
                            form.render();
                            body.find("#hidValue").val(index); //将本层的窗口索引传给子页面层的hidValue中
                        },
                        btn: ['修改','取消'],
                        yes: function (index, layero) {
                            $.post('user/updateUser',$('#userForm').serialize(),function (data) {
                                if(data == "success"){
                                    parent.layer.msg('修改用户信息成功！',{icon:1,shade:0.4,time:2000});
                                    $("#search").click();//重载table数据
                                }else {
                                    parent.layer.msg('修改用户信息失败，请重试！',{icon:5,shade:0.4,time:2000});
                                }
                                layer.close(index);
                                $("#newImg").html("");
                            });
                        }
                    });
                }else if(layEvent == 'delete'){
                    layer.confirm('确认删除该用户？',{btn:['确认','取消'],btn1: function(index, layero) {
                        $.ajax({
                            type: "post",
                            url: "user/deleteUser",
                            data: {user_id: data.user_id},
                            success: function (result) {
                                if (result == "success") {
                                    parent.layer.msg('删除成功！', {icon: 1, shade: 0.4, time: 1000});
                                } else {
                                    parent.layer.msg('删除失败，请重试！', {icon: 5, shade: 0.4, time: 1000});
                                }
                            }
                        });
                        $(tr).remove();
                        layer.close(index);
                    }
                    });
                }
            });
            var uploadIns = upload.render({
               elem: "#uploadUserImg",
               url: "user/upload",
               data: "json",
               done: function (result) {
                   layer.msg('图片上传成功！',{icon:1,time:2000});
                   $("#newImg").html("<img style='width:160px;height: 110px;' src='upload/"+result.user_img+"'/><input type='hidden' name='user_img' value='"+result.user_img+"'>");
               },
               error: function () {
                   layer.msg('图片上传失败，请重试！',{icon:5,time:2000});
               }
            });
        })
    </script>
</body>
</html>
