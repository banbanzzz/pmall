<%--
  Created by IntelliJ IDEA.
  User: Wxj
  Date: 2019/8/17
  Time: 16:46
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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>购物车</title>
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/css/style.css" rel="stylesheet">
    <script src="resources/js/jquery.min.js" type="text/javascript"></script>
    <script src="resources/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="resources/js/layui.js" type="text/javascript"></script>
</head>
<body>
    <!-- 导航栏 -->
    <jsp:include page="include/header.jsp"/>
    <!-- 中间 -->
    <div class="container-fluid bigHead" id="maincart">
        <div class="row" style="background-color: white;">
            <div class="col-sm-10 col-md-10 col-sm-offset-1 col-md-offset-1">
                <div class="jumbotron">
                    <h1>欢迎来到购物车</h1>
                    <p>您的购物车清单为</p>
                </div>
            </div>
            <div class="col-sm-10 col-md-10 col-sm-offset-1 col-md-offset-1">
                <form action="cart/createOrder" method="post" id="cartForm">
                    <table class="table table-hover center" id="cartTable">

                    </table>
                    <hr/>
                    <div style="text-align: right;width: 1000px;height: 50px;font-size: 16px;color: red">
                        已选<span id="totalNum">0</span>件&nbsp;&nbsp;&nbsp;总价：<span id="totalPrice">0</span>元</div>
                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-4"></div>
                        <button class="btn btn-danger btn-lg col-lg-4 col-md-4 col-sm-4" onclick="confirmPre()">确认购买</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- 尾部 -->
    <jsp:include page="include/foot.jsp"/>

    <script type="text/javascript">
        layui.use(['layer'],function () {
            var layer = layui.layer;
        })
        $(function () {
            $.ajax({
               type: "post",
               url: "cart/findCartByUser",
               dataType: "json",
               success: function (data) {
                   if(data != null && data != ""){
                       var div='<tr>'+
                           '<th>是否购买<input onclick="selectAll();" type="checkbox" id="allSelect"></th>'+
                           '<th>商品图</th>'+
                           '<th>商品名称</th>'+
                           '<th>商品单价</th>'+
                           '<th>商品数量</th>'+
                           '<th>总价</th>'+
                           '<th>删除</th>'+
                           '</tr>';
                       for(var i = 0; i < data.length; i++){
                           div = div + '<tr id="goodsData'+data[i].cart_id+'">'+
                            '<td>'+
                            '<div class="checkbox">'+
                            '<label>'+
                            '<input type="checkbox" name="goodslist" value="'+data[i].cart_id+'">'+
                            '</label>'+
                            '</div>'+
                            '</td>'+
                            '<td><img src="upload/'+data[i].cart_goods.goods_img+'"/>'+
                            '<td><a href="goods/detail?goodsId='+data[i].cart_goods.goods_id+'" style="text-decoration: none;">'+data[i].cart_goods.goods_name+'</a></td>'+
                            '<td><span id="singllePrice'+data[i].cart_id+'">'+data[i].cart_goods.goods_price+'</span></td>'+
                            '<td><button type="button" onclick="reduceNum('+data[i].cart_id+')" class="btn btn-info" id="reduce'+data[i].cart_id+'">-</button><span style="width: 50px;height: 25px;display: inline-block;" id="num'+data[i].cart_id+'">'+data[i].cart_num+'</span><button type="button" onclick="addNum('+data[i].cart_id+');" class="btn btn-info" id="add'+data[i].cart_id+'">+</button></td>'+
                            '<td><span id="totalPrice'+data[i].cart_id+'">'+data[i].cart_num*data[i].cart_goods.goods_price+'</span>元</td>'+
                            '<td><button class="btn btn-warning" type="button" onclick="deleteCart('+data[i].cart_id+')">删除</button></td>'+
                            '</tr>';
                       }
                       $("#cartTable").html(div);
                       $("input[name='goodslist']").bind("click",function () {
                           changeTotal();
                           var flag = checkAll();
                           $("#allSelect").prop("checked",flag);
                       })
                   }else {
                       var empty="<div style='width:100%;height:500px;'><div style='text-align:center;padding-top:100px;'>"+
                           "<img src='upload/emptycart.png'><p><h3>亲，您的购物车里还没有物品哦，赶紧去<a href='view/index'>逛逛</a>吧!</h3></p></div></div>";
                       $("#maincart").html(empty);
                   }
               },
                error: function () {
                    layer.alert("network error!");
                }
            });
        });
        function selectAll() {
            var flag = $("#allSelect").prop("checked");
            var list = $("input[name='goodslist']");
            for(var i = 0 ; i < list.length; i++){
                $(list[i]).prop("checked",flag);
            }
            changeTotal();
        }
        function checkAll() {
            var list = $("input[name='goodslist']");
            for(var i = 0; i < list.length; i++){
                if(!$(list[i]).prop("checked")){
                    return false;
                }
            }
            return true;
        }
        function changeTotal() {
            var list = $("input[name='goodslist']");
            var totalPrice = 0;
            var num = 0;
            for(var i = 0; i < list.length; i++){
                if($(list[i]).prop("checked")){
                    num++;
                    var cart_id = $(list[i]).val();
                    var singleTotal = parseInt($("#totalPrice"+cart_id).html());
                    totalPrice += singleTotal;
                }
            }
            $("#totalPrice").html(totalPrice);
            $("#totalNum").html(num);
        }
        function reduceNum(id) {
            var num = parseInt($("#num"+id).html());
            num--;
            if(num <= 0){
                $(this).attr("disabled",true);
            }else {
                $.ajax({
                    type: "post",
                    url: "cart/reduceCartNum",
                    data: {"cart_id": id},
                    dataType: "json",
                    success: function (data) {
                        if(data == "success"){
                            $("#num"+id).html(num);
                            refreshPrice(id);
                        }
                    }
                });
            }
        }
        function addNum(id) {
            var num = parseInt($("#num"+id).html());
            num++;
            $("reduceNum"+id).attr("disabled",false);
            $.ajax({
               type: "post",
               url: "cart/addCartNum",
                data: {"cart_id": id},
                dataType: "json",
                success: function (data) {
                    if(data == "success"){
                        $("#num"+id).html(num);
                        refreshPrice(id);
                    }
                }
            });
            changeTotal();
        }
        function refreshPrice(id) {
            var num = parseInt($("#num"+id).html());
            var singlePrice = parseInt($("#singlePrice"+id).html());
            var total = num * singlePrice;
            $("#totalPrice"+id).html(total);
            changeTotal();
        }
        function deleteCart(id) {
            layer.confirm("真的要删除吗？",function () {
                $.ajax({
                   type: "post",
                   url: "cart/deleteCart",
                   data: {"cart_id": id},
                   dataType: "json",
                   success: function (data) {
                       if(data == "success"){
                           layer.msg('删除成功！',{icon:1,shade:0.4,time:1000});
                       }else {
                           layer.msg('删除失败！',{icon:5,shade:0.4,time:1000});
                       }
                       $("#goodsData"+id).remove();
                   }
                });
            })
        }
        function confirmPre() {
            var num = parseInt($("#totalNum").html());
            if(num < 1){
                layer.msg('请选择要购买的商品!',{icon:5,anim:6,time:2000});
            }else {
                $("#cartForm").submit();
            }
        }
    </script>
</body>
</html>
