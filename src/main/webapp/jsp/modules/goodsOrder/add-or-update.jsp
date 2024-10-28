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
                    <h3 class="block-title">编辑采购调度表</h3>
                </div>
                <div class="col-md-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="${pageContext.request.contextPath}/index.jsp">
                                <span class="ti-home"></span>
                            </a>
                        </li>
                        <li class="breadcrumb-item">采购调度表管理</li>
                        <li class="breadcrumb-item active">编辑采购调度表</li>
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
                        <h3 class="widget-title">采购调度表信息</h3>
                        <form id="addOrUpdateForm">
                            <div class="form-row">
                            <!-- 级联表的字段 -->
                                    <div class="form-group col-md-6">
                                        <label>连锁店</label>
                                        <div>
                                            <select id="fendianSelect" name="fendianSelect"
                                                    class="selectpicker form-control"  data-live-search="true"
                                                    title="请选择" data-header="请选择" data-size="5">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>分店名</label>
                                        <input id="fendianName" name="fendianName" class="form-control"
                                               placeholder="分店名" readonly>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>分店等级</label>
                                        <input id="fendianValue" name="fendianValue" class="form-control"
                                               placeholder="分店等级" readonly>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>分店地址</label>
                                        <input id="fendianAddress" name="fendianAddress" class="form-control"
                                               placeholder="分店地址" readonly>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>供应商</label>
                                        <div>
                                            <select id="gongyingshangSelect" name="gongyingshangSelect"
                                                    class="selectpicker form-control"  data-live-search="true"
                                                    title="请选择" data-header="请选择" data-size="5">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>供应商姓名</label>
                                        <input id="gongyingshangName" name="gongyingshangName" class="form-control"
                                               placeholder="供应商姓名" readonly>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>供应商等级</label>
                                        <input id="gongyingshangValue" name="gongyingshangValue" class="form-control"
                                               placeholder="供应商等级" readonly>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>供应商信用等级</label>
                                        <input id="gongyingshangXinyongValue" name="gongyingshangXinyongValue" class="form-control"
                                               placeholder="供应商信用等级" readonly>
                                    </div>
                            <!-- 当前表的字段 -->
                                    <input id="updateId" name="id" type="hidden">
                                    <div class="form-group col-md-6">
                                        <label>订单名</label>
                                        <input id="goodsOrderName" name="goodsOrderName" class="form-control"
                                               placeholder="订单名">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>操作人姓名</label>
                                        <input id="caozuoName" name="caozuoName" class="form-control"
                                               placeholder="操作人姓名">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>操作人所在表名</label>
                                        <input id="caozuoTable" name="caozuoTable" class="form-control"
                                               placeholder="操作人所在表名">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>类型</label>
                                        <select id="goodsOrderTypesSelect" name="goodsOrderTypes" class="form-control">
                                        </select>
                                    </div>
                                <input id="gongyingshangId" name="gongyingshangId" type="hidden">
                                <input id="fendianId" name="fendianId" type="hidden">
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

    var tableName = "goodsOrder";
    var pageType = "add-or-update";
    var updateId = "";
    var crossTableId = -1;
    var crossTableName = '';
    var ruleForm = {};
    var crossRuleForm = {};


    // 下拉框数组
        <!-- 当前表的下拉框数组 -->
    var goodsOrderTypesOptions = [];
        <!-- 级联表的下拉框数组 -->
    var fendianOptions = [];
    var gongyingshangOptions = [];

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
           if($("#gongyingshangId") !=null){
               var gongyingshangId = $("#gongyingshangId").val();
               if(gongyingshangId == null || gongyingshangId =='' || gongyingshangId == 'null'){
                   alert("供应商不能为空");
                   return;
               }
           }
           if($("#fendianId") !=null){
               var fendianId = $("#fendianId").val();
               if(fendianId == null || fendianId =='' || fendianId == 'null'){
                   alert("分店不能为空");
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
            httpJson("goodsOrder/" + urlParam, "POST", data, (res) => {
                if(res.code == 0){
                    window.sessionStorage.removeItem('addgoodsOrder');
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
        function goodsOrderTypesSelect() {
            //填充下拉框选项
            http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=goods_order_types", "GET", {}, (res) => {
                if(res.code == 0){
                    goodsOrderTypesOptions = res.data.list;
                }
            });
        }
        <!-- 查询级联表的所有列表 -->
        function fendianSelect() {
            //填充下拉框选项
            http("fendian/page?page=1&limit=100&sort=&order=", "GET", {}, (res) => {
                if(res.code == 0){
                    fendianOptions = res.data.list;
                }
            });
        }

        function fendianSelectOne(id) {
            http("fendian/info/"+id, "GET", {}, (res) => {
                if(res.code == 0){
                ruleForm = res.data;
                fendianShowImg();
                fendianShowVideo();
                fendianDataBind();
            }
        });
        }
        function gongyingshangSelect() {
            //填充下拉框选项
            http("gongyingshang/page?page=1&limit=100&sort=&order=", "GET", {}, (res) => {
                if(res.code == 0){
                    gongyingshangOptions = res.data.list;
                }
            });
        }

        function gongyingshangSelectOne(id) {
            http("gongyingshang/info/"+id, "GET", {}, (res) => {
                if(res.code == 0){
                ruleForm = res.data;
                gongyingshangShowImg();
                gongyingshangShowVideo();
                gongyingshangDataBind();
            }
        });
        }



    // 初始化下拉框
    <!-- 初始化当前表的下拉框 -->
        function initializationGoodsordertypesSelect(){
            var goodsOrderTypesSelect = document.getElementById('goodsOrderTypesSelect');
            if(goodsOrderTypesSelect != null && goodsOrderTypesOptions != null  && goodsOrderTypesOptions.length > 0 ){
                for (var i = 0; i < goodsOrderTypesOptions.length; i++) {
                    goodsOrderTypesSelect.add(new Option(goodsOrderTypesOptions[i].indexName,goodsOrderTypesOptions[i].codeIndex));
                }
            }
        }

        function initializationfendianSelect() {
            var fendianSelect = document.getElementById('fendianSelect');
            if(fendianSelect != null && fendianOptions != null  && fendianOptions.length > 0 ) {
                for (var i = 0; i < fendianOptions.length; i++) {
                        fendianSelect.add(new Option(fendianOptions[i].fendianName, fendianOptions[i].id));
                }

                $("#fendianSelect").change(function(e) {
                        fendianSelectOne(e.target.value);
                });
            }

        }

        function initializationgongyingshangSelect() {
            var gongyingshangSelect = document.getElementById('gongyingshangSelect');
            if(gongyingshangSelect != null && gongyingshangOptions != null  && gongyingshangOptions.length > 0 ) {
                for (var i = 0; i < gongyingshangOptions.length; i++) {
                        gongyingshangSelect.add(new Option(gongyingshangOptions[i].gongyingshangName, gongyingshangOptions[i].id));
                }

                $("#gongyingshangSelect").change(function(e) {
                        gongyingshangSelectOne(e.target.value);
                });
            }

        }



    // 下拉框选项回显
    function setSelectOption() {

        <!-- 当前表的下拉框回显 -->

        var goodsOrderTypesSelect = document.getElementById("goodsOrderTypesSelect");
        if(goodsOrderTypesSelect != null && goodsOrderTypesOptions != null  && goodsOrderTypesOptions.length > 0 ) {
            for (var i = 0; i < goodsOrderTypesOptions.length; i++) {
                if (goodsOrderTypesOptions[i].codeIndex == ruleForm.goodsOrderTypes) {//下拉框value对比,如果一致就赋值汉字
                        goodsOrderTypesSelect.options[i].selected = true;
                }
            }
        }
        <!--  级联表的下拉框回显  -->
            var fendianSelect = document.getElementById("fendianSelect");
            if(fendianSelect != null && fendianOptions != null  && fendianOptions.length > 0 ) {
                for (var i = 0; i < fendianOptions.length; i++) {
                    if (fendianOptions[i].id == ruleForm.fendianId) {//下拉框value对比,如果一致就赋值汉字
                        fendianSelect.options[i+1].selected = true;
                        $("#fendianSelect" ).selectpicker('refresh');
                    }
                }
            }
            var gongyingshangSelect = document.getElementById("gongyingshangSelect");
            if(gongyingshangSelect != null && gongyingshangOptions != null  && gongyingshangOptions.length > 0 ) {
                for (var i = 0; i < gongyingshangOptions.length; i++) {
                    if (gongyingshangOptions[i].id == ruleForm.gongyingshangId) {//下拉框value对比,如果一致就赋值汉字
                        gongyingshangSelect.options[i+1].selected = true;
                        $("#gongyingshangSelect" ).selectpicker('refresh');
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

    function exit() {
        window.sessionStorage.removeItem("updateId");
        window.sessionStorage.removeItem('addgoodsOrder');
        window.location.href = "list.jsp";
    }
    // 表单校验
    function validform() {
        return $("#addOrUpdateForm").validate({
            rules: {
                goodsOrderName: "required",
                caozuoName: "required",
                caozuoTable: "required",
                goodsOrderTypes: "required",
                gongyingshangId: "required",
                fendianId: "required",
                insertTime: "required",
            },
            messages: {
                goodsOrderName: "订单名不能为空",
                caozuoName: "操作人姓名不能为空",
                caozuoTable: "操作人所在表名不能为空",
                goodsOrderTypes: "类型不能为空",
                gongyingshangId: "供应商不能为空",
                fendianId: "分店不能为空",
                insertTime: "采购调度时间不能为空",
            }
        }).form();
    }

    // 获取当前详情
    function getDetails() {
        var addgoodsOrder = window.sessionStorage.getItem("addgoodsOrder");
        if (addgoodsOrder != null && addgoodsOrder != "" && addgoodsOrder != "null") {
            window.sessionStorage.removeItem('addgoodsOrder');
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
            http("goodsOrder/info/" + updateId, "GET", {}, (res) => {
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
            laydate.render({
                elem: '#insertTime-input'
                ,type: 'datetime'
            });
    }


    function dataBind() {


    <!--  级联表的数据回显  -->
        fendianDataBind();
        gongyingshangDataBind();


    <!--  当前表的数据回显  -->
        $("#updateId").val(ruleForm.id);
        $("#goodsOrderName").val(ruleForm.goodsOrderName);
        $("#caozuoName").val(ruleForm.caozuoName);
        $("#caozuoTable").val(ruleForm.caozuoTable);
        $("#gongyingshangId").val(ruleForm.gongyingshangId);
        $("#fendianId").val(ruleForm.fendianId);
        $("#insertTime-input").val(ruleForm.insertTime);

    }
    <!--  级联表的数据回显  -->
    function fendianDataBind(){

                    <!-- 把id赋值给当前表的id-->
        $("#fendianId").val(ruleForm.id);

        $("#fendianName").val(ruleForm.fendianName);
        $("#fendianValue").val(ruleForm.fendianValue);
        $("#fendianAddress").val(ruleForm.fendianAddress);
        $("#fendianContent").val(ruleForm.fendianContent);
    }

    function gongyingshangDataBind(){

                    <!-- 把id赋值给当前表的id-->
        $("#gongyingshangId").val(ruleForm.id);

        $("#gongyingshangName").val(ruleForm.gongyingshangName);
        $("#gongyingshangContent").val(ruleForm.gongyingshangContent);
        $("#gongyingshangValue").val(ruleForm.gongyingshangValue);
        $("#gongyingshangXinyongValue").val(ruleForm.gongyingshangXinyongValue);
    }


    //图片显示
    function showImg() {
        <!--  当前表的图片  -->

        <!--  级联表的图片  -->
        fendianShowImg();
        gongyingshangShowImg();
    }


    <!--  级联表的图片  -->

    function fendianShowImg() {
    }


    function gongyingshangShowImg() {
    }



    //视频回显
    function showVideo() {
    <!--  当前表的视频  -->

    <!--  级联表的视频  -->
        fendianShowVideo();
        gongyingshangShowVideo();
    }


    <!--  级联表的视频  -->

    function fendianShowVideo() {
    }

    function gongyingshangShowVideo() {
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
            goodsOrderTypesSelect();
            <!-- 查询级联表的下拉框(用id做option,用名字及其他参数做名字级联修改) -->
            fendianSelect();
            gongyingshangSelect();



        // 初始化下拉框
            <!--  初始化当前表的下拉框  -->
            initializationGoodsordertypesSelect();
            <!--  初始化级联表的下拉框  -->
            initializationfendianSelect();
            initializationgongyingshangSelect();

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