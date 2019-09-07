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
    <!-- 不缓存 -->
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
<div id="editForm" style="width: 700px; padding-top: 10px;">
    <form id="formData" class="layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label">商品名称</label>
            <div class="layui-input-block">
                <input type="text" name="goods_name" id="goods_name" required
                       lay-verify="required" placeholder="请输入商品名称" value=""
                       class="layui-input" />
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品价格</label>
            <div class="layui-input-block">
                <input type="text" name="goods_price" id="goods_price" required
                       lay-verify="required" placeholder="请输入商品价格" value=""
                       class="layui-input" />
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品库存</label>
            <div class="layui-input-block">
                <input type="text" name="goods_num" id="goods_num" required
                       lay-verify="required" placeholder="请输入商品库存" value=""
                       class="layui-input" />
            </div>
        </div>
        <div class="layui-form-item" lay-filter="test">
            <label class="layui-form-label">商品分类</label>
            <div class="layui-input-inline">
                <select name="goods_type.type_id" id="goods_type" required
                        lay-verify="required" lay-filter="goods.goods_type.type_id">
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">内存大小</label>
            <div class="layui-input-inline">
                <select name="goods_memory.memory_id" id="goods_memory" required
                        lay-verify="required" lay-filter="goods.goods_memory.memory_id">
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品颜色</label>
            <div class="layui-input-block">
                <input type="text" name="goods_color" id="goods_color" required
                       lay-verify="required" value="" class="layui-input" />
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品图片</label>
            <div class="layui-input-block">
                <button type="button" class="layui-btn layui-btn-normal" id="goods_img">
                    <i class="layui-icon">&#xe67c;</i>上传图片
                </button>
                <div style="display:inline-block" id="newImg"></div>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">商品描述</label>
            <div class="layui-input-block">
					<textarea name="goods_desc" id="goods_desc" required
                              lay-verify="required" class="layui-textarea"></textarea>
            </div>
        </div>
        <div class="layui-form-item" style="margin-left:110px;">
            <button type="button" lay-submit lay-filter="add" class="layui-btn layui-btn-lg" style="margin-right:50px;">添加</button>
            <button type="reset" class="layui-btn layui-btn-warm layui-btn-lg">重置</button>
        </div>
    </form>
</div>
<script type="text/javascript">
    layui.use(['layer','form','upload'],function () {
        var layer = layui.layer;
        var form = layui.form;
        var upload = layui.upload;
        //渲染商品类型选择框
        $.ajax({
            type: "post",
            url: "goodsType/findAll",
            success: function (data) {
                var div = "<option value=''>请选择分类</option>";
                for(var i = 0; i < data.length; i++){
                    div = div + "<option value='"+data[i].type_id+"'>"+data[i].type_name+"</option>";
                }
                $("#goods_type").html(div);
                form.render();
            }
        });
        //渲染内存选择框
        $.ajax({
           type: "post",
           url: "memory/findAll",
           success: function (data) {
               var div = "<option value=''>请选择内存大小</option>";
               for(var i = 0; i < data.length; i++){
                   div = div + "<option value='"+data[i].memory_id+"'>"+data[i].memory_name+"</option>";
               }
               $("#goods_memory").html(div);
               form.render();
           }
        });
        var uploadInst = upload.render({
           elem: '#goods_img',
           url: 'goods/uploadGoodsImg',
           done: function (res) {
               layer.msg('图片上传成功！',{icon:1,time:2000});
               $("#newImg").html("<img style='width: 280px;height: 160px;' src='upload/"+res.goods_img+"'/><input type='hidden' value='"+res.goods_img+"' name='goods_img'>")
           },
           error: function () {
               layer.msg('图片上传失败，请重试！',{icon:5,time:2000});
           }
        });
        form.on('submit(add)',function () {
            $.ajax({
               type: "post",
               url: "goods/addGoods",
               data: $("#formData").serialize(),
               success: function (data) {
                   if(data == "success"){
                       layer.msg('添加商品成功！',{icon:1,time:2000},function () {
                           window.location.href = "view/goodslist";
                       });
                   }else {
                       layer.msg('添加商品失败，请重试！',{icon:5,time:2000});
                   }
               } 
            });
        })
    })
</script>
</body>
</html>
