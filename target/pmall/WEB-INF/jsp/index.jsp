<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <title>手机商城</title>
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/css/style.css" rel="stylesheet">
    <link href="resources/css/layui.css" rel="stylesheet">
    <script src="resources/js/jquery.min.js" type="text/javascript"></script>
    <script src="resources/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="resources/js/layui.js" type="text/javascript"></script>
</head>
<body>
    <!-- 导航栏 -->
    <jsp:include page="user/include/header.jsp"/>
    <!-- 中间 -->
    <div class="container">
        <div class="row">
            <!-- 控制栏 -->
            <div class="col-sm-3 col-md-2 sidebar sidebar-1">
                <ul class="nav nav-sidebar">
                    <c:forEach items="${applicationScope.goodsTypeList}" var="type" varStatus="c">
                        <c:if test="${fn:length(type.goodsList) != 0}">
                            <c:if test="${c.count == 1}">
                                <li class="list-group-item-diy">
                                    <a href="#productArea${type.type_id}">${type.type_name}
                                        <span class="sr-only">(current)</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${c.count != 1}">
                                <li class="list-group-item-diy">
                                    <a href="#productArea${type.type_id}">${type.type_name}</a>
                                </li>
                            </c:if>
                        </c:if>
                    </c:forEach>
                </ul>
            </div>
            <!-- 控制内容 -->
            <div class="col-sm-9 col-sm-offset-2 col-md-10 col-md-offset-2 main">
                <!-- 轮播图 -->
                <div class="layui-carousel" id="myCarousel">
                    <div carousel-item>
                        <c:forEach items="${applicationScope.bannerList}" var="banner">
                            <div>
                                <a href="${banner.banner_url}">
                                    <img src="upload/${banner.banner_img}" style="width: 1144px;height: 300px;">
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <!-- 商品 -->
                <!-- <div name="productArea1" class="row pd-10" id="productArea1">
					<div class="span16">
						<h2 class="title">苹果手机</h2>
						<ul>
										<a href="#">
											<li>
												<img src="upload/红米note4X.jpg" />
												<p class="goods-title">小米6X 4GB+32GB</p>
												<p class="goods-desc">全索尼相机，骁龙660 AIE处理器</p>
												<p><span class="newprice">1499元</span>&nbsp;
												</p>
											</li>
										</a>
					</div>
				</div> -->
                <c:forEach items="${applicationScope.goodsTypeList}" var="type">
                    <c:if test="${fn:length(type.goodsList) != 0}">
                        <div name="productArea${type.type_id}" class="row pd-10" id="productArea${type.type_id}"></div>
                    </c:if>
                </c:forEach>
            </div>
            <div class="col-sm-9 col-sm-offset-2 col-md-10 col-md-offset-1">
                <jsp:include page="user/include/foot.jsp"/>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        layui.use(['carousel','layer'],function() {
            var carousel = layui.carousel;
            var layer = layui.layer;
            carousel.render({
                elem: '#myCarousel',
                width: '100%',
                arrow: 'hover',
                anim: 'fade'
            });
        });
        $(function () {
            getAllType();
        });
        function getAllType() {
            $.ajax({
                type: "post",
                url: "goodsType/findAll",
                dataType: "json",
                success: function (data) {
                    for(var i = 0; i < data.length; i++){
                        showGoodsType(data[i].type_id);
                    }
                }
            });
        };
        function showGoodsType(id) {
            $.ajax({
                type: "post",
                url: "goods/findGoodsByType",
                data: {"type_id": id},
                dataType: "json",
                success: function (data) {
                    var div = "<div class='span16'><ul>";
                    for(var i = 0; i < data.length; i++){
                        if(i == 0){
                            div = div + "<h2 class='title'>" + data[i].goods_type.type_name + "</h2>";
                        }
                        //显示4列
                        if((i+1)%4 != 0){
                            div = div + "<a href='goods/detail?goodsId=" + data[i].goods_id + "'><li>" +
                                  "<img src='upload/"+ data[i].goods_img +"' /><p class='goods-title'>" + data[i].goods_name + "</p>" +
                                    "<p class='goods-desc'>" + data[i].goods_desc + "</p><p><span class='newprice'>" + data[i].goods_price +"元</span>" +
                                    "</p></li></a>";
                        }else {
                            div = div + "<a href='goods/detail?goodsId=" + data[i].goods_id + "'><li class='brick4'>" +
                                "<img src='upload/"+ data[i].goods_img +"' /><p class='goods-title'>" + data[i].goods_name + "</p>" +
                                "<p class='goods-desc'>" + data[i].goods_desc + "</p><p><span class='newprice'>" + data[i].goods_price +"元</span>" +
                                "</p></li></a>";
                        }
                    }
                    var div = div + "</ul></div>";
                    $("#productArea" + id).html(div);
                }
            });
        }
    </script>
</body>
</html>
