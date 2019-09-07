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
    <title>添加轮播图</title>
    <link rel="stylesheet" href="resources/css/layui.css">
    <script src="resources/js/jquery.1.12.4.min.js"></script>
    <script type="text/javascript" src="resources/js/layui.js"></script>
</head>
<body>
    <div id="addForm" style="width: 700px;padding-top: 20px;">
        <form action="" id="formData" class="layui-form">
            <div class="layui-form-item">
                <label for="" class="layui-form-label">轮播图名称</label>
                <div class="layui-input-block">
                    <input type="text" name="banner_name" id="banner_name" required lay-verify="required"
                        placeholder="请输入轮播图名称" value="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="" class="layui-form-label">轮播图URL</label>
                <div class="layui-input-block">
                    <input type="text" name="banner_url" id="banner_url" required lay-verify="required"
                        placeholder="请输入轮播图URL" value="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="" class="layui-form-label">轮播图片</label>
                <div class="layui-input-block">
                    <button type="button" class="layui-btn layui-btn-normal" id="banner_img">
                        <i class="layui-icon">&#xe67c;</i>上传图片
                    </button>
                    <div id="newImg" style="display: inline-block"></div>
                </div>
            </div>
            <div class="layui-form-item" style="margin-left: 110px;">
                <button type="button" lay-submit lay-filter="add" class="layui-btn layui-btn-lg" style="margin-right: 50px;">添加</button>
                <button type="reset" class="layui-btn layui-btn-warm layui-btn-lg">重置</button>
            </div>
        </form>
    </div>

    <script type="text/javascript">
        layui.use(['layer','upload','form'], function () {
           var layer = layui.layer;
           var form = layui.form;
           var upload = layui.upload;
           form.on('submit(add)',function () {
               $.ajax({
                  type: "post",
                  url: "banner/addBanner",
                  data: $("#formData").serialize(),
                  success: function (data) {
                      if(data == "success"){
                          layer.msg('添加轮播图成功！',{icon:1,shade:0.4,anim:1,time:1000},function () {
                              window.location.href = "view/bannerlist";
                          });
                      }else {
                          layer.msg('添加轮播图失败，请重试！',{icon:5,shade:0.4,anim:6,time:1000});
                      }
                  }
               });
           });
           var uploadIns = upload.render({
              elem: "#banner_img",
              url: "banner/uploadBannerImg",
              done: function (res) {
                  layer.msg('图片上传成功！',{icon:1,time:1000});
                  $("#newImg").html("<img style='width: 280px;height: 160px;' src='upload/"+res.banner_img+"'/><input type='hidden' value='"+res.banner_img+"' name='banner_img'>")
              }
           });
        });
    </script>
</body>
</html>
