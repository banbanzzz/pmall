<%--
  Created by IntelliJ IDEA.
  User: Wxj
  Date: 2019/9/2
  Time: 11:14
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
        <div style="height: 40px;width: 100px;float: left;line-height: 3;">分类名称：</div>
        <input type="text" class="layui-input" style="width: 250px;float: left;" id="keyword" name="keyword" value="" lay-verify="" placeholder="请输入分类关键词" autocomplete="off">
        <div class="layui-input-inline" style="width: 150px;text-align: center">
            <a class="layui-btn" id="search" name="search">
                <i class="layui-icon">&#xe615</i>搜索
            </a>
        </div>
        <div style="float:left;width:380px;height:40px;">
            <div class="layui-input-inline" style="width: 100px;margin-right: 20px;">
                <a class="layui-btn layui-btn-normal" id="add" name="add">
                    <i class="layui-icon">&#xe654;</i>添加分类
                </a>
            </div>
            <div class="layui-input-inline" style="width: 100px;">
                <a class="layui-btn layui-btn-normal" id="delete" name="delete">
                    <i class="layui-icon">&#x1006;</i>批量删除
                </a>
            </div>
        </div>
    </div>
</form>
<div>
    <table id="type" lay-filter="type"></table>
</div>
<!-- 编辑模态框 -->
<div id="formData" style="width:300px;display:none;padding-top:15px;">
    <form class="layui-form" id="editForm">
        <input type="hidden" name="type_id" id="type_id" />
        <div class="layui-form-item">
            <label class="layui-form-label">分类名称</label>
            <div class="layui-input-block">
                <input type="text" name="type_name" id="type_name" required lay-verify="required" value="" class="layui-input" />
            </div>
        </div>
    </form>
</div>
<!-- 添加模态框 -->
<div id="addData" style="width:300px;display:none;padding-top:15px;">
    <form class="layui-form" id="addForm">
        <div class="layui-form-item">
            <label class="layui-form-label">分类名称</label>
            <div class="layui-input-block">
                <input type="text" name="type_name" required lay-verify="required" value="" class="layui-input" />
            </div>
        </div>
    </form>
</div>
<script type="text/html" id="bar">
    <a class="layui-btn layui-btn-xs layui-btn-normal" title="编辑" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-xs" title="刪除" lay-event="delete">刪除</a>
</script>
<script type="text/javascript">
    var table;
    var layer;
    var form;
    layui.use(['table','layer','form'],function () {
        table = layui.table;
        layer = layui.layer;
        form = layui.form;
        //渲染table
        var tableIns = table.render({
           elem: "#type",
           id: "type",
           url: "goodsType/findTypeBySplitPage",
           width:834,
           cols: [[
               {checkbox: true, LAY_CHECKED: false},
               {field: 'type_id', title: "类型编号", width:120, align: 'center'},
               {field: 'type_name', title: "类型名称", width:300, align: 'center'},
               {field: 'type_state', title: "状态", width:160, align: 'center', templet: function (d) {
                       if(d.type_state == 1){
                           return "<input type='checkbox' lay-filter='switchTest' name='"+d.type_id+"' lay-skin='switch' lay-text='禁用|正常'>";
                       }else {
                           return "<input type='checkbox' lay-filter='switchTest' name='"+d.type_id+"' lay-skin='switch' lay-text='禁用|正常' checked>";
                       }
                   }},
               {title: "操作", width:200, align: 'center', fixed: 'right', toolbar: '#bar'},
           ]] ,
           page: true,
           limits: [5,10,15],
           limit: 10,
           done: function (res, curr, count) {
               $("#curPageIndex").val(curr);
           }
        });
        //添加
        $("#add").click(function(){
            layer.open({
                type: 1,
                title: '增加商品分类信息',
                shade: 0.4,  //阴影度
                fix: false,
                shadeClose: true,
                maxmin: false,
                area: ['400px;', '200px;'],    //窗体大小（宽,高）
                content: $('#addData'),
                success: function (layero, index)
                {
                    var body = layer.getChildFrame('body', index); //得到子页面层的BODY
                    form.render();
                    body.find('#hidValue').val(index); //将本层的窗口索引传给子页面层的hidValue中
                },
                btn:['添加','取消'],
                yes: function(index, layero){
                    $.post('goodsType/addGoodsType',$('#addForm').serialize(),function(data){
                        if (data == 'success')
                        {
                            parent.layer.msg('添加分类信息成功！', { icon: 1, shade: 0.4, time: 1000 });
                            $("#search").click();
                        }
                        else
                        {
                            parent.layer.msg('添加分类信息失败！', { icon: 5, shade: 0.4, time: 1000 });
                        }
                        layer.close(index);
                    });
                }
            });
        });
        //批量删除
        $("#delete").click(function ()
        {
            var checkStatus = table.checkStatus('type');
            var count = checkStatus.data.length;//选中的行数
            if (count > 0)
            {
                parent.layer.confirm('确定要删除所选分类？', { icon: 3 }, function (index)
                {
                    var data = checkStatus.data; //获取选中行的数据
                    var batchId = '';
                    for (var i = 0; i < data.length; i++)
                    {
                        batchId += data[i].type_id + ",";
                    }
                    $.ajax({
                        url: 'goodsType/batchDelete',
                        type: "post",
                        data: { batch: batchId },
                        success: function (result){
                            if (result == "success"){
                                parent.layer.msg('删除成功', { icon: 1, shade: 0.4, time: 1000 })
                                $("#search").click();//重载TABLE数据
                            }else {
                                parent.layer.msg("删除失败", { icon: 5, shade: 0.4, time: 1000 });
                            }
                            parent.layer.close(index);
                        }
                    })
                });
            }
            else
                parent.layer.msg("请至少选择一条数据", { icon: 5, shade: 0.4, time: 1000 });
        });
        //搜索
        $("#search").click(function ()
        {
            var word=$("#keyword").val();
            tableIns.reload({
                where: {
                    keyword: word
                },page: {
                    curr: 1 //重新从第 1 页开始
                }
            });
        });
        //更改状态
        form.on('switch(switchTest)',function(data){
            var id = data.elem.name;
            var flag = data.elem.checked;
            if(flag){
                $.ajax({
                    type:"post",
                    url:"goodsType/changeTypeState",
                    data: {
                        state: 0,
                        type_id: id
                    },
                    success:function(data){
                        if(data == "success"){
                            layer.msg('禁用分类成功！',{icon:1,time:2000});
                        }else{
                            layer.msg('禁用分类失败！请重试！',{icon:5,time:2000});
                        }
                    }
                });
            }else{
                $.ajax({
                    type:"post",
                    url:"goodsType/changeTypeState",
                    data: {
                        state: 1,
                        type_id: id
                    },
                    success:function(data){
                        if(data == "success"){
                            layer.msg("启用分类成功！",{icon:1,time:2000});
                        }else{
                            layer.msg("启用分类失败！请重试！",{icon:5,time:2000});
                        }
                    }
                });
            }
        });
        //工具条事件监听
        table.on('tool(type)', function (obj)
        { //tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值
            var tr = obj.tr; //获得当前行 tr 的DOM对象
            if (layEvent === 'edit')
            { //编辑
                layer.open({
                    type: 1,
                    title: '编辑商品分类信息',
                    shade: 0.4,  //阴影度
                    fix: false,
                    shadeClose: true,
                    maxmin: false,
                    area: ['400px;', '200px;'],    //窗体大小（宽,高）
                    content: $('#formData'),
                    success: function (layero, index)
                    {
                        var body = layer.getChildFrame('body', index); //得到子页面层的BODY
                        $("#type_id").val(data.type_id);
                        $("#type_name").val(data.type_name);
                        form.render();
                        body.find('#hidValue').val(index); //将本层的窗口索引传给子页面层的hidValue中
                    },
                    btn:['修改','取消'],
                    yes: function(index, layero){
                        $.post('goodsType/updateGoodsType',$('#editForm').serialize(),function(data){
                            if (data == 'success')
                            {
                                parent.layer.msg('修改分类信息成功！', { icon: 1, shade: 0.4, time: 1000 });
                                $("#search").click();//重载table数据
                            }
                            else
                            {
                                parent.layer.msg('修改分类信息失败！', { icon: 5, shade: 0.4, time: 1000 });
                            }
                            layer.close(index);
                        });
                    }
                });
            }else if(layEvent === 'delete'){
                layer.confirm('是否删除该分类？', {
                    btn: ['确认', '取消']
                    ,btn1: function(index, layero){
                        $.ajax({
                            type: "POST",
                            url: "goodsType/deleteGoodsType",
                            data: {type_id: data.type_id},
                            success: function(result){
                                if(result == 'success'){
                                    parent.layer.msg('删除成功', { icon: 1, shade: 0.4, time: 1000 });
                                }else{
                                    parent.layer.msg('删除失败', { icon: 5, shade: 0.4, time: 1000 });
                                }
                            }
                        });
                        $(tr).remove();
                        layer.close(index);
                    }
                });
            }
        });
    });
</script>
</body>
</html>
