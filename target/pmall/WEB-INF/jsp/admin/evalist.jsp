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
    <!--若页面需默认用极速核，增加标签：-->
    <meta name="renderer" content="webkit">

    <!--若页面需默认用ie兼容内核，增加标签：-->
    <%--    <meta name="renderer" content="ie-comp">--%>

    <!--若页面需默认用ie标准内核，增加标签：-->
    <%--    <meta name="renderer" content="ie-stand">--%>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link rel="stylesheet" href="resources/css/layui.css">
    <script type="text/javascript" src="resources/js/jquery.1.12.4.min.js"></script>
    <script type="text/javascript" src="resources/js/layui.js"></script>
    <style type="text/css">
        label.layui-form-label{
            padding-top:0px;
        }
        .layui-rate{
            padding: 0 !important;
        }
    </style>
</head>
<body>
<form class="layui-form">
    <div class="layui-form-item" style="margin: 15px;height: 30px;">
        <div style="height: 40px;width: 100px;float: left;line-height: 3;">评价关键词：</div>
        <input type="text" class="layui-input" style="width: 250px;float: left;" id="keyword" name="keyword" value="" lay-verify="" placeholder="请输入关键词" autocomplete="off">
        <div class="layui-input-inline" style="width: 150px;text-align: center">
            <a class="layui-btn" id="search" name="search">
                <i class="layui-icon">&#xe615</i>搜索
            </a>
        </div>
        <div style="float:right;width:110px;height:35px;">
            <div class="layui-input-inline" style="width: 100px;">
                <a class="layui-btn layui-btn-normal" id="delete" name="delete">
                    <i class="layui-icon">&#x1006;</i>批量删除
                </a>
            </div>
        </div>
    </div>
</form>
<div>
    <table id="evaluate" lay-filter="evaluate"></table>
</div>
<!-- 模态框 -->
<div id="formData" style="width: 700px;display: none;padding-top: 15px;">
    <form id="evaForm" class="layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label">评价编号</label>
            <div class="layui-input-block">
                <p id="eva_id" name="eva_id"></p>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">评价内容</label>
            <div class="layui-input-block">
                <p id="eva_content" name="eva_content"></p>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">评价图片</label>
            <div class="layui-input-block" id="eva_img">

            </div>
        </div>
    </form>
</div>
<script type="text/html" id="bar">
    <a class="layui-btn layui-btn-xs layui-btn-normal" title="查看" lay-event="show">查看</a>
    <a class="layui-btn layui-btn-xs" title="刪除" lay-event="delete">刪除</a>
</script>
<script type="text/html" id="dateTpl">
    {{ layui.laytpl.fn(d.editdate) }}
</script>
<script type="text/javascript">
    var table;
    var layer;
    var form;
    var rate;
    layui.use(['layer','table','form','rate'],function () {
       table =  layui.table;
       layer = layui.layer;
       form = layui.form;
       rate = layui.rate;
       //渲染table
       var tableIns = table.render({
          elem: '#evaluate',
          id: 'evaluate',
          url: 'evaluate/findAll',
          width: 1140,
          cols: [[
              {checkbox: true, LAY_CHECKED: false},
              {field: 'eva_id', title: '评价编号', width: 90, align: 'center'},
              {field: 'eva_user', title: '评价人', width: 90, align: 'center', templet: function (d) {
                      return d.eva_user.user_name;
                  }},
              {field: 'eva_content', title: '评价内容', width: 250, align: 'center'},
              {field: 'eva_date', title: '评价时间', width: 150, align: 'center', templet: function (d) {
                      var date = d.eva_date;
                      //return date.Format("yyyy-MM-dd hh:mm:ss");
                      return date;
                  }},
              {field: 'eva_goods', title: '评价商品', width: 145, align: 'center', templet: function (d) {
                  return d.eva_goods.goods_name;
                  }},
              {field: 'eva_level', title: '评价星级', width: 145, align: 'center', templet: function (d) {
                      //渲染评分
                      return '<div id="evaStar'+d.eva_id+'" style="padding: 0 !important;"></div>';
                  }},
              {field: 'eva_state', title: '评价', width: 70, align: 'center', templet: function (d) {
                  if(d.eva_state == 0){
                      return '<p style="color: #ff0003">差评</p>';
                  }else if(d.eva_state == 1){
                      return '<p style="color: #FFB800">中评</p>';
                  }else {
                      return '<p style="color: #1f18ff">好评</p>';
                  }
                  }},
              {title: '操作', width: 142, align: 'center', fixed: 'right', toolbar: '#bar'},
          ]],
          page: true,
          limits: [5,10,15],
          limit: 10,
          done: function (res,curr,count) {
              //如果是异步请求数据方式，res即为你接口返回的信息。
              //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
              //console.log(res);
              //得到当前页码
              //console.log(curr);
              $("#curPageIndex").val(curr);
              var data = res.data;
              console.log(data);
              console.log(data[0].eva_level);
              for(var i in data){
                  rate.render({
                     elem: '#evaStar'+data[i].eva_id+'',
                     length: 5, //星星个数
                     value: data[i].eva_level,
                     theme: '#FF5722',
                     readonly: true
                  });
              }
              //得到数据总量
              //console.log(count);
          }
       });
       //批量删除
       $("#delete").click(function () {
          var checkStatus = table.checkStatus('evaluate');
          var count = checkStatus.data.length; //选中的行数
          if(count > 0){
              parent.layer.confirm('确定要删除所选评论？',{icon:3},function (index) {
                 var data = checkStatus.data; //获取选中行的数据
                 var batch = '';
                 for(var i = 0; i < data.length; i++){
                     batch += data[i].eva_id + ',';
                 }
                 $.ajax({
                    type: "post",
                    url: "evaluate/batchDelete",
                    data: {batch: batch},
                    success: function (result) {
                        if(result == "success"){
                            parent.layer.msg('删除成功！',{icon:1,shade:0.4,time:1000});
                            $("#search").click();//重载table数据
                        }else {
                            parent.layer.msg('删除失败，请重试！',{icon:5,shade:0.4,time:1000});
                        }
                        layer.close(index);
                    }
                 });
              });
          }else {
              parent.layer.msg('请至少选择一条数据！',{icon:5,shade:0.4,time:1000});
          }
       });
       //搜索
       $("#search").click(function () {
           var keyword = $("#keyword").val();
           tableIns.reload({
               where: {keyword: keyword},
               page: {curr: 1} //从第1页开始
           });
       });
       //工具条事件监听
       table.on('tool(evaluate)',function (obj) {
           //tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
           var data = obj.data; //获取当前行的数据
           var layEvent = obj.event;//获取lay-event的值
           var tr = obj.tr; //获取当前行tr的DOM对象
           if(layEvent == 'show'){
               layer.open({
                   type: 1,
                   title: '查看评价信息',
                   shade: 0.4,
                   fix: false,
                   shadeClose: true,
                   maxmin: false,
                   area: ['700px','400px'],
                   content: $('#formData'),
                   success: function (layero, index) {
                       var body = layer.getChildFrame('body',index);
                       $.ajax({
                          type: "post",
                          url: "evaluate/findEvaById",
                          data: {eva_id: data.eva_id},
                          dataType: "json",
                          success: function (arr) {
                              $("#eva_id").html(arr.eva_id);
                              $("#eva_content").html(arr.eva_content);
                              var list = arr.imgList;
                              if(list.length == 0){
                                  $("#eva_img").html("暂无评价图片");
                              }else {
                                  var div = '';
                                  for(var i = 0; i < list.length; i++){
                                      div = div + "<img style='width: 100px;height: 100px;' src='upload/"+list[i].evaimg_name+"'>";
                                  }
                                  $("#eva_img").html(div);
                              }
                          }
                       });
                       form.render();
                       body.find("#hidValue").val(index); //将本层的窗口索引传给子页面层的hidValue中
                   },
                   btn: ['关闭'],
                   yes: function (index, layero) {
                       layer.close(index);
                       $("#newImg").html("");
                   }
               });
           }else if(layEvent == 'delete'){
               layer.confirm('确认删除该评价？',{btn:['确认','取消'],btn1: function(index, layero) {
                       $.ajax({
                           type: "post",
                           url: "evaluate/deleteEva",
                           data: {eva_id: data.eva_id},
                           success: function (result) {
                               if (result == "success") {
                                   parent.layer.msg('删除成功！', {icon: 1, shade: 0.4, time: 1000});
                               } else {
                                   parent.layer.msg('删除失败，请重试！', {icon: 5, shade: 0.4, time: 1000});
                               }
                           }
                       });
                       $(tr).remove();
                       layer.close(index);
                   }
               });
           }
       })
    });
</script>
</body>
</html>
