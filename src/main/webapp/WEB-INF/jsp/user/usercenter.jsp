<%--
  Created by IntelliJ IDEA.
  User: Wxj
  Date: 2019/8/20
  Time: 4:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE HTML>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>用户中心</title>
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/css/style.css" rel="stylesheet">
    <link href="resources/css/layui.css" rel="stylesheet">
    <script src="resources/js/jquery.min.js" type="text/javascript"></script>
    <script src="resources/js/layui.js" type="text/javascript"></script>
    <script src="resources/js/ajaxfileupload.js" type="text/javascript"></script>
    <script src="resources/js/bootstrap.min.js" type="text/javascript"></script>
    <style type="text/css">
        a {
            text-decoration: none;
            color: #333;
            outline: none;
        }

        .layui-form-label {
            width: 100px;
        }
    </style>
</head>
<body>
<!-- 导航栏 -->
<jsp:include page="include/header.jsp"/>
<!-- 中间 -->
<div class="container-fluid">
    <div class="row">
        <!-- 控制栏 -->
        <div class="col-sm-3 col-md-2 sidebar sidebar-1">
            <ul class="nav nav-sidebar">
                <li class="list-group-tiem-diy"><a href="view/usercenter/#section1">收藏中心<span
                        class="sr-only">(current)</span></a></li>
                <li class="list-group-tiem-diy"><a href="view/usercenter/#section2">我的订单</a></li>
                <li class="list-group-tiem-diy"><a href="view/usercenter/#section3">地址管理</a></li>
                <li class="list-group-tiem-diy"><a href="view/usercenter/#section4">账户安全</a></li>
            </ul>
        </div>
        <!-- 内容 -->
        <div class="col-sm-9 com-sm-offset-3 col-md-10 col-md-offset-2 main">
            <!-- 收藏中心 -->
            <div class="col-md-12">
                <hr>
                <h1><a name="section1">收藏中心</a></h1>
                <hr>
                <div class="col-lg-12 col-md-12 col-sm-12" id="productArea"></div>
                <br>
            </div>
            <!-- 我的订单 -->
            <div class="col-md-12">
                <h1><a name="section2">我的订单</a></h1>
                <hr>
                <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
                    <ul class="layui-tab-title">
                        <li class="layui-this">待付款</li>
                        <li>待发货</li>
                        <li>待收货</li>
                        <li>待评价</li>
                        <li>完成</li>
                    </ul>
                    <div class="layui-tab-content" style="height: auto;">
                        <div class="layui-tab-item layui-show" id="state1">
                            <div class="layui-colla-item">
                                <h2 class="layui-colla-title">订单编号：bbc64359a33de2c198859431&nbsp;&nbsp;总价：17995元&nbsp;订单日期：2019/8/20
                                    4:40</h2>
                                <div class="layui-colla-content">
                                    <h4>收货人：Wxj&nbsp;&nbsp;收货地址：电子科技大学中山学院&nbsp;&nbsp;电话：1587677622&nbsp;&nbsp;快递编号：29762385626362</h4>
                                    <div class="layui-form">
                                        <table class="layui-table">
                                            <thead>
                                            <tr>
                                                <th>商品名称</th>
                                                <th>价格</th>
                                                <th>数量</th>
                                                <th>小计</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td><a href="goods/detail?goodsId=1">iPhone X</a></td>
                                                <td>7199元</td>
                                                <td>2台</td>
                                                <td>14198元</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <a href="javascript:void(0)"
                                       class="layui-btn layui-btn-normal layui-btn-fluid layui-btn-radius">去付款</a>
                                </div>
                            </div>
                        </div>
                        <div class="layui-tab-item" id="state2"></div>
                        <div class="layui-tab-item" id="state3"></div>
                        <div class="layui-tab-item" id="state4"></div>
                        <div class="layui-tab-item" id="state5"></div>
                    </div>
                </div>
            </div>
            <!-- 地址管理 -->
            <div class="col-md-12">
                <hr>
                <h1><a name="section3">地址管理</a></h1>
                <hr>
                <div class="col-sm-offset-2 col-md-offset-2" style="margin-left: 0;">
                    <div id="addrList">
                        <table class="layui-table">
                            <colgroup>
                                <col width="100">
                                <col width="150">
                                <col width="300">
                                <col width="300">
                                <col>
                            </colgroup>
                            <thead>
                            <tr>
                                <th>收货人</th>
                                <th>联系电话</th>
                                <th>所在地区</th>
                                <th>详细地址</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>wxj</td>
                                <td>1583765721</td>
                                <td>广东省中山市石岐区</td>
                                <td>电子科技大学中山学院</td>
                                <td>
                                    <button class="layui-btn layui-btn-xs layui-btn-warm">编辑</button>
                                    <button class="layui-btn layui-btn-xs layui-btn-danger">删除</button>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <button class="layui-btn layui-btn-normal layui-btn-lg layui-btn-fluid layui-btn-radius"
                            onclick="addAddress()">添加地址
                    </button>
                </div>
            </div>
            <!-- 账户安全 -->
            <div class="col-md-12">
                <h1><a name="section4">账户安全</a></h1>
                <hr>
                <table class="table table-hover center" id="acountArea">
                    <div class="layui-card" style="margin-left: -20px;">
                        <div class="layui-card-header">修改密码</div>
                        <div class="layui-card-body">
                            <div class="layui-form">
                                <div class="layui-form-item">
                                    <label class="layui-form-label">当前密码</label>
                                    <div class="layui-input-inline">
                                        <input type="password" id="oldPass" name="oldPass" lay-verify="required"
                                               lay-vertype="tips" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">新密码</label>
                                    <div class="layui-input-inline">
                                        <input type="password" id="newPass" name="newPass" lay-verify="required"
                                               lay-vertype="tips" autocomplete="off" class="layui-input">
                                    </div>
                                    <div class="layui-form-mid layui-word-aux">6到16个字符</div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">确认密码</label>
                                    <div class="layui-input-inline">
                                        <input type="password" id="rePass" name="rePass" lay-verify="required"
                                               lay-vertype="tips" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <div class="layui-input-block">
                                        <button class="layui-btn" lay-submit="" lay-filter="savePass">确认修改</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </table>
            </div>

        </div>
    </div>
</div>
<!-- 尾部 -->
<jsp:include page="include/foot.jsp"/>
<!-- 地址模态框 -->
<div class="layui-form" id="addrForm" style="display: none;padding-top: 10px;">
    <form id="addrFormData">
        <input type="hidden" name="addr_id" id="addr_id">
        <div class="layui-form-item">
            <label class="layui-form-label">收货人名称</label>
            <div class="layui-input-inline">
                <input type="text" name="addr_nickname" id="addr_nickname" required lay-verify="required"
                       placeholder="请输入收货人名称" value="" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">收货人电话</label>
            <div class="layui-input-inline">
                <input type="text" name="addr_phone" id="addr_phone" required lay-verify="required|phone"
                       placeholder="请输入收货人电话" value="" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">请选择地区</label>
            <div class="layui-input-inline">
                <select name="addr_province" id="proData" lay-filter="province" required lay-verify="required"></select>
            </div>
            <div class="layui-input-inline">
                <select name="addr_city" id="cityData" lay-filter="city" required lay-verify="required">
                    <option value="">请选择市</option>
                </select>
            </div>
            <div class="layui-input-inline">
                <select name="addr_area" id="areaData" lay-filter="area" required lay-verify="required">
                    <option value="">请选择县/区</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">详细地址</label>
            <div class="layui-input-inline">
                <input style="width:590px;" type="text" name="addr_detail" id="addr_detail" placeholder="请输入详细地址"
                       required lay-verify="required" value="" class="layui-input"/>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">邮政编码</label>
            <div class="layui-input-inline">
                <input type="text" name="addr_zipcode" id="addr_zipcode" placeholder="请输入邮政编码" required
                       lay-verify="required|zipcode" value="" class="layui-input"/>
            </div>
        </div>
        <button style="display:none;" type="reset" id="resetBtn">重置</button>
    </form>
</div>
<!-- 评论模态框 -->
<div id="evaData" style="width: 600px;padding-top: 15px;display: none;">
    <form id="evaForm">
        <input type="hidden" id="eva_order" name="eva_order"/>
        <div class="layui-form-item">
            <label class="layui-form-label" style="padding-top: 15px;">评分</label>
            <div class="layui-input-inline">
                <input type="hidden" name="eva_level" id="eva_star" required lay-verify="required">
                <div id="eva_level"></div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">评论图</label>
            <div class="layui-input-block">
                <button type="button" class="layui-btn" id="test1">多图片上传</button>
                <button type="button" class="layui-btn" id="test2">开始上传</button>
                <button type="button" class="layui-btn layui-danger" onclick="cleanImgsPreview()" id="cleanImgs">清空预览
                </button>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">预览图</label>
            <div class="layui-upload-list" id="preview"></div>
        </div>
        <input type="text" id="imgUrls" name="imgUrls" style="display: none;" class="layui-input">
        <div class="layui-form-item">
            <label class="layui-form-label">评价内容</label>
            <div class="layui-input-inline">
                <textarea rows="8" cols="50" required lay-verify="required" name="eva_content"></textarea>
            </div>
        </div>
        <button type="reset" style="display:none;" id="evaReset">重置</button>
    </form>
</div>

<script type="text/javascript">
    var layer;
    var element;
    var form;
    var rate;
    var upload;
    var success = 0;
    var fail = 0;
    var imgUrls = "";
    layui.use(['layer', 'element', 'form', 'rate', 'upload'], function () {
        layer = layui.layer;
        element = layui.element;
        form = layui.form;
        rate = layui.rate;
        upload = layui.upload;
        form.render();
        element.render();
        form.verify({
            //value：表单的值、item：表单的DOM对象
            pass: function (value, item) {
                if (!/^[\S]{6,12}$/.test(value)) {
                    return '密码必须6到12位，且不能出现空格';
                }
            },
            repass: function (value, item) {
                var newPass = $("#newPass").val();
                if (newPass != value) {
                    return '两次密码输入不一致';
                }
            },
            zipcode: function (value, item) {
                if(!/^\d{6}$/.test(value)){
                    return '邮政编码必须为6位数字';
                }
            }
        });
        upload.render({
            elem: '#test1',
            url: 'evaluate/uploadEvaImg',
            multiple: true, //多文件上传
            number: 5,
            size: 10240, //最大10M
            auto: false, //取消自动上传
            bindAction: '#test2',//触发按钮
            before: function (obj) {
                //预览文件，不支持ie8
                obj.preview(function (index, file, result) {
                    $("#preview").append('<img style="width:70px;height:70px;" src="' + result + '" alt="' + file.name + '" class="layui-upload-img">')
                });
            },
            done: function (res, index, upload) {
                //回调，统计上传成功和失败的图片数，将上传成功图片的名字存储起来，作为数据提交
                if (res.code > 0) {
                    fail++;
                } else {
                    success++;
                    imgUrls = imgUrls + "" + res.src + ",";
                }
                $("#imgUrls").val(imgUrls);
            },
            allDone: function (obj) {
                layer.msg("总共要上传图片总数为：" + (fail + success) + "\n"
                    + "其中上传成功图片数为：" + success + "\n"
                    + "其中上传失败图片数为：" + fail);
            }
        });
        var ins1 = rate.render({
            elem: '#eva_level',
            theme: '#FF5722',
            choose: function (value) {
                $("#eva_star").val(value);
            }
        });
        form.on('submit(savePass)', function (data) {
            if (data.field.newPass !== data.field.rePass) {
                layer.msg('密码不一致！', {icon: 5, time: 2000});
            } else {
                $.ajax({
                    type: "post",
                    url: "user/modifyUserPass",
                    data: {
                        oldPass: data.field.oldPass,
                        newPass: data.field.newPass
                    },
                    success: function (data) {
                        if (data == "success") {
                            layer.alert('修改密码成功！请重新登陆！', {icon: 1}, function (index) {
                                window.location.href = "view/login";
                                layer.close(index);
                            });
                        } else {
                            layer.msg('原密码错误！', {icon: 5, time: 2000});
                        }
                    }
                });
            }
        });
        form.on('select(province)', function (data) {
            $.ajax({
                type: "post",
                url: "proCityArea/findCityByProId",
                data: {province_id: data.value},
                dataType: "json",
                success: function (data) {
                    var div = "<option value=''>请选择市</option>";
                    for (var i = 0; i < data.length; i++) {
                        div = div + "<option value='" + data[i].city_id + "'>" + data[i].city_name + "</option>";
                    }
                    $("#cityData").html(div);
                    $("#areaData").html("<option value=''>请选择县/区</option>");
                    form.render();
                }
            });
        });
        form.on('select(city)', function (data) {
            $.ajax({
                type: "post",
                url: "proCityArea/findAreaByCityId",
                data: {city_id: data.value},
                dataType: "json",
                success: function (data) {
                    var div = "<option value=''>请选择县/区</option>";
                    for (var i = 0; i < data.length; i++) {
                        div = div + "<option value='" + data[i].area_id + "'>" + data[i].area_name + "</option>";
                    }
                    $("#areaData").html(div);
                    form.render();
                }
            });
        });
    });
    $(function () {
        showGuess();
        showAddress();
        showProvince();
        showReadyToPayOrder();
        showReadyToDeliverOrder();
        showReadyToReceiveOrder();
        showReadyToEvaluateOrder();
        showFinishOrder();
    })

    function cleanImgsPreview() {
        success = 0;
        fail = 0;
        $("#preview").html("");
        $("#imgUrls").val("");
    }

    function showGuess() {
        $.ajax({
            type: "post",
            url: "guess/findGuessByUser",
            dataType: "json",
            success: function (data) {
                var div = "<div style='padding-left: 16px;' class='span16'><ul>";
                for (var i = 0; i < data.length; i++) {
                    if ((i + 1) % 4 != 0) {
                        div = div +
                            "<li><a href='goods/detail?goodsId=" + data[i].guess_goods.goods_id + "'>" +
                            "<img style='margin-bottom: 2px;margin-top: 10px;' src='upload/" + data[i].guess_goods.goods_img + "'/>" +
                            "<p class='goods-title'>" + data[i].guess_goods.goods_name + "</p>" +
                            "<p class='goods-desc'>" + data[i].guess_goods.goods_desc + "</p>" +
                            "</a>" +
                            "<p><span class='newprice'>" + data[i].guess_goods.goods_price + "元</span></p>";
                        if(data[i].guess_goods.goods_num == 0){
                            div = div + "<button type='button' class='layui-btn layui-btn-sm layui-btn-disabled' disabled='disabled'>备货中...</button>";
                        }else{
                            div = div +  "<button type='button' class='layui-btn layui-btn-sm' onclick='addToCart(" + data[i].guess_goods.goods_id + ")'>加入购物车</button>";
                        }
                        div = div +
                            "<button type='button' class='layui-btn layui-btn-sm' onclick='removeGuess(" + data[i].guess_goods.goods_id + ")'>取消收藏</button>" +
                            "</li>";
                    } else {
                        div = div +
                            "<li class='brick4'><a href='goods/detail?goodsId=" + data[i].guess_goods.goods_id + "'>" +
                            "<img style='margin-bottom: 2px;margin-top: 10px;' src='upload/" + data[i].guess_goods.goods_img + "'/>" +
                            "<p class='goods-title'>" + data[i].guess_goods.goods_name + "</p>" +
                            "<p class='goods-desc'>" + data[i].guess_goods.goods_desc + "</p>" +
                            "</a>" +
                            "<p><span class='newprice'>" + data[i].guess_goods.goods_price + "元</span></p>";
                        if(data[i].guess_goods.goods_num == 0){
                            div = div + "<button type='button' class='layui-btn layui-btn-sm layui-btn-disabled' disabled='disabled'>备货中...</button>";
                        }else{
                            div = div +  "<button type='button' class='layui-btn layui-btn-sm' onclick='addToCart(" + data[i].guess_goods.goods_id + ")'>加入购物车</button>";
                        }
                        div = div +
                            "<button type='button' class='layui-btn layui-btn-sm' onclick='removeGuess(" + data[i].guess_goods.goods_id + ")'>取消收藏</button>" +
                            "</li>";
                    }
                }
                var div = div + "</ul></div>";
                $("#productArea").html(div);
            }
        });
    }

    function addToCart(id) {
        $.ajax({
            type: "post",
            url: "cart/addCart",
            data: {
                num: 1,
                goods_id: id
            },
            success: function (data) {
                if (data == "success") {
                    layer.msg('添加成功!', {icon: 1, time: 2000});
                } else {
                    layer.msg('添加失败!', {icon: 5, time: 2000});
                }
            }
        });
    }

    function removeGuess(id) {
        $.ajax({
            type: "post",
            url: "guess/removeGuess",
            data: {goods_id: id},
            success: function (data) {
                if (data === "success") {
                    layer.msg('取消收藏成功！', {icon: 1, time: 2000});
                } else {
                    layer.msg('取消收藏失败！', {icon: 5, time: 2000});
                }
                showGuess();
            }
        });
    }

    function showAddress() {
        $.ajax({
            type: "post",
            url: "address/findAddressByUserId",
            dataType: "json",
            success: function (data) {
                var div = "";
                if (data != null && data != "") {
                    //100 150 300 300
                    div = "<table class='layui-table'>" +
                        "<colgroup><col width='100'><col width='150'><col width='300'><col width='300'><col></colgroup>" +
                        "<thead><tr>" +
                        "<th>收货人</th><th>联系电话</th><th>所在地区</th><th>详细地址</th><th>操作</th>" +
                        "</tr></thead>" +
                        "<tbody>";
                    for (var i = 0; i < data.length; i++) {
                        div = div + "<tr><td>" + data[i].addr_nickname + "</td>" +
                            "<td>" + data[i].addr_phone + "</td>" +
                            "<td>" + data[i].addr_province + data[i].addr_city + data[i].addr_area + "</td>" +
                            "<td>" + data[i].addr_detail + "</td>" +
                            "<td>" +
                            "<button type='button' class='layui-btn layui-btn-xs layui-btn-warm' onclick='modifyAddress(" + data[i].addr_id + ")'>编辑</button>" +
                            "<button type='button' class='layui-btn layui-btn-xs layui-btn-danger' onclick='deleteAddress(" + data[i].addr_id + ")'>删除</button>" +
                            "</td>" +
                            "</tr>";
                    }
                    div = div + "</tbody></table>";
                } else {
                    div = "<h3>暂无收货地址！</h3>";
                }
                $("#addrList").html(div);
            }
        });
    }

    function addAddress() {
        layer.open({
            type: 1,//页面层
            title: '添加地址',
            shade: 0.4, //阴影
            fix: false,
            shadeClose: true,
            maxmin: false,
            area: ['800px', '500px'],
            content: $('#addrForm'),
            btn: ['添加', '取消'], //success: layero在前  其他回调函数 index在前
            success: function (layero, index) {
                layero.addClass('layui-form');//添加form标识  地址模态框
                layero.find('.layui-layer-btn0').attr('lay-filter', 'formContent').attr('lay-submit', ''); //设置按钮为submit按钮
                $("#resetBtn").click();
                form.render();
            },
            yes: function (index, layero) {
                form.on('submit(formContent)', function (data) {
                    $.post("address/addAddress", $('#addrFormData').serialize(), function (data) {
                        if (data == "success") {
                            parent.layer.msg('添加地址成功！', {icon: 1, shade: 0.4, time: 1000});
                        } else {
                            parent.layer.msg('添加地址失败！', {icon: 5, shade: 0.5, time: 1000});
                        }
                        layer.close(index);
                        showAddress();
                        $("#resetBtn").click();
                    });
                });
            }
        });
    }

    function modifyAddress(id) {
        $.ajax({
            type: "post",
            url: "address/findAddressById",
            data: {addr_id: id},
            dataType: "json",
            success: function (data) {
                layer.open({
                    type: 1,//页面层
                    title: '修改地址',
                    shade: 0.4, //阴影
                    fix: false,
                    shadeClose: true,
                    maxmin: false,
                    area: ['800px', '500px'],
                    content: $('#addrForm'),
                    btn: ['修改', '取消'],
                    success: function (layero, index) {
                        $("#addr_id").val(data.addr_id);
                        $("#addr_nickname").val(data.addr_nickname);
                        $("#addr_phone").val(data.addr_phone);
                        $("#proData").val(data.addr_province);
                        reloadCity(data.addr_province, data.addr_city);
                        reloadArea(data.addr_city, data.addr_area);
                        $("#addr_detail").val(data.addr_detail);
                        $("#addr_zipcode").val(data.addr_zipcode);
                        layero.addClass('layui-form');//添加form标识  地址模态框
                        layero.find('.layui-layer-btn0').attr('lay-filter', 'formContent').attr('lay-submit', ''); //设置按钮为submit按钮
                        form.render();
                    },
                    yes: function (index, layero) {
                        form.on('submit(formContent)', function (data) {
                            $.post("address/modifyAddress", $("#addrFormData").serialize(), function (data) {
                                if (data == "success") {
                                    parent.layer.msg('修改成功！', {icon: 1, shade: 0.4, time: 1000});
                                } else {
                                    parent.layer.msg('修改失败！', {icon: 5, shade: 0.5, time: 1000});
                                }
                                layer.close(index);
                                showAddress();
                                $("#resetBtn").click();
                            });
                        });
                    }
                });
            }
        });
    }

    function deleteAddress(id) {
        layer.confirm('确定要删除该地址吗？', function () {
            $.ajax({
                type: "post",
                url: "address/deleteAddress",
                data: {addr_id: id},
                success: function (data) {
                    if (data == "success") {
                        layer.msg('删除成功！', {icon: 1, time: 2000});
                    } else {
                        layer.msg('删除失败！', {icon: 5, time: 2000});
                    }
                    showAddress();
                }
            });
        });
    }

    function showProvince() {
        $.ajax({
            type: "post",
            url: "proCityArea/findAllPro",
            dataType: "json",
            success: function (data) {
                var div = "<option value=''>请选择省</option>";
                for (var i = 0; i < data.length; i++) {
                    div = div + "<option value='" + data[i].province_id + "'>" + data[i].province_name + "</option>";
                }
                $("#proData").html(div);
                //form.render();
            }
        });
    }

    function reloadCity(id, city_id) {
        $.ajax({
            type: "post",
            url: "proCityArea/findCityByProId",
            data: {province_id: id},
            dataType: "json",
            success: function (data) {
                var div = "<option value=''>请选择市</option>";
                for (var i = 0; i < data.length; i++) {
                    div = div + "<option value='" + data[i].city_id + "'>" + data[i].city_name + "</option>";
                }
                $("#cityData").html(div);
                $("#cityData").val(city_id);
                form.render();
            }
        });
    }

    function reloadArea(id, area_id) {
        $.ajax({
            type: "post",
            url: "proCityArea/findAreaByCityId",
            data: {city_id: id},
            dataType: "json",
            success: function (data) {
                var div = "<option value=''>请选择县/区</option>";
                for (var i = 0; i < data.length; i++) {
                    div = div + "<option value='" + data[i].area_id + "'>" + data[i].area_name + "</option>";
                }
                $("#areaData").html(div);
                $("#areaData").val(area_id);
                form.render();
            }
        });
    }

    function showReadyToPayOrder() {
        $.ajax({
            type: "post",
            url: "order/findOrderByUserAndState",
            data: {state: 1},
            dataType: "json",
            success: function (data) {
                var div = "";
                if(data == null || data == ""){
                    div = div + "<div style='width:100%;height:180px;'><div style='text-align:center;padding-top:20px;'>" +
                        "<img src='upload/cart.png'><p><h3 style='padding-bottom: 15px;'>您还没有相关的订单~</h3><a href='view/index' class='btn-lg btn-danger' style='text-decoration: none;'>去逛逛</a></p>" +
                        "</div></div>"
                }else {
                    div = div + "<div class='layui-collapse' lay-accordion=''>";
                    for(var i = 0; i < data.length; i++){
                        var date = new Date(data[i].order_date).toLocaleString();
                        div = div +
                                "<div class='layui-colla-item'>" +
                                    "<h2 class='layui-colla-title'>订单编号："+ data[i].order_id +
                                    "&nbsp;&nbsp;总价："+ data[i].order_price +
                                    "元&nbsp;&nbsp;订单日期：" + date +
                                    "</h2>" +
                                    "<div class='layui-colla-content'>" +
                                        "<h4>收货人："+ data[i].order_username +
                                        "&nbsp;&nbsp;收货地址："+ data[i].order_address +
                                        "&nbsp;&nbsp;联系电话："+ data[i].order_phone +
                                        "</h4>" +
                                        "<div class='layui-form'>" +
                                            "<table class='layui-table'>" +
                                                "<thead>" +
                                                    "<tr>" +
                                                        "<th>商品名称</th>" +
                                                        "<th>价格</th>" +
                                                        "<th>数量</th>" +
                                                        "<th>小计</th>" +
                                                    "</tr>" +
                                                "</thead>" +
                                                "<tbody>";
                        var list = data[i].detailList;
                        for(var j = 0; j < list.length; j++){
                            div = div +
                                    "<tr>" +
                                        "<td><a href='goods/detail?goodsId="+list[j].detail_goods.goods_id+"'>"+ list[j].detail_goods.goods_name+"</a></td>" +
                                        "<td>"+ list[j].detail_goods.goods_price +"</td>" +
                                        "<td>"+ list[j].detail_num +"台</td>" +
                                        "<td>"+ list[j].detail_price * list[j].detail_num +"元</td>" +
                                    "</tr>";
                        }
                        div = div + "</tbody></table></div>" +
                                "<button class='layui-btn layui-btn-normal layui-btn-fluid layui-btn-radius' onclick='payfor(\""+data[i].order_id+"\")'>去付款</button>" +
                                "</div></div>";
                    }
                    div = div + "</div>";
                }
                $("#state1").html(div);
                element.render();
            }
        });
    }

    function payfor(id) {
        layer.confirm("确定支付？", function () {
            $.ajax({
                type: "post",
                url: "order/payForOrder",
                data: {"orderId": id},
                success: function (data) {
                    if (data == "success") {
                        layer.msg('支付成功！', {icon: 1, time: 2000});
                    } else {
                        layer.msg('支付失败！', {icon: 5, time: 2000});
                    }
                    showReadyToPayOrder();
                    showReadyToDeliverOrder();
                }
            });
        });
    }

    function showReadyToDeliverOrder() {
        $.ajax({
            type: "post",
            url: "order/findOrderByUserAndState",
            data: {state: 2},
            dataType: "json",
            success: function (data) {
                var div = "";
                if(data == null || data == ""){
                    div = div + "<div style='width:100%;height:180px;'><div style='text-align:center;padding-top:20px;'>" +
                        "<img src='upload/cart.png'><p><h3 style='padding-bottom: 15px;'>您还没有相关的订单~</h3><a href='view/index' class='btn-lg btn-danger' style='text-decoration: none;'>去逛逛</a></p>" +
                        "</div></div>"
                }else {
                    div = div + "<div class='layui-collapse' lay-accordion=''>";
                    for(var i = 0; i < data.length; i++){
                        var date = new Date(data[i].order_date).toLocaleString();
                        div = div +
                            "<div class='layui-colla-item'>" +
                            "<h2 class='layui-colla-title'>订单编号："+ data[i].order_id +
                            "&nbsp;&nbsp;总价："+ data[i].order_price +
                            "元&nbsp;&nbsp;订单日期：" + date +
                            "</h2>" +
                            "<div class='layui-colla-content'>" +
                            "<h4>收货人："+ data[i].order_username +
                            "&nbsp;&nbsp;收货地址："+ data[i].order_address +
                            "&nbsp;&nbsp;联系电话："+ data[i].order_phone +
                            "</h4>" +
                            "<div class='layui-form'>" +
                            "<table class='layui-table'>" +
                            "<thead>" +
                            "<tr>" +
                            "<th>商品名称</th>" +
                            "<th>价格</th>" +
                            "<th>数量</th>" +
                            "<th>小计</th>" +
                            "</tr>" +
                            "</thead>" +
                            "<tbody>";
                        var list = data[i].detailList;
                        for(var j = 0; j < list.length; j++){
                            div = div +
                                "<tr>" +
                                "<td><a href='goods/detail?goodsId="+list[j].detail_goods.goods_id+"'>"+ list[j].detail_goods.goods_name+"</a></td>" +
                                "<td>"+ list[j].detail_goods.goods_price +"</td>" +
                                "<td>"+ list[j].detail_num +"台</td>" +
                                "<td>"+ list[j].detail_price * list[j].detail_num +"元</td>" +
                                "</tr>";
                        }
                        div = div + "</tbody></table></div>" +
                            "</div></div>";
                    }
                    div = div + "</div>";
                }
                $("#state2").html(div);
                element.render();
            }
        });
    }
    
    function showReadyToReceiveOrder() {
        $.ajax({
            type: "post",
            url: "order/findOrderByUserAndState",
            data: {state: 3},
            dataType: "json",
            success: function (data) {
                var div = "";
                if(data == null || data == ""){
                    div = div + "<div style='width:100%;height:180px;'><div style='text-align:center;padding-top:20px;'>" +
                        "<img src='upload/cart.png'><p><h3 style='padding-bottom: 15px;'>您还没有相关的订单~</h3><a href='view/index' class='btn-lg btn-danger' style='text-decoration: none;'>去逛逛</a></p>" +
                        "</div></div>"
                }else {
                    div = div + "<div class='layui-collapse' lay-accordion=''>";
                    for(var i = 0; i < data.length; i++){
                        var date = new Date(data[i].order_date).toLocaleString();
                        div = div +
                            "<div class='layui-colla-item'>" +
                            "<h2 class='layui-colla-title'>订单编号："+ data[i].order_id +
                            "&nbsp;&nbsp;总价："+ data[i].order_price +
                            "元&nbsp;&nbsp;订单日期：" + date +
                            "</h2>" +
                            "<div class='layui-colla-content'>" +
                            "<h4>收货人："+ data[i].order_username +
                            "&nbsp;&nbsp;&nbsp;&nbsp;收货地址："+ data[i].order_address +
                            "<br><br>联系电话："+ data[i].order_phone +
                            "&nbsp;&nbsp;&nbsp;&nbsp;快递单号："+ data[i].order_expressno +
                            "</h4>" +
                            "<div class='layui-form'>" +
                            "<table class='layui-table'>" +
                            "<thead>" +
                            "<tr>" +
                            "<th>商品名称</th>" +
                            "<th>价格</th>" +
                            "<th>数量</th>" +
                            "<th>小计</th>" +
                            "</tr>" +
                            "</thead>" +
                            "<tbody>";
                        var list = data[i].detailList;
                        for(var j = 0; j < list.length; j++){
                            div = div +
                                "<tr>" +
                                "<td><a href='goods/detail?goodsId="+list[j].detail_goods.goods_id+"'>"+ list[j].detail_goods.goods_name+"</a></td>" +
                                "<td>"+ list[j].detail_goods.goods_price +"</td>" +
                                "<td>"+ list[j].detail_num +"台</td>" +
                                "<td>"+ list[j].detail_price * list[j].detail_num +"元</td>" +
                                "</tr>";
                        }
                        div = div + "</tbody></table></div>" +
                            "<button class='layui-btn layui-btn-normal layui-btn-fluid layui-btn-radius' onclick='confirmReceive(\""+data[i].order_id+"\")'>确认收货</button>" +
                            "</div></div>";
                    }
                    div = div + "</div>";
                }
                $("#state3").html(div);
                element.render();
            }
        });
    }

    function confirmReceive(id) {
        layer.confirm("确认收货吗？",function () {
            $.ajax({
               type: "post",
               url: "order/receiveOrder",
               data: {order_id: id},
               success: function (data) {
                  if(data == "success"){
                      layer.msg('确认收货成功！',{icon:1,time:2000});
                  } else {
                      layer.msg('确认收货失败，请重试！',{icon:5,time:2000});
                  }
                  showReadyToReceiveOrder();
                  showReadyToEvaluateOrder();
               }
            });
        });
    }

    function showReadyToEvaluateOrder() {
        $.ajax({
            type: "post",
            url: "order/findOrderByUserAndState",
            data: {state: 4},
            dataType: "json",
            success: function (data) {
                var div = "";
                if(data == null || data == ""){
                    div = div + "<div style='width:100%;height:180px;'><div style='text-align:center;padding-top:20px;'>" +
                        "<img src='upload/cart.png'><p><h3 style='padding-bottom: 15px;'>您还没有相关的订单~</h3><a href='view/index' class='btn-lg btn-danger' style='text-decoration: none;'>去逛逛</a></p>" +
                        "</div></div>"
                }else {
                    div = div + "<div class='layui-collapse' lay-accordion=''>";
                    for(var i = 0; i < data.length; i++){
                        var date = new Date(data[i].order_date).toLocaleString();
                        div = div +
                            "<div class='layui-colla-item'>" +
                            "<h2 class='layui-colla-title'>订单编号："+ data[i].order_id +
                            "&nbsp;&nbsp;总价："+ data[i].order_price +
                            "元&nbsp;&nbsp;订单日期：" + date +
                            "</h2>" +
                            "<div class='layui-colla-content'>" +
                            "<h4>收货人："+ data[i].order_username +
                            "&nbsp;&nbsp;&nbsp;&nbsp;收货地址："+ data[i].order_address +
                            "<br><br>联系电话："+ data[i].order_phone +
                            "&nbsp;&nbsp;&nbsp;&nbsp;快递单号："+ data[i].order_expressno +
                            "</h4>" +
                            "<div class='layui-form'>" +
                            "<table class='layui-table'>" +
                            "<thead>" +
                            "<tr>" +
                            "<th>商品名称</th>" +
                            "<th>价格</th>" +
                            "<th>数量</th>" +
                            "<th>小计</th>" +
                            "</tr>" +
                            "</thead>" +
                            "<tbody>";
                        var list = data[i].detailList;
                        for(var j = 0; j < list.length; j++){
                            div = div +
                                "<tr>" +
                                "<td><a href='goods/detail?goodsId="+list[j].detail_goods.goods_id+"'>"+ list[j].detail_goods.goods_name+"</a></td>" +
                                "<td>"+ list[j].detail_goods.goods_price +"</td>" +
                                "<td>"+ list[j].detail_num +"台</td>" +
                                "<td>"+ list[j].detail_price * list[j].detail_num +"元</td>" +
                                "</tr>";
                        }
                        div = div + "</tbody></table></div>" +
                            "<button class='layui-btn layui-btn-normal layui-btn-fluid layui-btn-radius' onclick='evaluateOrder(\""+data[i].order_id+"\")'>发表评价</button>" +
                            "</div></div>";
                    }
                    div = div + "</div>";
                }
                $("#state4").html(div);
                element.render();
            }
        });
    }

    function evaluateOrder(id) {
        layer.open({
            type: 1,//页面层
            title: '发表评价',
            shade: 0.4, //阴影
            fix: false,
            shadeClose: true,
            maxmin: false,
            area: ['700px', '500px'],
            content: $('#evaData'),
            btn: ['发布', '取消'],
            success: function (layero, index) {
                layero.addClass('layui-form');//添加form标识  地址模态框
                layero.find('.layui-layer-btn0').attr('lay-filter', 'formContent').attr('lay-submit', ''); //设置按钮为submit按钮
                $("#eva_order").val(id);
                form.render();
            },
            yes: function (index, layero) {
                form.on('submit(formContent)', function (data) {
                    $.post("evaluate/addEvaluate", $('#evaForm').serialize(), function (data) {
                        if (data == "success") {
                            parent.layer.msg('发表评价成功！', {icon: 1, shade: 0.4, time: 1000});
                        } else {
                            parent.layer.msg('发表评价失败，请重试！', {icon: 5, shade: 0.5, time: 1000});
                        }
                        layer.close(index);
                        $("#evaReset").click();
                        cleanImgsPreview();
                        showReadyToEvaluateOrder();
                        showFinishOrder();
                    });
                });
            }
        });
    }

    function showFinishOrder() {
        $.ajax({
            type: "post",
            url: "order/findOrderByUserAndState",
            data: {state: 5},
            dataType: "json",
            success: function (data) {
                var div = "";
                if(data == null || data == ""){
                    div = div + "<div style='width:100%;height:180px;'><div style='text-align:center;padding-top:20px;'>" +
                    "<img src='upload/cart.png'><p><h3 style='padding-bottom: 15px;'>您还没有相关的订单~</h3><a href='view/index' class='btn-lg btn-danger' style='text-decoration: none;'>去逛逛</a></p>" +
                    "</div></div>"
                    //div = div + "<h2>暂无相关订单信息</h2>";
                }else {
                    div = div + "<div class='layui-collapse' lay-accordion=''>";
                    for(var i = 0; i < data.length; i++){
                        var date = new Date(data[i].order_date).toLocaleString();
                        div = div +
                            "<div class='layui-colla-item'>" +
                            "<h2 class='layui-colla-title'>订单编号："+ data[i].order_id +
                            "&nbsp;&nbsp;总价："+ data[i].order_price +
                            "元&nbsp;&nbsp;订单日期：" + date +
                            "</h2>" +
                            "<div class='layui-colla-content'>" +
                            "<h4>收货人："+ data[i].order_username +
                            "&nbsp;&nbsp;&nbsp;&nbsp;收货地址："+ data[i].order_address +
                            "<br><br>联系电话："+ data[i].order_phone +
                            "&nbsp;&nbsp;&nbsp;&nbsp;快递单号："+ data[i].order_expressno +
                            "</h4>" +
                            "<div class='layui-form'>" +
                            "<table class='layui-table'>" +
                            "<thead>" +
                            "<tr>" +
                            "<th>商品名称</th>" +
                            "<th>价格</th>" +
                            "<th>数量</th>" +
                            "<th>小计</th>" +
                            "</tr>" +
                            "</thead>" +
                            "<tbody>";
                        var list = data[i].detailList;
                        for(var j = 0; j < list.length; j++){
                            div = div +
                                "<tr>" +
                                "<td><a href='goods/detail?goodsId="+list[j].detail_goods.goods_id+"'>"+ list[j].detail_goods.goods_name+"</a></td>" +
                                "<td>"+ list[j].detail_goods.goods_price +"</td>" +
                                "<td>"+ list[j].detail_num +"台</td>" +
                                "<td>"+ list[j].detail_price * list[j].detail_num +"元</td>" +
                                "</tr>";
                        }
                        div = div + "</tbody></table></div>" +
                            "<button class='layui-btn layui-btn-normal layui-btn-fluid layui-btn-radius' onclick='deleteOrder(\""+data[i].order_id+"\")'>删除订单</button>" +
                            "</div></div>";
                    }
                    div = div + "</div>";
                }
                $("#state5").html(div);
                element.render();
            }
        });
    }

    function deleteOrder(id) {
        layer.confirm("确认删除该订单吗？",function () {
            $.ajax({
                type: "post",
                url: "order/deleteOrder",
                data: {order_id: id},
                success: function(data) {
                    if(data == "success"){
                        layer.msg('删除订单成功！',{icon:1,time:1000});
                    }else {
                        layer.msg('删除订单失败，请重试！',{icon:5,time:1000});
                    }
                    showFinishOrder();
                }
            });
        });
    }
</script>

</body>
</html>
