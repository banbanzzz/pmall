<%--
  Created by IntelliJ IDEA.
  User: Wxj
  Date: 2019/8/17
  Time: 12:09
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
    <title>搜索结果</title>
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/css/style.css" rel="stylesheet">
    <script src="resources/js/jquery.min.js" type="text/javascript"></script>
    <script src="resources/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="resources/js/layer.js" type="text/javascript"></script>
</head>
<body>
    <!-- 导航栏部 -->
    <jsp:include page="include/header.jsp"/>
    <!-- 中间 -->
<%--    <div class="container">--%>
<%--        <div class="row margin-t">--%>
<%--            <div class="form-horizontal">--%>
<%--                <div class="col-md-2 col-sm-2"></div>--%>
<%--                <div class="form-group form-group-lg col-sm-6 col-md-6">--%>
<%--                    <input type="text" class="form-control" id="newSearchKeyWord" placeholder="iPhone X">--%>
<%--                </div>--%>
<%--                <button type="button" class="btn btn-primary btn-lg col-md-2 col-sm-2 bg-button" onclick="search()">查找商品</button>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
    <div class="container" style="margin-top: 50px;">
        <div class="row">
            <div id="searchResult">
                <div class="span16" style="width: 1120px;">
                    <ul>
                        <c:forEach items="${searchList}" var="goods" varStatus="list">
                            <c:if test="${list.count%4!=0}">
                                <a href="goods/detail?goodsId=${goods.goods_id}">
                                    <li>
                                        <img src="upload/${goods.goods_img}"/>
                                        <p class="goods-title">${goods.goods_name}</p>
                                        <p class="goods-desc">${goods.goods_desc}</p>
                                        <p><span class="newprice">${goods.goods_price}元</span></p>
                                    </li>
                                </a>
                            </c:if>
                            <c:if test="${list.count%4==0}">
                                <a href="goods/detail?goodsId=${goods.goods_id}">
                                    <li class="brick4">
                                        <img src="upload/${goods.goods_img}"/>
                                        <p class="goods-title">${goods.goods_name}</p>
                                        <p class="goods-desc">${goods.goods_desc}</p>
                                        <p><span class="newprice">${goods.goods_price}元</span></p>
                                    </li>
                                </a>
                            </c:if>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- 尾部 -->
    <jsp:include page="include/foot.jsp"/>
    
    <script type="text/javascript">
        function search() {
           var keyword = $("#newSearchKeyWord").val();
           $.ajax({
              type: "post",
              url: "goods/searchPre",
              data: {"KeyWord": keyword},
              dataType: "json",
              success: function (data) {
                  var div = "<div class='span16' style='width: 1120px;'><ul>";
                  for(var i = 0; i < data.length; i++){
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
                  $("#searchResult").html(div);
              }
           });
        }
    </script>
</body>
</html>
