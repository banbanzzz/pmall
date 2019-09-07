<%--
  Created by IntelliJ IDEA.
  User: Wxj
  Date: 2019/9/2
  Time: 15:58
  To change this template use File | Settings | File Templates.
--%>
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
        <div class="layui-input-inline" style="width: 100px;margin-right: 20px;">
            <a class="layui-btn layui-btn-normal" id="add" name="add">
                <i class="layui-icon">&#xe654;</i>添加管理员
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
    <table id="admin" lay-filter="admin"></table>
</div>
<!-- 添加模态框 -->
<div id="addData" style="width:700px;display:none;padding-top:15px;">
    <form class="layui-form" id="addForm">
        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-block">
                <input type="text" name="admin_name" id="name" required lay-verify="required" value=""  placeholder="请输入姓名" class="layui-input" />
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-block">
                <input type="password" name="admin_pass" id="pass" lay-vertype="tips" lay-verify="required|pass" autocomplete="off" placeholder="请输入密码" class="layui-input" />
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">确认密码</label>
            <div class="layui-input-block">
                <input type="password" name="rePass" id="rePass" lay-vertype="tips" lay-verify="required|rePass" autocomplete="off" placeholder="请输入确认密码" class="layui-input" />
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">电话</label>
            <div class="layui-input-block">
                <input type="text" name="admin_phone" id="phone" lay-verify="required" value=""  placeholder="请输入手机号码" class="layui-input" />
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">职务</label>
            <div class="layui-input-inline">
                <select name="admin_role.role_id" id="role" required
                        lay-verify="required" lay-filter="admin.admin_role.role_id">
                </select>
            </div>
        </div>
    </form>
</div>
<!-- 编辑模态框 -->
<div id="formData" style="width: 700px;display: none;padding-top: 15px;">
    <form id="adminForm" class="layui-form">
        <input type="hidden" id="admin_id" name="admin_id">
        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-block">
                <input type="text" id="admin_name" name="admin_name" required lay-verify="required" value="" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">电话</label>
            <div class="layui-input-block">
                <input type="text" id="admin_phone" name="admin_phone" required lay-verify="required"
                       placeholder="请输入电话号码" value="" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">职务</label>
            <div class="layui-input-inline">
                <select name="admin_role.role_id" id="admin_role" required lay-verify="required" lay-filter="admin.admin_role.role_id">
                </select>
            </div>
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
    layui.use(['layer','table','form'],function () {
        table = layui.table;
        layer = layui.layer;
        form = layui.form;
        //渲染table
        var tableIns = table.render({
            elem: "#admin",
            id: "admin",
            url: "admin/findAll",
            width: 1140,
            cols: [[
                {checkbox: true, LAY_CHECKED: false},
                {field: 'admin_id', title: '编号', width: 100, align: 'center'},
                {field: 'admin_name', title: '姓名', width: 120, align: 'center'},
                {field: 'admin_phone', title: '手机号码', width: 150, align: 'center'},
                {field: 'admin_role', title: '职务', width: 120, align: 'center', templet: function (d) {
                        return d.admin_role.role_name;
                    }},
                {field: 'admin_state', title: '状态', width: 112, align: 'center', templet: function (d) {
                        if(d.admin_state == 1){
                            return "<input type='checkbox' lay-filter='switchTest' name='"+d.admin_id+"' lay-skin='switch' lay-text='禁用|正常'>";
                        }else {
                            return "<input type='checkbox' lay-filter='switchTest' name='"+d.admin_id+"' lay-skin='switch' lay-text='禁用|正常' checked>";
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
        //渲染职务选择框
        $.ajax({
            type: "post",
            url: "admin/findAllRole",
            dataType: "json",
            success: function (data) {
                var div = "";
                for(var i = 0; i < data.length; i++){
                    div = div + "<option value='"+data[i].role_id+"'>"+data[i].role_name+"</option>";
                }
                $("#admin_role").html(div);
                $("#role").html(div);
                form.render();
            }
        });
        //添加
        $("#add").click(function () {
            layer.open({
                type: 1,
                title: '增加管理员',
                shade: 0.4,  //阴影度
                fix: false,
                shadeClose: true,
                maxmin: false,
                area: ['760px;', '400px;'],    //窗体大小（宽,高）
                content: $('#addData'),
                success: function (layero, index)
                {
                    var body = layer.getChildFrame('body', index); //得到子页面层的BODY
                    form.render();
                    body.find('#hidValue').val(index); //将本层的窗口索引传给子页面层的hidValue中
                },
                btn:['添加','取消'],
                yes: function(index, layero){
                    var admin_pass = $("#pass").val();
                    var rePass = $("#rePass").val();
                    var phone = $("#phone").val();
                    var name = $("#name").val();
                    if(name == '' || admin_pass == '' || rePass == '' || phone == ''){
                        layer.msg("字段不能为空!",{icon:5,anim:6,time:1000});
                        return;
                    }else{
                        if(!/^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\d{8}$/.test(phone)){
                            layer.msg("手机号码格式错误!",{icon:5,anim:6,time:1000});
                            return;
                        }
                        if(!/^[a-z0-9_-]{6,16}$/.test(admin_pass)){
                            layer.msg("密码格式不正确!",{icon:5,anim:6,time:1000});
                            return;
                        }else{
                            if(admin_pass != rePass){
                                layer.msg("两次密码不一致!",{icon:5,anim:6,time:1000});
                                return;
                            }
                        }
                    }
                    $.post('admin/addAdmin',$('#addForm').serialize(),function(data){
                        if (data == 'success') {
                            parent.layer.msg('添加管理员成功！', { icon: 1, shade: 0.4, time: 1000 });
                            tableIns.reload();
                        }
                        else {
                            parent.layer.msg('添加管理员失败！', { icon: 5, shade: 0.4, time: 1000 });
                        }
                        layer.close(index);
                    });
                }
            });
        });
        //批量删除
        $("#delete").click(function () {
            var checkStatus = table.checkStatus('admin'); //获取选中行
            var count = checkStatus.data.length; //选中行数
            if(count > 0){
                parent.layer.confirm('确定要删除吗？',{icon:3},function (index) {
                    var data = checkStatus.data; //获取选中行的数据
                    var batch_id = '';
                    for(var i = 0; i < data.length; i++){
                        batch_id += data[i].admin_id + ",";
                    }
                    $.ajax({
                        type: "post",
                        url: "admin/batchDelete",
                        data: {batch: batch_id},
                        success: function (result) {
                            if(result == "success"){
                                parent.layer.msg('删除成功！',{icon:1,shade:0.4,time:1000});
                                tableIns.reload();
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
        //用户状态
        form.on('switch(switchTest)',function (data) {
            var id = data.elem.name;
            var checked = data.elem.checked;
            if(checked){
                $.ajax({
                    type: "post",
                    url: "admin/changeAdminState",
                    data: {state:0, admin_id:id},
                    success: function (result) {
                        if(result == "success"){
                            layer.msg('禁用用户成功！',{icon:1,time:1000});
                        }else {
                            layer.msg('禁用用户失败，请重试！',{icon:5,time:1000});
                        }
                    }
                });
            }else {
                $.ajax({
                    type: "post",
                    url: "admin/changeAdminState",
                    data: {state:1, admin_id:id},
                    success: function (result) {
                        if(result == "success"){
                            layer.msg('解禁用户成功！',{icon:1,time:1000});
                        }else {
                            layer.msg('解禁用户失败，请重试！',{icon:5,time:1000});
                        }
                    }
                });
            }
        });
        table.on('tool(admin)',function (obj) {
            //tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获取当前行的数据
            var layEvent = obj.event;//获取lay-event的值
            var tr = obj.tr; //获取当前行tr的DOM对象
            if(layEvent == 'edit'){
                layer.open({
                    type: 1,
                    title: '编辑管理员信息',
                    shade: 0.4,
                    fix: false,
                    shadeClose: true,
                    maxmin: false,
                    area: ['760px','400px'],
                    content: $('#formData'),
                    success: function (layero, index) {
                        var body = layer.getChildFrame('body',index);
                        $("#admin_id").val(data.admin_id);
                        $("#admin_name").val(data.admin_name);
                        $("#admin_phone").val(data.admin_phone);
                        $("#admin_role").siblings("div.layui-form-select").find('dl').find('dd[lay-value='+data.admin_role.role_id+']').click();
                        form.render();
                        body.find("#hidValue").val(index); //将本层的窗口索引传给子页面层的hidValue中
                    },
                    btn: ['修改','取消'],
                    yes: function (index, layero) {
                        $.post('admin/updateAdmin',$('#adminForm').serialize(),function (data) {
                            if(data == "success"){
                                parent.layer.msg('修改信息成功！',{icon:1,shade:0.4,time:1000});
                                tableIns.reload();
                            }else {
                                parent.layer.msg('修改信息失败，请重试！',{icon:5,shade:0.4,time:1000});
                            }
                            layer.close(index);
                        });
                    }
                });
            }else if(layEvent == 'delete'){
                layer.confirm('确认删除该用户？',{btn:['确认','取消'],btn1: function(index, layero) {
                        $.ajax({
                            type: "post",
                            url: "admin/deleteAdmin",
                            data: {admin_id: data.admin_id},
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
    })
</script>
</body>
</html>
