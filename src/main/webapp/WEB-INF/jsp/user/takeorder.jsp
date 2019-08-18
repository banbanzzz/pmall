<%--
  Created by IntelliJ IDEA.
  User: Wxj
  Date: 2019/8/19
  Time: 3:51
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
    <title>付款</title>
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/css/style.css" rel="stylesheet">
    <link href="resources/css/layui.css" rel="stylesheet">
    <script src="resources/js/jquery.min.js" type="text/javascript"></script>
    <script src="resources/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="resources/js/layui.js" type="text/javascript"></script>
</head>
<body>
    <!-- 导航栏 -->
    <jsp:include page="include/header.jsp"/>
    <!-- 中间 -->
    <div class="container-fluid bigHead">
        <div class="row" style="background-color: white">
            <div class="col-sm-10 col-md-10 col-sm-offset-1 col-md-offset-1">
                <div class="jumbotron">
                    <h1>下单成功！</h1>
                </div>
            </div>
            <div class="col-sm-10 col-md-10 col-sm-offset-1 col-md-offset-1">
                <table class="table table-hover center" id="cartTable">
                    <tr>
                        <th>订单编号</th>
                        <th>总价</th>
                        <th>收件人</th>
                        <th>电话</th>
                        <th>收货地址</th>
                        <th>状态</th>
                    </tr>
                    <tr>
                        <th>${order.order_id}</th>
                        <th>${order.order_price}</th>
                        <th>${order.order_username}</th>
                        <th>${order.order_phone}</th>
                        <th>${order.order_address}</th>
                        <th>待付款</th>
                    </tr>
                </table>
                <hr/>
                <div class="row" style="text-align: center">
                    <button class="layui-btn layui-btn-lg layui-btn-normal" onclick="javascript:window.location.href='view/index'">继续购买</button>
                    <button class="layui-btn layui-btn-lg layui-btn-warm" onclick="payForOrder(${order.order_id})">立即支付</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 尾部 -->
    <jsp:include page="include/header.jsp"/>

    <script type="text/javascript">
        layui.use(['layer','form'],function () {
            var layer = layui.layer;
            var form = layui.form;
        });
        function payForOrder(id) {
            layer.confirm("确定支付？",function () {
                $.ajax({
                   type: "post",
                   url: "order/payForOrder",
                   data: {"orderId": id},
                   dataType: "json",
                   success: function (data) {
                       if(data == "success"){
                           layer.msg('支付成功！',{icon:1,time:2000},function () {
                               window.location.href = "view/usercenter/#section2";
                           });
                       }else {
                           layer.msg('支付失败！',{icon:5,time:2000});
                       }
                   }
                });
            })
        }
    </script>
</body>
</html>
