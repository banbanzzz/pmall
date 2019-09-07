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
    <meta name="renderer" content="webkit">
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
        <div style="height: 40px;width: 100px;float: left;line-height: 3;">商品名称：</div>
        <input type="text" class="layui-input" style="width: 250px;float: left;" id="keyword" name="keyword" value="" lay-verify="" placeholder="请输入商品名称" autocomplete="off">
        <div class="layui-input-inline" style="width: 150px;text-align: center">
            <a class="layui-btn" id="search" name="search">
                <i class="layui-icon">&#xe615;</i>搜索
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
    <table id="goods" lay-filter="goods"></table>
</div>
<div id="editForm" style="display:none;width:800px;padding-top:10px;">
    <form id="formData" class="layui-form">
        <input type="hidden" name="goods_id" id="goods_id" >
        <div class="layui-form-item">
            <label class="layui-form-label">商品名称</label>
            <div class="layui-input-block">
                <input type="text" name="goods_name" id="goods_name" required lay-verify="required" placeholder="请输入商品名称" value="" class="layui-input" />
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品价格</label>
            <div class="layui-input-block">
                <input type="text" name="goods_price" id="goods_price" required lay-verify="required" placeholder="请输入商品价格" value="" class="layui-input" />
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品库存</label>
            <div class="layui-input-block">
                <input type="text" name="goods_num" id="goods_num" required lay-verify="required" placeholder="请输入商品库存" value="" class="layui-input" />
            </div>
        </div>
        <div class="layui-form-item" lay-filter="test">
            <label class="layui-form-label">商品分类</label>
            <div class="layui-input-inline">
                <select name="goods_type.type_id" id="goods_type" required lay-verify="required" lay-filter="goods.goods_type.type_id">
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">内存大小</label>
            <div class="layui-input-inline">
                <select name="goods_memory.memory_id" id="goods_memory" required lay-verify="required" lay-filter="goods.goods_memory.memory_id">
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品颜色</label>
            <div class="layui-input-block">
                <input type="text" name="goods_color" id="goods_color" required lay-verify="required"  value="" class="layui-input" />
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品图片</label>
            <img style="width:260px;height:180px;" src="" id="goods_img">
            <button type="button" class="layui-btn layui-btn-warm" id="uploadGoodsImg">
                <i class="layui-icon">&#xe67c;</i>上传图片
            </button>
            <div style="display:inline-block;" id="newImg"></div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品描述</label>
            <div class="layui-input-block">
                <textarea name="goods_desc" id="goods_desc"  required lay-verify="required" class="layui-textarea"></textarea>
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
    var upload;
    layui.use(['layer','table','form','upload'],function () {
        table = layui.table;
        layer = layui.layer;
        form = layui.form;
        upload = layui.upload;
        //渲染商品类型选择框 goods_type
        $.ajax({
           type: "post",
           url: "goodsType/findAll",
           success: function (data) {
               var div = "";
               for(var i = 0; i < data.length; i++){
                   div = div + "<option value='"+data[i].type_id+"'>"+data[i].type_name+"</option>";
               }
               $("#goods_type").html(div);
               form.render();
           }
        });
        //渲染商品内存选择框 goods_memory
        $.ajax({
           type: "post",
           url: "memory/findAll",
           success: function (data) {
               var div = "";
               for(var i = 0; i < data.length; i++){
                   div = div + "<option value='"+data[i].memory_id+"'>"+data[i].memory_name+"</option>";
               }
               $("#goods_memory").html(div);
               form.render();
           }
        });
        //渲染table
        var tableIns = table.render({
            elem: "#goods",
            id: "goods",
            url: "goods/findGoodsBySplitPage",
            width: 1140,
            cols: [[
                {checkbox: true, LAY_CHECKED: false},
                {field: 'goods_id', title: '编号', width: 80, align: 'center'},
                {field: 'goods_name', title: '商品名称', width: 140, align: 'center'},
                {field: 'goods_price', title: '价格', width: 80, sort:true, align: 'center'},
                {field: 'goods_num', title: '库存', width: 80, sort:true, align: 'center', templet: function (d) {
                        if(d.goods_num == 0){
                            return '<p style="color: #ff0003">缺货</p>';
                        }else {
                            return d.goods_num;
                        }
                    }},
                {field: 'goods_color', title: '颜色', width: 80, align: 'center'},
                {field: 'goods_type', title: '分类', width: 100, align: 'center', templet: function (d) {
                        return d.goods_type.type_name;
                    }},
                {field: 'goods_memory', title: '内存', width: 120, align: 'center', templet: function (d) {
                        return d.goods_memory.memory_name;
                    }},
                {field: 'goods_img', title: '商品图片', width: 120, align: 'center', templet: function (d) {
                        return "<img src='upload/"+d.goods_img+"'>";
                    }},
                {field: 'goods_desc', title: '商品描述', width: 120, align: 'center'},
                // {field: 'goods_volume', title: '商品销量', width: 80, align: 'center'},
                {title: '操作', fixed: 'right', width: 160, align: 'center', toolbar: '#bar'}
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
            var checkStatus = table.checkStatus('goods'); //获取选中行
            var count = checkStatus.data.length; //选中行数
            if(count > 0){
                parent.layer.confirm('确定要删除吗？',{icon:3},function (index) {
                    var data = checkStatus.data; //获取选中行的数据
                    var batch_id = '';
                    for(var i = 0; i < data.length; i++){
                        batch_id += data[i].goods_id + ",";
                    }
                    $.ajax({
                        type: "post",
                        url: "goods/batchDelete",
                        data: {batch: batch_id},
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
        table.on('tool(goods)',function (obj) {
            //tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获取当前行的数据
            var layEvent = obj.event;//获取lay-event的值
            var tr = obj.tr; //获取当前行tr的DOM对象
            if(layEvent == 'edit'){
                layer.open({
                    type: 1,
                    title: '编辑商品信息',
                    shade: 0.4,
                    fix: false,
                    shadeClose: true,
                    maxmin: false,
                    area: ['900px','550px'],
                    content: $('#editForm'),
                    success: function (layero, index) {
                        console.log(data);
                        var body = layer.getChildFrame('body',index);
                        $("#goods_id").val(data.goods_id);
                        $("#goods_name").val(data.goods_name);
                        $("#goods_price").val(data.goods_price);
                        $("#goods_num").val(data.goods_num);
                        $("#goods_color").val(data.goods_color);
                        $("#goods_type").siblings("div.layui-form-select").find('dl').find('dd[lay-value='+data.goods_type.type_id+']').click();
                        $("#goods_memory").siblings("div.layui-form-select").find('dl').find('dd[lay-value='+data.goods_memory.memory_id+']').click();
                        $("#goods_img").attr("src","upload/"+data.goods_img+"");
                        $("#goods_desc").val(data.goods_desc);
                        form.render();
                        body.find("#hidValue").val(index); //将本层的窗口索引传给子页面层的hidValue中
                    },
                    btn: ['修改','取消'],
                    yes: function (index, layero) {
                        $.post('goods/updateGoods',$('#formData').serialize(),function (data) {
                            if(data == "success"){
                                parent.layer.msg('修改商品成功！',{icon:1,shade:0.4,time:1000});
                                $("#search").click();//重载table数据
                            }else {
                                parent.layer.msg('修改失败，请重试！',{icon:5,shade:0.4,time:1000});
                            }
                            $("#newImg").html("");
                            layer.close(index);
                        });
                    }
                });
            }else if(layEvent == 'delete'){
                layer.confirm('确认删除该商品？',{btn:['确认','取消'],btn1: function(index, layero) {
                        $.ajax({
                            type: "post",
                            url: "goods/deleteGoods",
                            data: {goods_id: data.goods_id},
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
            elem: "#uploadGoodsImg",
            url: "goods/uploadGoodsImg",
            data: "json",
            done: function (result) {
                layer.msg('图片上传成功！',{icon:1,time:2000});
                $("#newImg").html("<img style='width:280px;height: 160px;' src='upload/"+result.goods_img+"'/><input type='hidden' name='goods_img' value='"+result.goods_img+"'>");
            },
            error: function () {
                layer.msg('图片上传失败，请重试！',{icon:5,time:2000});
            }
        });
    })
</script>
</body>
</html>
