<%--
  Created by IntelliJ IDEA.
  User: Wxj
  Date: 2019/8/28
  Time: 9:09
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
    <title>手机商城后台管理</title>
    <link rel="stylesheet" href="resources/css/iconfont.css">
    <link rel="stylesheet" href="resources/css/layui.css">
    <script src="resources/js/jquery.1.12.4.min.js"></script>
    <script src="resources/js/layui.js"></script>
    <style>
        .layui-nav-tree .layui-nav-item{
            width:90% !important;
        }
    </style>
</head>
<body class="layui-layout-body">
    <div class="layui-layout layui-layout-admin">
        <div class="layui-header">
            <div class="layui-logo">手机商城后台管理</div>
            <!-- 头部导航 （水平）-->
            <ul class="layui-nav layui-layout-left">
                <li class="layui-nav-item"><a href="view/main" target="myframe">主页</a></li>
                <li class="layui-nav-item"><a href="view/index" target="_blank">商城</a> </li>
            </ul>
            <ul class="layui-nav layui-layout-right">
                <li class="layui-nav-item">
                    <a href="javascript:;"><img src="upload/headpic.jpg" class="layui-nav-img" alt="">${sessionScope.admin.admin_name}</a>
                </li>
                <li class="layui-nav-item"><a href="admin/logout">退出</a></li>
            </ul>
        </div>

        <div class="layui-side layui-bg-black">
            <!-- 左侧导航栏（垂直）-->
            <div class="layui-side-scroll">
<%--                <ui class="layui-nav layui-nav-tree" lay-filter="test">--%>
<%--                    <li class="layui-nav-item">--%>
<%--                        <a href="javascript:;">商品管理</a>--%>
<%--                        <dl class="layui-nav-child">--%>
<%--                            <dd><a href="view/goodslist" target="myframe">查看商品</a></dd>--%>
<%--                            <dd><a href="view/addGoods" target="myframe">添加商品</a></dd>--%>
<%--                        </dl>--%>
<%--                    </li>--%>
<%--                    <li class="layui-nav-item">--%>
<%--                        <a href="javascript:;">订单管理</a>--%>
<%--                        <dl class="layui-nav-child">--%>
<%--                            <dd><a href="view/orderlist" target="myframe">查看订单</a></dd>--%>
<%--                        </dl>--%>
<%--                    </li>--%>
<%--                    <li class="layui-nav-item">--%>
<%--                        <a href="javascript:;">用户管理</a>--%>
<%--                        <dl class="layui-nav-child">--%>
<%--                            <dd><a href="view/userlist" target="myframe">查看用户</a></dd>--%>
<%--                        </dl>--%>
<%--                    </li>--%>
<%--                    <li class="layui-nav-item">--%>
<%--                        <a href="javascript:;">轮播图管理</a>--%>
<%--                        <dl class="layui-nav-child">--%>
<%--                            <dd><a href="view/bannerlist" target="myframe">查看轮播图</a></dd>--%>
<%--                            <dd><a href="view/addbanner" target="myframe">添加轮播图</a></dd>--%>
<%--                        </dl>--%>
<%--                    </li>--%>
<%--                    <li class="layui-nav-item">--%>
<%--                        <a href="javascript:;">评论管理</a>--%>
<%--                        <dl class="layui-nav-child">--%>
<%--                            <dd><a href="view/evalist" target="myframe">查看评论</a></dd>--%>
<%--                        </dl>--%>
<%--                    </li>--%>
<%--                    <li class="layui-nav-item">--%>
<%--                        <a href="javascript:;">商品分类管理</a>--%>
<%--                        <dl class="layui-nav-child">--%>
<%--                            <dd><a href="view/typelist" target="myframe">查看分类</a></dd>--%>
<%--                        </dl>--%>
<%--                    </li>--%>
<%--                    <li class="layui-nav-item">--%>
<%--                        <a href="javascript:;">账号管理</a>--%>
<%--                        <dl class="layui-nav-child">--%>
<%--                            <dd><a href="view/adminlist" target="myframe">查看管理员</a></dd>--%>
<%--                            <dd><a href="view/updatepass" target="myframe">修改密码</a></dd>--%>
<%--                        </dl>--%>
<%--                    </li>--%>
<%--                </ui>--%>
                <!-- 权限封装 -->
                <ui class="layui-nav layui-nav-tree" lay-filter="test">
                    <c:forEach items="${sessionScope.admin.admin_role.role_funs}" var="f">
                        <c:if test="${not empty f.funsList}">
                            <li class="layui-nav-item">
                                <a href="javascript:;">${f.fun_name}</a>
                                <dl class="layui-nav-child">
                                    <c:forEach items="${f.funsList}" var="fun">
                                        <dd><a href="${fun.fun_url}" target="${fun.fun_target}">${fun.fun_name}</a></dd>
                                    </c:forEach>
                                </dl>
                            </li>
                        </c:if>
                        <c:if test="${empty f.funsList}">
                            <li class="layui-nav-item">
                                <a href="${f.fun_url}" target="${f.fun_target}">${f.fun_name}</a>
                            </li>
                        </c:if>
                    </c:forEach>
                </ui>
            </div>
        </div>
        
        <div class="layui-body">
            <!-- 内容主体 -->
            <iframe src="view/main" name="myframe" style="width: 100%;height: 100%;border: 0"></iframe>
        </div>

        <div class="layui-footer">
            <!-- 底部固定 -->
            © layui.com - Wxj
        </div>
    </div>

    <script>
        layui.use(['element','layer','table'],function () {
            var element = layui.element;
            var layer = layui.layer;
            var table = layui.table;
        })
    </script>
</body>
</html>
