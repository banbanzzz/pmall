<%--
  Created by IntelliJ IDEA.
  User: Wxj
  Date: 2019/8/20
  Time: 4:25
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
    <title>用户中心</title>
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/css/style.css" rel="stylesheet">
    <link href="resources/css/layui.css" rel="stylesheet">
    <script src="resources/js/jquery.min.js" type="text/javascript"></script>
    <script src="resources/js/layui.js" type="text/javascript"></script>
    <script src="resources/js/ajaxfileupload.js" type="text/javascript"></script>
    <script src="resources/js/bootstrap.min.js" type="text/javascript"></script>
    <style type="text/css">
        a{
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
                    <li class="list-group-tiem-diy"><a href="view/usercenter/#section1">收藏中心<span class="sr-only">(current)</span></a></li>
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
                        <div class="layui-tab-content" style="height: auto">
                            <div class="layui-tab-item layui-show" id="state1">
                                <div class="layui-colla-item">
                                    <h2 class="layui-colla-title">订单编号：bbc64359a33de2c198859431&nbsp;&nbsp;总价：17995元&nbsp;订单日期：2019/8/20 4:40</h2>
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
                                        <a href="javascript:void(0)" class="layui-btn layui-btn-normal layui-btn-fluid layui-btn-radius">去付款</a>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-tab-tiem" id="state2"></div>
                            <div class="layui-tab-tiem" id="state3"></div>
                            <div class="layui-tab-tiem" id="state4"></div>
                            <div class="layui-tab-tiem" id="state5"></div>
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
                                    <col width="350">
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
                                            <button class="layui-tbn layui-btn-xs layui-btn-warm">编辑</button>
                                            <button class="layui-tbn layui-btn-xs layui-btn-danger">删除</button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <button class="layui-btn layui-btn-normal layui-btn-lg layui-btn-fluid layui-btn-radius" onclick="addAddress()">添加地址</button>
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
                                            <input type="password" id="oldPass" name="oldPass" lay-verify="required" lay-vertype="tips" class="layui-input">
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">新密码</label>
                                        <div class="layui-input-inline">
                                            <input type="password" id="newPass" name="newPass" lay-verify="required" lay-vertype="tips" autocomplete="off" class="layui-input">
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">确认密码</label>
                                        <div class="layui-input-inline">
                                            <input type="password" id="rePass" name="rePass" lay-verify="required" lay-vertype="tips" autocomplete="off" class="layui-input">
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <div class="layui-input-block">
                                            <button class="layui-btn" lay-filter="savePass">确认修改</button>
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
                    <input type="text" name="addr_nickname" id="addr_nickname" required lay-verify="required" placeholder="请输入收货人名称" value="" class="layui-input" >
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">收货人电话</label>
                <div class="layui-input-inline">
                    <input type="text" name="addr_phone" id="addr_phone" required lay-verify="required" placeholder="请输入收货人电话" value="" class="layui-input">
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
                    <input style="width:590px;" type="text" name="addr_detail" id="addr_detail" placeholder="请输入详细地址" required lay-verify="required" value="" class="layui-input" />
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">邮政编码</label>
                <div class="layui-input-inline">
                    <input type="text" name="addr_zipcode" id="addr_zipcode" placeholder="请输入邮政编码" required lay-verify="required" value="" class="layui-input" />
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
                <label class="layui-form-item">评论图</label>
                <div class="layui-input-block">
                    <button type="button" class="layui-btn" id="test1">多图片上传</button>
                    <button type="button" class="layui-btn" id="test2">开始上传</button>
                    <button type="button" class="layui-btn layui-danger" onclick="cleanImgsPreview()" id="cleanImgs">清空预览</button>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-item">预览图</label>
                <div class="layui-upload-list" id="preview"></div>
            </div>
            <input type="text" id="imgUrls" name="imgUrls" style="display: none;" class="layui-input">
            <div class="layui-form-item">
                <label class="layui-form-label">评价内容</label>
                <div class="layui-input-inline">
                    <textarea rows="8" cols="50"  required lay-verify="required" name="eva_content"></textarea>
                </div>
            </div>
            <button type="reset" style="display:none;" id="evaReset">重置</button>
        </form>
    </div>
</body>
</html>
