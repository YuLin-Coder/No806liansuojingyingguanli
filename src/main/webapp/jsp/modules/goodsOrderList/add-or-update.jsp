<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">

<head>
    <%@ include file="../../static/head.jsp" %>
    <link href="http://www.bootcss.com/p/bootstrap-datetimepicker/bootstrap-datetimepicker/css/datetimepicker.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap-select.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" charset="utf-8">
        window.UEDITOR_HOME_URL = "${pageContext.request.contextPath}/resources/ueditor/"; //UEDITOR_HOME_URL、config、all这三个顺序不能改变
    </script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
<style>
    .error {
        color: red;
    }
</style>
<body>
<!-- Pre Loader -->
<div class="loading">
    <div class="spinner">
        <div class="double-bounce1"></div>
        <div class="double-bounce2"></div>
    </div>
</div>
<!--/Pre Loader -->
<div class="wrapper">
    <!-- Page Content -->
    <div id="content">
        <!-- Top Navigation -->
        <%@ include file="../../static/topNav.jsp" %>
        <!-- Menu -->
        <div class="container menu-nav">
            <nav class="navbar navbar-expand-lg lochana-bg text-white">
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="ti-menu text-white"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul id="navUl" class="navbar-nav mr-auto">

                    </ul>
                </div>
            </nav>
        </div>
        <!-- /Menu -->
        <!-- Breadcrumb -->
        <!-- Page Title -->
        <div class="container mt-0">
            <div class="row breadcrumb-bar">
                <div class="col-md-6">
                    <h3 class="block-title">编辑采购调度详情表</h3>
                </div>
                <div class="col-md-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="${pageContext.request.contextPath}/index.jsp">
                                <span class="ti-home"></span>
                            </a>
                        </li>
                        <li class="breadcrumb-item">采购调度详情表管理</li>
                        <li class="breadcrumb-item active">编辑采购调度详情表</li>
                    </ol>
                </div>
            </div>
        </div>
        <!-- /Page Title -->

        <!-- /Breadcrumb -->
        <!-- Main Content -->
        <div class="container">

            <div class="row">
                <!-- Widget Item -->
                <div class="col-md-12">
                    <div class="widget-area-2 lochana-box-shadow">
                        <h3 class="widget-title">采购调度详情表信息</h3>
                        <form id="addOrUpdateForm">
                            <div class="form-row">
                            <!-- 级联表的字段 -->
                                    <div class="form-group col-md-6">
                                        <label>总库物资</label>
                                        <div>
                                            <select id="goodsSelect" name="goodsSelect"
                                                    class="selectpicker form-control"  data-live-search="true"
                                                    title="请选择" data-header="请选择" data-size="5">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>物品名字</label>
                                        <input id="goodsName" name="goodsName" class="form-control"
                                               placeholder="物品名字" readonly>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>物品种类</label>
                                        <input id="goodsValue" name="goodsValue" class="form-control"
                                               placeholder="物品种类" readonly>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>物资数量</label>
                                        <input id="goodsNumber" name="goodsNumber" class="form-control"
                                               placeholder="物资数量" readonly>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>物品图片</label>
                                        <img id="goodsPhotoImg" src="" width="100" height="100">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>单位</label>
                                        <input id="danwei" name="danwei" class="form-control"
                                               placeholder="单位" readonly>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>单价</label>
                                        <input id="danjia" name="danjia" class="form-control"
                                               placeholder="单价" readonly>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>是否删除</label>
                                        <input id="flag" name="flag" class="form-control"
                                               placeholder="是否删除" readonly>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>采购调度表</label>
                                        <div>
                                            <select id="goodsOrderSelect" name="goodsOrderSelect"
                                                    class="selectpicker form-control"  data-live-search="true"
                                                    title="请选择" data-header="请选择" data-size="5">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>订单名</label>
                                        <input id="goodsOrderName" name="goodsOrderName" class="form-control"
                                               placeholder="订单名" readonly>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>操作人姓名</label>
                                        <input id="caozuoName" name="caozuoName" class="form-control"
                                               placeholder="操作人姓名" readonly>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>操作人所在表名</label>
                                        <input id="caozuoTable" name="caozuoTable" class="form-control"
                                               placeholder="操作人所在表名" readonly>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>类型</label>
                                        <input id="goodsOrderValue" name="goodsOrderValue" class="form-control"
                                               placeholder="类型" readonly>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>供应商</label>
                                        <input id="gongyingshangId" name="gongyingshangId" class="form-control"
                                               placeholder="供应商" readonly>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>分店</label>
                                        <input id="fendianId" name="fendianId" class="form-control"
                                               placeholder="分店" readonly>
                                    </div>
                            <!-- 当前表的字段 -->
                                    <input id="updateId" name="id" type="hidden">
                                <input id="goodsOrderId" name="goodsOrderId" type="hidden">
                                <input id="goodsId" name="goodsId" type="hidden">
                                    <div class="form-group col-md-6">
                                        <label>数量</label>
                                        <input id="goodsOrderListNumber" name="goodsOrderListNumber" class="form-control"
                                               onchange="goodsOrderListNumberChickValue(this)"  placeholder="数量">
                                    </div>

                                    <div class="form-group col-md-12 mb-3">
                                        <button id="submitBtn" type="button" class="btn btn-primary btn-lg">提交</button>
                                        <button id="exitBtn" type="button" class="btn btn-primary btn-lg">返回</button>
                                    </div>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- /Widget Item -->
            </div>
        </div>
        <!-- /Main Content -->
    </div>
    <!-- /Page Content -->
</div>
<!-- Back to Top -->
<a id="back-to-top" href="#" class="back-to-top">
    <span class="ti-angle-up"></span>
</a>
<!-- /Back to Top -->
<%@ include file="../../static/foot.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.ui.widget.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.fileupload.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/validate/jquery.validate.min.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/validate/messages_zh.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/validate/card.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/datetimepicker/bootstrap-datetimepicker.min.js"></script>
</script>
<script type="text/javascript" charset="utf-8"
                 src="${pageContext.request.contextPath}/resources/js/bootstrap-select.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/laydate.js"></script>
<script>
    <%@ include file="../../utils/menu.jsp"%>
    <%@ include file="../../static/setMenu.js"%>
    <%@ include file="../../utils/baseUrl.jsp"%>

    var tableName = "goodsOrderList";
    var pageType = "add-or-update";
    var updateId = "";
    var crossTableId = -1;
    var crossTableName = '';
    var ruleForm = {};
    var crossRuleForm = {};


    // 下拉框数组
        <!-- 当前表的下拉框数组 -->
        <!-- 级联表的下拉框数组 -->
    var goodsOptions = [];
    var goodsOrderOptions = [];

    var ruleForm = {};


    // 文件上传
    function upload() {

        <!-- 当前表的文件上传 -->

    }

    // 表单提交
    function submit() {
        if (validform() == true && compare() == true) {
            let data = {};
            getContent();
           if($("#goodsOrderId") !=null){
               var goodsOrderId = $("#goodsOrderId").val();
               if(goodsOrderId == null || goodsOrderId =='' || goodsOrderId == 'null'){
                   alert("采购调度不能为空");
                   return;
               }
           }
           if($("#goodsId") !=null){
               var goodsId = $("#goodsId").val();
               if(goodsId == null || goodsId =='' || goodsId == 'null'){
                   alert("物资表不能为空");
                   return;
               }
           }
            let value = $('#addOrUpdateForm').serializeArray();
            $.each(value, function (index, item) {
                data[item.name] = item.value;
            });
            let json = JSON.stringify(data);
            var urlParam;
            var successMes = '';
            if (updateId != null && updateId != "null" && updateId != '') {
                urlParam = 'update';
                successMes = '修改成功';
            } else {
                urlParam = 'save';
                    successMes = '添加成功';
            }
            httpJson("goodsOrderList/" + urlParam, "POST", data, (res) => {
                if(res.code == 0){
                    window.sessionStorage.removeItem('addgoodsOrderList');
                    window.sessionStorage.removeItem('updateId');
                    let flag = true;
                    if (flag) {
                        alert(successMes);
                    }
                    if (window.sessionStorage.getItem('onlyme') != null && window.sessionStorage.getItem('onlyme') == "true") {
                        window.sessionStorage.removeItem('onlyme');
                        window.sessionStorage.setItem("reload","reload");
                        window.parent.location.href = "${pageContext.request.contextPath}/index.jsp";
                    } else {
                        window.location.href = "list.jsp";
                    }
                }
            });
        } else {
            alert("表单未填完整或有错误");
        }
    }

    // 查询列表
        <!-- 查询当前表的所有列表 -->
        <!-- 查询级联表的所有列表 -->
        function goodsSelect() {
            //填充下拉框选项
            http("goods/page?page=1&limit=100&sort=&order=", "GET", {}, (res) => {
                if(res.code == 0){
                    goodsOptions = res.data.list;
                }
            });
        }

        function goodsSelectOne(id) {
            http("goods/info/"+id, "GET", {}, (res) => {
                if(res.code == 0){
                ruleForm = res.data;
                goodsShowImg();
                goodsShowVideo();
                goodsDataBind();
            }
        });
        }
        function goodsOrderSelect() {
            //填充下拉框选项
            http("goodsOrder/page?page=1&limit=100&sort=&order=", "GET", {}, (res) => {
                if(res.code == 0){
                    goodsOrderOptions = res.data.list;
                }
            });
        }

        function goodsOrderSelectOne(id) {
            http("goodsOrder/info/"+id, "GET", {}, (res) => {
                if(res.code == 0){
                ruleForm = res.data;
                goodsOrderShowImg();
                goodsOrderShowVideo();
                goodsOrderDataBind();
            }
        });
        }



    // 初始化下拉框
    <!-- 初始化当前表的下拉框 -->

        function initializationgoodsSelect() {
            var goodsSelect = document.getElementById('goodsSelect');
            if(goodsSelect != null && goodsOptions != null  && goodsOptions.length > 0 ) {
                for (var i = 0; i < goodsOptions.length; i++) {
                        goodsSelect.add(new Option(goodsOptions[i].goodsName, goodsOptions[i].id));
                }

                $("#goodsSelect").change(function(e) {
                        goodsSelectOne(e.target.value);
                });
            }

        }

        function initializationgoodsOrderSelect() {
            var goodsOrderSelect = document.getElementById('goodsOrderSelect');
            if(goodsOrderSelect != null && goodsOrderOptions != null  && goodsOrderOptions.length > 0 ) {
                for (var i = 0; i < goodsOrderOptions.length; i++) {
                        goodsOrderSelect.add(new Option(goodsOrderOptions[i].goodsOrderName, goodsOrderOptions[i].id));
                }

                $("#goodsOrderSelect").change(function(e) {
                        goodsOrderSelectOne(e.target.value);
                });
            }

        }



    // 下拉框选项回显
    function setSelectOption() {

        <!-- 当前表的下拉框回显 -->
        <!--  级联表的下拉框回显  -->
            var goodsSelect = document.getElementById("goodsSelect");
            if(goodsSelect != null && goodsOptions != null  && goodsOptions.length > 0 ) {
                for (var i = 0; i < goodsOptions.length; i++) {
                    if (goodsOptions[i].id == ruleForm.goodsId) {//下拉框value对比,如果一致就赋值汉字
                        goodsSelect.options[i+1].selected = true;
                        $("#goodsSelect" ).selectpicker('refresh');
                    }
                }
            }
            var goodsOrderSelect = document.getElementById("goodsOrderSelect");
            if(goodsOrderSelect != null && goodsOrderOptions != null  && goodsOrderOptions.length > 0 ) {
                for (var i = 0; i < goodsOrderOptions.length; i++) {
                    if (goodsOrderOptions[i].id == ruleForm.goodsOrderId) {//下拉框value对比,如果一致就赋值汉字
                        goodsOrderSelect.options[i+1].selected = true;
                        $("#goodsOrderSelect" ).selectpicker('refresh');
                    }
                }
            }
    }


    // 填充富文本框
    function setContent() {

        <!-- 当前表的填充富文本框 -->
    }
    // 获取富文本框内容
    function getContent() {

        <!-- 获取当前表的富文本框内容 -->
    }
    //数字检查
        <!-- 当前表的数字检查 -->
        function goodsOrderListNumberChickValue(e){
            var this_val = e.value || 0;
            var reg=/^[1-9][0-9]*$/;
            if(!reg.test(this_val)){
                e.value = "";
                alert("输入不合法");
                return false;
            }
        }

    function exit() {
        window.sessionStorage.removeItem("updateId");
        window.sessionStorage.removeItem('addgoodsOrderList');
        window.location.href = "list.jsp";
    }
    // 表单校验
    function validform() {
        return $("#addOrUpdateForm").validate({
            rules: {
                goodsOrderId: "required",
                goodsId: "required",
                goodsOrderListNumber: "required",
            },
            messages: {
                goodsOrderId: "采购调度不能为空",
                goodsId: "物资表不能为空",
                goodsOrderListNumber: "数量不能为空",
            }
        }).form();
    }

    // 获取当前详情
    function getDetails() {
        var addgoodsOrderList = window.sessionStorage.getItem("addgoodsOrderList");
        if (addgoodsOrderList != null && addgoodsOrderList != "" && addgoodsOrderList != "null") {
            window.sessionStorage.removeItem('addgoodsOrderList');
            //注册表单验证
            $(validform());
            $('#submitBtn').text('新增');

        } else {
            $('#submitBtn').text('修改');
            var userId = window.sessionStorage.getItem('userId');
            updateId = userId;//先赋值登录用户id
            var uId  = window.sessionStorage.getItem('updateId');//获取修改传过来的id
            if (uId != null && uId != "" && uId != "null") {
                //如果修改id不为空就赋值修改id
                updateId = uId;
            }
            window.sessionStorage.removeItem('updateId');
            http("goodsOrderList/info/" + updateId, "GET", {}, (res) => {
                if(res.code == 0)
                {
                    ruleForm = res.data
                    // 是/否下拉框回显
                    setSelectOption();
                    // 设置图片src
                    showImg();
                    // 设置视频src
                    showVideo();
                    // 数据填充
                    dataBind();
                    // 富文本框回显
                    setContent();
                    //注册表单验证
                    $(validform());
                }

            });
        }
    }

    // 清除可能会重复渲染的selection
    function clear(className) {
        var elements = document.getElementsByClassName(className);
        for (var i = elements.length - 1; i >= 0; i--) {
            elements[i].parentNode.removeChild(elements[i]);
        }
    }

    function dateTimePick() {
    }


    function dataBind() {


    <!--  级联表的数据回显  -->
        goodsDataBind();
        goodsOrderDataBind();


    <!--  当前表的数据回显  -->
        $("#updateId").val(ruleForm.id);
        $("#goodsOrderId").val(ruleForm.goodsOrderId);
        $("#goodsId").val(ruleForm.goodsId);
        $("#goodsOrderListNumber").val(ruleForm.goodsOrderListNumber);

    }
    <!--  级联表的数据回显  -->
    function goodsDataBind(){

                    <!-- 把id赋值给当前表的id-->
        $("#goodsId").val(ruleForm.id);

        $("#goodsName").val(ruleForm.goodsName);
        $("#goodsValue").val(ruleForm.goodsValue);
        $("#goodsNumber").val(ruleForm.goodsNumber);
        $("#danwei").val(ruleForm.danwei);
        $("#danjia").val(ruleForm.danjia);
        $("#goodsContent").val(ruleForm.goodsContent);
        $("#flag").val(ruleForm.flag);
    }

    function goodsOrderDataBind(){

                    <!-- 把id赋值给当前表的id-->
        $("#goodsOrderId").val(ruleForm.id);

        $("#goodsOrderName").val(ruleForm.goodsOrderName);
        $("#caozuoName").val(ruleForm.caozuoName);
        $("#caozuoTable").val(ruleForm.caozuoTable);
        $("#goodsOrderValue").val(ruleForm.goodsOrderValue);
        $("#gongyingshangId").val(ruleForm.gongyingshangId);
        $("#fendianId").val(ruleForm.fendianId);
        var insertTimeDate = new Date();
        insertTimeDate.setTime(ruleForm.insertTime);
        $("#insertTime").val(insertTimeDate.toLocaleString());//把时间戳转换为日期带时分秒格式
    }


    //图片显示
    function showImg() {
        <!--  当前表的图片  -->

        <!--  级联表的图片  -->
        goodsShowImg();
        goodsOrderShowImg();
    }


    <!--  级联表的图片  -->

    function goodsShowImg() {
        $("#goodsPhotoImg").attr("src",ruleForm.goodsPhoto);
    }


    function goodsOrderShowImg() {
    }



    //视频回显
    function showVideo() {
    <!--  当前表的视频  -->

    <!--  级联表的视频  -->
        goodsShowVideo();
        goodsOrderShowVideo();
    }


    <!--  级联表的视频  -->

    function goodsShowVideo() {
        $("#goodsPhotoV").attr("src",ruleForm.goodsPhoto);
    }

    function goodsOrderShowVideo() {
    }



    $(document).ready(function () {
        //设置右上角用户名
        $('.dropdown-menu h5').html(window.sessionStorage.getItem('username'))
        //设置项目名
        $('.sidebar-header h3 a').html(projectName)
        //设置导航栏菜单
        setMenu();
        $('#exitBtn').on('click', function (e) {
            e.preventDefault();
            exit();
        });
        //初始化时间插件
        dateTimePick();
        //查询所有下拉框
            <!--  当前表的下拉框  -->
            <!-- 查询级联表的下拉框(用id做option,用名字及其他参数做名字级联修改) -->
            goodsSelect();
            goodsOrderSelect();



        // 初始化下拉框
            <!--  初始化当前表的下拉框  -->
            <!--  初始化级联表的下拉框  -->
            initializationgoodsSelect();
            initializationgoodsOrderSelect();

        $(".selectpicker" ).selectpicker('refresh');
        getDetails();
        //初始化上传按钮
        upload();
    <%@ include file="../../static/myInfo.js"%>
                $('#submitBtn').on('click', function (e) {
                    e.preventDefault();
                    //console.log("点击了...提交按钮");
                    submit();
                });
        readonly();
    });

    function readonly() {
        if (window.sessionStorage.getItem('role') != '管理员') {
            //$('#jifen').attr('readonly', 'readonly');
            //$('#role').attr('style', 'pointer-events: none;');
        }
    }

    //比较大小
    function compare() {
        var largerVal = null;
        var smallerVal = null;
        if (largerVal != null && smallerVal != null) {
            if (largerVal <= smallerVal) {
                alert(smallerName + '不能大于等于' + largerName);
                return false;
            }
        }
        return true;
    }


    // 用户登出
    <%@ include file="../../static/logout.jsp"%>
</script>
</body>

</html>