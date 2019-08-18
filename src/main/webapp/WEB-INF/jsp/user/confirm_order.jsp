<%--
  Created by IntelliJ IDEA.
  User: Wxj
  Date: 2019/8/18
  Time: 3:57
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
    <title>结算</title>
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
        <div class="row" style="background-color: white;">
            <div class="col-sm-10 col-md-10 col-sm-offset-1 col-md-offset-1">
                <div class="jumbotron">
                    <h1>欢迎来到结算页</h1>
                    <p>您的商品清单为</p>
                </div>
            </div>
            <div class="col-sm-10 col-md-10 col-sm-offset-1 col-md-offset-1">
                <form action="order/takeOrder" id="orderFrom" method="post">
                    <h2>请选择收货地址</h2>
                    <table>
                        <c:if test="${not empty addressList}">
                            <c:forEach items="${addressList}" var="addr">
                                <div class="layui-form-item">
                                    <label class="layui-form-label">
                                        <input type="radio" name="addr" value="${addr.addr_id}">
                                    </label>
                                    <div class="layui-input-block">
                                        <label style="padding-top: 7px;">${addr.addr_province}${addr.addr_city}${addr.addr_area}${addr.addr_detail}&nbsp;&nbsp;${addr.addr_nickname}收&nbsp;&nbsp;${addr.addr_phone}</label>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                        <c:if test="${empty addressList}">
                            <button type="button" class="layui-btn layui-btn-lg layui-btn-radius layui-btn-normal" onclick="javascript:location.href='view/usercenter/#section3'">去添加地址</button>
                        </c:if>
                    </table>
                    <table class="table table-hover center" id="cartTable">
                        <tr>
                            <th>商品</th>
                            <th>商品名称</th>
                            <th>商品单价</th>
                            <th>商品数量</th>
                            <th>总价</th>
                        </tr>
                        <c:forEach items="${cartList}" var="cart">
                            <tr>
                                <input type="hidden" name="goodslist" value="${cart.cart_id}">
                                <td><img src="upload/${cart.cart_goods.goods_img}" style="height: 40px;"></td>
                                <td><a href="goods/detail?goodsId=${cart.cart_goods.goods_id}" style="text-decoration: none">${cart.cart_goods.goods_name}</a></td>
                                <td>${cart.cart_goods.goods_price}元</td>
                                <td>${cart.cart_num}</td>
                                <td><span name="singleTotal">${cart.cart_goods.goods_price}*${cart.cart_num}</span>元</td>
                            </tr>
                        </c:forEach>
                    </table>
                    <hr/>
                    <div style="text-align: right;width: 1000px;height: 50px;font-size: 16px;color: red">
                        已选<span id="totalNum">0</span>件&nbsp;&nbsp;&nbsp;总价：<span id="totalPrice">0</span>元</div>
                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-4"></div>
                        <button class="btn btn-danger btn-lg col-lg-4 col-md-4 col-sm-4" onclick="confirmPre();">确认下单</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- 尾部 -->
    <jsp:include page="include/foot.jsp"/>

    <script type="text/javascript">
        var layer;
        layui.use(['layer','form'], function () {
            var layer = layui.layer;
            var form = layui.form;
        });
        $(function () {
           var list = $("span[name='singleTotal']");
           var total = 0;
           for(var i = 0; i < list.length; i++){
               var price = parseInt($(list[i]).html());
               total += price;
           }
           $("#totalPrice").html(total);
        });
        function checkSelect() {
            var addr = $("input:radio[name='addr']:checked").val();
            if(addr == null){
                return false;
            }
            return true;
        }
        function confirmPre() {
            var flag = checkSelect();
            if(flag){
                $('#orderFrom').submit();
            }else {
                layer.msg('请选择收货地址',{icon:5,anim:6,time:2000});
            }
        }
    </script>
</body>
</html>
