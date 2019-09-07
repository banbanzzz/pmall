<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePaht = request.getScheme() + "://" + request.getServerName() +":" + request.getServerPort()
            + path + "/";
%>
%>
<!DOCTYPE HTML>
<head>
    <base href="<%=basePaht%>">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>商品详情</title>
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/css/style.css" rel="stylesheet">
    <link href="resources/css/layui.css" rel="stylesheet">
    <script src="resources/js/jquery.min.js" type="text/javascript"></script>
    <script src="resources/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="resources/js/layui.js" type="text/javascript"></script>
    <style type="text/css">
        .dl-horizonal span{
            font-size: 16px;
            margin: 15px 15px;
        }
        .dl-horizonal .badge{
            background-color: #009688;
        }
        #btnFont button{
            font-size: 16px;
        }
        #img{
            /*float: center;*/
            padding-top: 35px;
        }
    </style>
</head>
<body style="background-color: white;">
    <!-- 导航栏 -->
    <jsp:include page="include/header.jsp"/>
    <!-- 主体 -->
    <div class="container">
        <!-- 商品名 -->
        <div class="row clearfix">
            <div class="col-md-12" style="padding-top: 25px;padding-bottom: 25px;">
                <input type="hidden" id="goods_id" value="${requestScope.goods.goods_id}">
                <h1 class="text-center">${requestScope.goods.goods_name}</h1>
            </div>
        </div>
        <!-- 商品详情 -->
        <div class="row clearfix" style="margin-bottom: 50px;">
            <!-- 图片 -->
            <div class="col-md-5 column center">
                <img src="upload/${requestScope.goods.goods_img}" alt="140X140" id="img" class="img-rounded">
            </div>
            <!-- 参数 -->
            <div class="col-md-5 column">
                <dl class="dl-horizontal">
                    <dt><span class="bage">${requestScope.goods.goods_price}元</span></dt>
                    <dd><span class="bage">${requestScope.goods.goods_memory.memory_name}</span></dd>
                    <dt><span class="bage">${requestScope.goods.goods_color}</span></dt>
                    <dd><span class="bage">${requestScope.goods.goods_desc}</span></dd>
                    <dt><span class="bage">购买数量</span></dt>
                    <dd>
                        <div style="height: 38px;padding-left: 10px;padding-top: 5px;">
                            <button class="layui-btn layui-btn-radius" style="float: left" id="redubtn" onclick="reduceCounts()">-</button>
                            <div class="layui-input-inline" style="width: 50px;float: left">
                                <input type="text" class="layui-input" id="num" name="goods.goods_num" autocomplete="off" value="1">
                            </div>
                            <button class="layui-btn layui-btn-radius" id="addbtn" style="float: left" onclick="addCounts()">+</button>
                        </div>
                    </dd>
                    <dt style="padding-top: 20px;">
                        <button class="layui-btn layui-btn-lg layui-btn-radius" onclick="addToCart()">
                            <i class="layui-icon">&#xe608;</i>加入购物车
                        </button>
                    </dt>
                    <dd style="padding-top: 20px;padding-left: 10px;width: 320px;">
                        <button class="layui-btn layui-btn-lg layui-btn-radius" id="guess" onclick="addToGuess()">
                            <i class="layui-icon">&#xe600;</i>加入收藏
                        </button>
                        <button class="layui-btn layui-btn-lg layui-btn-radius" id="unguess" onclick="removeGuess()">
                            <i class="layui-icon">&#xe658;</i>取消收藏
                        </button>  <button class="layui-btn layui-btn-lg layui-btn-radius" onclick="javascript:window.location.href='view/cart';">
                            <i class="layui-icon">&#xe698;</i>去购物车
                        </button>
                    </dd>
                </dl>
            </div>
        </div>
        <!-- 热卖商品 -->
        <div class="row clearfix">
            <div class="col-md-12 column" id="hotGoods"></div>
        </div>
        <!-- 商品评价 -->
        <div class="row clearfix">
            <h2 style="padding-left: 30px;">商品评价</h2>
            <div class="col-md-12 column">
                <div class="media-body" style="padding-left: 20px;">
                    <c:if test="${evaList!=null}">
                        <c:forEach items="${evaList}" var="eva">
                            <hr class="layui-bg-blue">
                            <a href="javascript:;" class="media-left">
                                <img src="upload/${eva.eva_user.user_img}" style="height: 55px;width: 55px;" class="layui-nav-img">
                            </a>
                            <div class="pad-btm">
                                <p class="fontColor">
                                    <span>${eva.eva_user.user_name}</span>
                                    <div class="evaStar" id="eva_level${eva.eva_id}" style="height: 30px;width: 150px;float: right"></div>
                                </p>
                                <p class="fontColor">
                                    <span class="layui-badge layui-bg-blue">
                                        <fmt:formatDate value="${eva.eva_date}" pattern="yyyy年-MM月-dd日"/>
                                    </span>
                                </p>
                            </div>
                            <p class="message-text">${eva.eva_content}</p>
                            <div>
                                <c:if test="${eva.imgList!=null}">
                                    <c:forEach items="${eva.imgList}" var="img">
                                        <img src="upload/${img.evaimg_name}" style="height: 80px;width: 100px;">
                                    </c:forEach>
                                </c:if>
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty evaList}">
                        <h3>暂无评价</h3>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
    <!-- 尾部 -->
    <jsp:include page="include/foot.jsp"/>

    <script type="text/javascript">
        var flag = true;
        layui.use(['rate','layui'], function () {
            var layer = layui.layer;
            var rate = layui.rate;
            $("#num").bind('input propertychange', function () {
                var num = parseInt($("#num").val());
                if(num <= 0){
                    layer.msg('输入值不合法!',{icon:5,time:2000});
                    $("#num").val(1);
                }
            });
            rate.render({
                elem: '.evaStar',
                theme: '#FF5722',
                readonly: true,
            });
            var arr = new Array();
            <c:forEach items="${evaList}" var="eva">
                arr.push('${eva.eva_id}${eva.eva_level}')
            </c:forEach>
            for(var i = 0; i < arr.length; i++){
                var id = arr[i].substring(0,arr[i].length-1);
                var v = arr[i].substr(arr.length-1,1);
                rate.render({
                    elem: '#evaStar' + id,
                    theme: '#FF5722',
                    readonly: true,
                    value: v
                });
            }
        });
        $(function () {
            isGuess();
            showHotGoods();
        })
        function isGuess() {
           var goods_id = $("#goods_id").val();
           $.ajax({
               type: "post",
               url: "guess/isGuess",
               data: {"goods_id" : goods_id},
               dataType: "json",
               success: function(data){
                   if(data == "true"){
                       $("#guess").hide();
                       $("#unguess").show();
                   }else {
                       $("#guess").show();
                       $("#unguess").hide();
                   }
               }
           });
        }
        function reduceCounts() {
            var num = parseInt($("#num").val());
            if(num - 1 <= 0){
                $("#redubtn").prop("disabled",true);
            }else {
                num--;
                $("#num").val(num);
            }
        }
        function addCounts() {
            var num = parseInt($("#num").val());
            $("#num").val(num + 1);
            $("#redubtn").prop("disabled",false);
        }
        function addToCart() {
            var num = $("num").val();
            var goods_id = $("#goods_id").val();
            $.ajax({
                type: "post",
                url: "cart/addCart",
                data: {
                    "num": num,
                    "goods_id": goods_id
                },
                dataType: "json",
                success: function (data) {
                    if(data == "success"){
                        layer.msg('添加成功!',{icon:1,time:2000});
                    }else {
                        layer.msg('添加失败!',{icon:5,time:2000});
                    }
                }
            });
        }
        function addToGuess() {
            var goods_id = $("#goods_id").val();
            $.ajax({
                type: "post",
                url: "guess/addGuess",
                data:{"goods_id": goods_id},
                dataType: "json",
                success: function (data) {
                    if(data == "success"){
                        layer.msg('收藏成功！',{icon:1,time:2000});
                    }else {
                        layer.msg('收藏失败！',{icon:5,time:2000});
                    }
                    isGuess();
                }
            });
        }
        function removeGuess() {
            var goods_id = $("#goods_id").val();
            $.ajax({
                type: "post",
                url: "guess/removeGuess",
                data: {"goods_id": goods_id},
                dataType: "json",
                success: function (data) {
                    if(data == "success"){
                        layer.msg('取消收藏成功！',{icon:1,time:2000});
                    }else {
                        layer.msg('取消收藏失败！',{icon:5,time:2000});
                    }
                    isGuess();
                }
            });
        }
        function showHotGoods() {
            $.ajax({
                type: "post",
                url: "goods/findHotGoods",
                dataType: "json",
                success: function (data) {
                    var div = "<h2>热卖推荐</h2><div class='span16' style='width: 1120px;'><ul>";
                    for(var i = 0; i < data.length; i++){
                        div = div
                                + "<a href='goods/detail?goodsId="+ data[i].goods_id +"'>"
                                + "<li><img src='upload/"+ data[i].goods_img+"'/>"
                                + "<p class='goods-title'>"+ data[i].goods_name + "</p>"
                                + "<p class='goods-desc'>"+ data[i].goods_desc + "</p>"
                                + "<p><span class='newprice'>"+ data[i].goods_price + "</span> </p>"
                                + "</li></a>";
                    }
                    div = div + "</ul></div></div>";
                    if(flag){
                        flag = false;
                        $("#hotGoods").html(div);
                    }
                }
            })
        }
    </script>
</body>
</html>
