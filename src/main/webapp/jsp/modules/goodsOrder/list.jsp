<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">



<head>
    <%@ include file="../../static/head.jsp" %>
    <!-- font-awesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">


    <link href="${pageContext.request.contextPath}/resources/css/bootstrap-select.css" rel="stylesheet">
    <!-- layui -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/resources/layui/layui.js"></script>
</head>
<style>

</style>
<body>


    <%--  新增采购 新增调度 --%>
    <div class="modal fade" id="goodsOrderListModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <%-- 模态框标题--%>
                <div class="modal-header">
                    <h5 class="modal-title" id="goodsOrderListModalTitle">列表</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <%-- 模态框内容 --%>
                <div class="modal-body">
                    <div class="col-sm-12">
                        <%-- 当前表 --%>
                        <label class="col-sm-10 aaaaaa">
                            供应商
                            <select id="gongyingshangSelect" name="gongyingshangSelect"
                                    class="selectpicker form-control"  data-live-search="true"
                                    title="请选择" data-header="请选择" data-size="5">
                            </select>
                        </label>
                        <label class="col-sm-10 bbbbbb">
                            分店
                            <select id="fendianSelect" name="fendianSelect"
                                    class="selectpicker form-control"  data-live-search="true"
                                    title="请选择" data-header="请选择" data-size="5">
                            </select>
                        </label>
                         <%--详情表 --%>
                        <label class="col-sm-10">
                            物资表
                            <select id="goodsSelect" name="goodsSelect"
                                    class="selectpicker form-control"  data-live-search="true"
                                    title="请选择" data-header="请选择" data-size="5">
                            </select>
                        </label>
                        <input type="hidden" id="goodsOrderListFlag">
                        <label class="col-sm-1">
                            <button onclick="addGoodsOrderList()" type="button" class="btn btn-success 新增">添加</button>
                        </label>
                    </div>
                    <label class="col-sm-5">
                        订单名:<input type="text" id="goodsOrderName" class="form-control" placeholder="订单名">
                    </label>
                    <%-- 列表 --%>
                    <table id="goodsOrderTable" class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th >物品名字</th>
                            <th >物品种类</th>
                            <th >物资数量</th>
                            <th >单位</th>
                            <th >单价</th>
                            <%--<th >是否删除</th>--%>
                            <th >操作数量</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="goodsOrderListTableTbody">
                        </tbody>
                    </table>
                </div>
                <%-- 模态框按钮 --%>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" onclick="submitGoodsOrderList()" class="btn btn-primary">提交</button>
                </div>
            </div>
        </div>
    </div>


    <%--  列表查看 --%>
    <div class="modal fade" id="showGoodsOrderListModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <%-- 模态框标题--%>
                <div class="modal-header">
                    <h5 class="modal-title" id="modal-list-title">查看列表</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <%-- 模态框内容 --%>
                <div class="modal-body">
                    <div class="col-sm-12">
                        <%-- 当前表 --%>
                        <label class="col-sm-5">
                            供应商姓名
                            <input id="gongyingshangName" name="gongyingshangName" class="form-control"
                                   placeholder="供应商姓名" readonly>
                        </label>
                        <label class="col-sm-5">
                            分店名
                            <input id="fendianName" name="fendianName" class="form-control"
                                   placeholder="分店名" readonly>
                        </label>
                        <%-- 详情表 --%>
                        <%--<label class="col-sm-10">
                            采购调度详情表
                            <select id="goodsSelect" name="goodsSelect"
                                    class="selectpicker form-control"  data-live-search="true"
                                    title="请选择" data-header="请选择" data-size="5">
                            </select>
                        </label>
                        <label class="col-sm-1">
                            <button onclick="addShowGoodsOrderList()" type="button" class="btn btn-success 新增">添加</button>
                        </label>--%>
                    </div>
                    <table id="inOutTableList" class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th >物品名字</th>
                            <th >物品种类</th>
                            <th >物资数量</th>
                            <th >单位</th>
                            <th >单价</th>
                            <%--<th >是否删除</th>--%>
                            <th >操作数量</th>
                            <%--<th >操作</th>--%>
                        </tr>
                        </thead>
                        <tbody id="showGoodsOrderListTableTbody">
                        </tbody>
                    </table>
                </div>
                <%-- 模态框按钮 --%>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <%--<button type="button" onclick="submitInOutGoods()" class="btn btn-primary">提交</button>--%>
                </div>
            </div>
        </div>
    </div>



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
                        <h3 class="block-title">采购调度表管理</h3>
                    </div>
                    <div class="col-md-6">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="${pageContext.request.contextPath}/index.jsp">
                                    <span class="ti-home"></span>
                                </a>
                            </li>
                            <li class="breadcrumb-item">采购调度表管理</li>
                            <li class="breadcrumb-item active">采购调度表列表</li>
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
                            <h3 class="widget-title">采购调度表列表</h3>
                            <div class="table-responsive mb-3">
                                <div class="col-sm-12">
                                                                         
                                    <div class="layui-inline" style="margin-bottom: 10px;">
                                        订单名
                                        <div class="layui-input-inline">
                                            <input type="text" id="goodsOrderNameSearch" style="width: 140px;" class="form-control form-control-sm"
                                                   placeholder="订单名" aria-controls="tableId">
                                        </div>
                                    </div>
                                                                         
                                    <div class="layui-inline" style="margin-bottom: 10px;">
                                        类型
                                        <div class="layui-input-inline">
                                            <select name="goodsOrderTypesSelectSearch"  style="width: 150px;" id="goodsOrderTypesSelectSearch" class="form-control form-control-sm"
                                                    aria-controls="tableId">
                                            </select>
                                        </div>
                                    </div>
                                                                                                                                                
                                                                                                         
                                    <div class="layui-inline" style="margin-bottom: 10px;">
                                        分店名
                                        <div class="layui-input-inline">
                                            <input type="text" id="fendianNameSearch" style="width: 140px;" class="form-control form-control-sm"
                                                   placeholder="分店名" aria-controls="tableId">
                                        </div>
                                    </div>
                                    <div class="layui-inline" style="margin-bottom: 10px;">
                                        供应商姓名
                                        <div class="layui-input-inline">
                                            <input type="text" id="gongyingshangNameSearch" style="width: 140px;" class="form-control form-control-sm"
                                                   placeholder="供应商姓名" aria-controls="tableId">
                                        </div>
                                    </div>
                                                    
                                    <div class="layui-inline" style="margin-left: 30px;margin-bottom: 10px;">
                                        <button onclick="search()" type="button" class="btn btn-primary">查询</button>
                                        <%--<button onclick="add()" type="button" class="btn btn-success 新增">添加</button>--%>
                                        <button onclick="inGoodsOrderList()" type="button" class="btn btn-success 新增">采购</button>
                                        <button onclick="outGoodsOrderList()" type="button" class="btn btn-success 新增">调度</button>
                                        <%--<button onclick="graph()" type="button" class="btn btn-success 报表">报表</button>--%>
                                        <button onclick="deleteMore()" type="button" class="btn btn-danger 删除">批量删除</button>
                                    </div>
                                </div>
                                <table id="tableId" class="table table-bordered table-striped">
                                    <thead>
                                    <tr>
                                        <th class="no-sort" style="min-width: 35px;">
                                            <div class="custom-control custom-checkbox">
                                                <input class="custom-control-input" type="checkbox" id="select-all"
                                                       onclick="chooseAll()">
                                                <label class="custom-control-label" for="select-all"></label>
                                            </div>
                                        </th>

                                        <th >分店名</th>
                                        <th >供应商姓名</th>
                                        <th >订单名</th>
                                        <th >类型</th>
                                        <th >采购调度时间</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody id="thisTbody">
                                    </tbody>
                                </table>
                                <div class="col-md-6 col-sm-3">
                                    <div class="dataTables_length" id="tableId_length">

                                        <select name="tableId_length" aria-controls="tableId" id="selectPageSize"
                                                onchange="changePageSize()">
                                            <option value="10">10</option>
                                            <option value="25">25</option>
                                            <option value="50">50</option>
                                            <option value="100">100</option>
                                        </select>
                                        条 每页

                                    </div>
                                </div>
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination justify-content-end">
                                        <li class="page-item" id="tableId_previous" onclick="pageNumChange('pre')">
                                            <a class="page-link" href="#" tabindex="-1">上一页</a>
                                        </li>

                                        <li class="page-item" id="tableId_next" onclick="pageNumChange('next')">
                                            <a class="page-link" href="#">下一页</a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
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
    <script language="javascript" type="text/javascript"
            src="${pageContext.request.contextPath}/resources/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/js/bootstrap-select.js"></script>
    <script>

        <%@ include file="../../utils/menu.jsp"%>
        <%@ include file="../../static/setMenu.js"%>
        <%@ include file="../../utils/baseUrl.jsp"%>
        <%@ include file="../../static/getRoleButtons.js"%>
        <%@ include file="../../static/crossBtnControl.js"%>
        var tableName = "goodsOrder";
        var pageType = "list";
        var searchForm = {key: ""};
        var pageIndex = 1;
        var pageSize = 10;
        var totalPage = 0;
        var dataList = [];
        var sortColumn = '';
        var sortOrder = '';
        var ids = [];
        var checkAll = false;

        var id = null;//查看详情中的订单id
// 当前表关联
        var gongyingshangOptions = [];
        var gongyingshang = null;
        var fendianOptions = [];
        var fendian = null;
        // 详情表的关联
        var goodsOptions = [];
        var goods = null;



        <!-- 级联表的级联字典表 -->
        var fendianTypesOptions = [];
        var gongyingshangTypesOptions = [];
        var gongyingshangXinyongTypesOptions = [];

        <!-- 本表的级联字段表 -->
        var goodsOrderTypesOptions = [];

        function init() {
            // 满足条件渲染提醒接口
        }

        // 改变每页记录条数
        function changePageSize() {
            var selection = document.getElementById('selectPageSize');
            var index = selection.selectedIndex;
            pageSize = selection.options[index].value;
            getDataList();
        }



        // 查询
        function search() {
            searchForm = {key: ""};

        <!-- 级联表的级联字典表 -->
                                         
                            //分店名
            var fendianNameSearchInput = $('#fendianNameSearch');
            if( fendianNameSearchInput != null){
                if (fendianNameSearchInput.val() != null && fendianNameSearchInput.val() != '') {
                    searchForm.fendianName = $('#fendianNameSearch').val();
                }
            }
                     
            var fendianTypesSelectSearchInput = document.getElementById("fendianTypesSelectSearch");
            if(fendianTypesSelectSearchInput != null){
                var fendianTypesIndex = fendianTypesSelectSearchInput.selectedIndex;
                if( fendianTypesIndex  != 0){
                    searchForm.fendianTypes = document.getElementById("fendianTypesSelectSearch").options[fendianTypesIndex].value;
                }
            }
                     
                            //分店地址
            var fendianAddressSearchInput = $('#fendianAddressSearch');
            if( fendianAddressSearchInput != null){
                if (fendianAddressSearchInput.val() != null && fendianAddressSearchInput.val() != '') {
                    searchForm.fendianAddress = $('#fendianAddressSearch').val();
                }
            }
                                                                                 
                            //供应商姓名
            var gongyingshangNameSearchInput = $('#gongyingshangNameSearch');
            if( gongyingshangNameSearchInput != null){
                if (gongyingshangNameSearchInput.val() != null && gongyingshangNameSearchInput.val() != '') {
                    searchForm.gongyingshangName = $('#gongyingshangNameSearch').val();
                }
            }
                                         
            var gongyingshangTypesSelectSearchInput = document.getElementById("gongyingshangTypesSelectSearch");
            if(gongyingshangTypesSelectSearchInput != null){
                var gongyingshangTypesIndex = gongyingshangTypesSelectSearchInput.selectedIndex;
                if( gongyingshangTypesIndex  != 0){
                    searchForm.gongyingshangTypes = document.getElementById("gongyingshangTypesSelectSearch").options[gongyingshangTypesIndex].value;
                }
            }
                     
            var gongyingshangXinyongTypesSelectSearchInput = document.getElementById("gongyingshangXinyongTypesSelectSearch");
            if(gongyingshangXinyongTypesSelectSearchInput != null){
                var gongyingshangXinyongTypesIndex = gongyingshangXinyongTypesSelectSearchInput.selectedIndex;
                if( gongyingshangXinyongTypesIndex  != 0){
                    searchForm.gongyingshangXinyongTypes = document.getElementById("gongyingshangXinyongTypesSelectSearch").options[gongyingshangXinyongTypesIndex].value;
                }
            }
                        <!-- 本表的查询条件 -->

         
            //订单名
            var goodsOrderNameSearchInput = $('#goodsOrderNameSearch');
            if( goodsOrderNameSearchInput != null){
                if (goodsOrderNameSearchInput.val() != null && goodsOrderNameSearchInput.val() != '') {
                    searchForm.goodsOrderName = $('#goodsOrderNameSearch').val();
                }
            }
     
            //操作人姓名
            var caozuoNameSearchInput = $('#caozuoNameSearch');
            if( caozuoNameSearchInput != null){
                if (caozuoNameSearchInput.val() != null && caozuoNameSearchInput.val() != '') {
                    searchForm.caozuoName = $('#caozuoNameSearch').val();
                }
            }
         
                //类型
            var goodsOrderTypesSelectSearchInput = document.getElementById("goodsOrderTypesSelectSearch");
            if(goodsOrderTypesSelectSearchInput != null){
                var goodsOrderTypesIndex = goodsOrderTypesSelectSearchInput.selectedIndex;
                if( goodsOrderTypesIndex  != 0){
                    searchForm.goodsOrderTypes= document.getElementById("goodsOrderTypesSelectSearch").options[goodsOrderTypesIndex].value;
                }
            }
                            getDataList();
        }

        // 获取数据列表
        function getDataList() {
            http("goodsOrder/page", "GET", {
                page: pageIndex,
                limit: pageSize,
                sort: sortColumn,
                order: sortOrder,
                //本表的
                goodsOrderName: searchForm.goodsOrderName,
                caozuoName: searchForm.caozuoName,
                goodsOrderTypes: searchForm.goodsOrderTypes,
            //级联表的
                fendianName: searchForm.fendianName,
                fendianTypes: searchForm.fendianTypes,
                fendianAddress: searchForm.fendianAddress,

                gongyingshangName: searchForm.gongyingshangName,
                gongyingshangTypes: searchForm.gongyingshangTypes,
                gongyingshangXinyongTypes: searchForm.gongyingshangXinyongTypes,


            }, (res) => {
                if(res.code == 0) {
                    clear();
                    $("#thisTbody").html("");
                    dataList = res.data.list;
                    totalPage = res.data.totalPage;
                    for (var i = 0; i < dataList.length; i++) { //遍历一下表格数据  
                        var trow = setDataRow(dataList[i], i); //定义一个方法,返回tr数据 
                        $('#thisTbody').append(trow);
                    }
                    pagination(); //渲染翻页组件
                    getRoleButtons();// 权限按钮控制
                }
            });
        }

        // 渲染表格数据
        function setDataRow(item, number) {
            //创建行 
            var row = document.createElement('tr');
            row.setAttribute('class', 'useOnce');
            //创建勾选框
            var checkbox = document.createElement('td');
            var checkboxDiv = document.createElement('div');
            checkboxDiv.setAttribute("class", "custom-control custom-checkbox");
            var checkboxInput = document.createElement('input');
            checkboxInput.setAttribute("class", "custom-control-input");
            checkboxInput.setAttribute("type", "checkbox");
            checkboxInput.setAttribute('name', 'chk');
            checkboxInput.setAttribute('value', item.id);
            checkboxInput.setAttribute("id", number);
            checkboxDiv.appendChild(checkboxInput);
            var checkboxLabel = document.createElement('label');
            checkboxLabel.setAttribute("class", "custom-control-label");
            checkboxLabel.setAttribute("for", number);
            checkboxDiv.appendChild(checkboxLabel);
            checkbox.appendChild(checkboxDiv);
            row.appendChild(checkbox)


                    //分店名
            var fendianNameCell = document.createElement('td');
            fendianNameCell.innerHTML = item.fendianName;
            row.appendChild(fendianNameCell);



                    //供应商姓名
            var gongyingshangNameCell = document.createElement('td');
            gongyingshangNameCell.innerHTML = item.gongyingshangName;
            row.appendChild(gongyingshangNameCell);


            //订单名
            var goodsOrderNameCell = document.createElement('td');
            goodsOrderNameCell.innerHTML = item.goodsOrderName;
            row.appendChild(goodsOrderNameCell);

            //类型
            var goodsOrderTypesCell = document.createElement('td');
            goodsOrderTypesCell.innerHTML = item.goodsOrderValue;
            row.appendChild(goodsOrderTypesCell);


            //采购调度时间
            var insertTimeCell = document.createElement('td');
            insertTimeCell.innerHTML = item.insertTime;
            row.appendChild(insertTimeCell);



            //每行按钮
            var btnGroup = document.createElement('td');

            // //详情按钮
            // var detailBtn = document.createElement('button');
            // var detailAttr = "detail(" + item.id + ')';
            // detailBtn.setAttribute("type", "button");
            // detailBtn.setAttribute("class", "btn btn-info btn-sm 查看");
            // detailBtn.setAttribute("onclick", detailAttr);
            // detailBtn.innerHTML = "查看";
            // btnGroup.appendChild(detailBtn);
            //修改按钮
            var editBtn = document.createElement('button');
            var editAttr = 'edit(' + item.id + ')';
            editBtn.setAttribute("type", "button");
            editBtn.setAttribute("class", "btn btn-warning btn-sm 修改");
            editBtn.setAttribute("onclick", editAttr);
            editBtn.innerHTML = "修改";
            btnGroup.appendChild(editBtn);
            //查看订单详情
            var detailListBtn = document.createElement('button');
            var detailListAttr = "getId(" + item.id+')';
            detailListBtn.setAttribute("type", "button");
            detailListBtn.setAttribute("class", "btn btn-info btn-sm 新增");
            detailListBtn.setAttribute("onclick", detailListAttr);
            detailListBtn.innerHTML = "查看列表详情";
            btnGroup.appendChild(detailListBtn);

            //删除按钮
            var deleteBtn = document.createElement('button');
            var deleteAttr = 'remove(' + item.id + ')';
            deleteBtn.setAttribute("type", "button");
            deleteBtn.setAttribute("class", "btn btn-danger btn-sm 删除");
            deleteBtn.setAttribute("onclick", deleteAttr);
            deleteBtn.innerHTML = "删除";
            btnGroup.appendChild(deleteBtn);
            row.appendChild(btnGroup);

            return row;
    }


        // 翻页
        function pageNumChange(val) {
            if (val == 'pre') {
                pageIndex--;
            } else if (val == 'next') {
                pageIndex++;
            } else {
                pageIndex = val;
            }
            getDataList();
        }

        // 下载
        function download(url) {
            window.open(url);
        }
        // 打开新窗口播放媒体
        function mediaPlay(url){
            window.open(url);
        }

        // 渲染翻页组件
        function pagination() {
            var beginIndex = pageIndex;
            var endIndex = pageIndex;
            var point = 4;
            //计算页码
            for (var i = 0; i < 3; i++) {
                if (endIndex == totalPage) {
                    break;
                }
                endIndex++;
                point--;
            }
            for (var i = 0; i < 3; i++) {
                if (beginIndex == 1) {
                    break;
                }
                beginIndex--;
                point--;
            }
            if (point > 0) {
                while (point > 0) {
                    if (endIndex == totalPage) {
                        break;
                    }
                    endIndex++;
                    point--;
                }
                while (point > 0) {
                    if (beginIndex == 1) {
                        break;
                    }
                    beginIndex--;
                    point--
                }
            }
            // 是否显示 前一页 按钮
            if (pageIndex > 1) {
                $('#tableId_previous').show();
            } else {
                $('#tableId_previous').hide();
            }
            // 渲染页码按钮
            for (var i = beginIndex; i <= endIndex; i++) {
                var pageNum = document.createElement('li');
                pageNum.setAttribute('onclick', "pageNumChange(" + i + ")");
                if (pageIndex == i) {
                    pageNum.setAttribute('class', 'paginate_button page-item active useOnce');
                } else {
                    pageNum.setAttribute('class', 'paginate_button page-item useOnce');
                }
                var pageHref = document.createElement('a');
                pageHref.setAttribute('class', 'page-link');
                pageHref.setAttribute('href', '#');
                pageHref.setAttribute('aria-controls', 'tableId');
                pageHref.setAttribute('data-dt-idx', i);
                pageHref.setAttribute('tabindex', 0);
                pageHref.innerHTML = i;
                pageNum.appendChild(pageHref);
                $('#tableId_next').before(pageNum);
            }
            // 是否显示 下一页 按钮
            if (pageIndex < totalPage) {
                $('#tableId_next').show();
                $('#tableId_next a').attr('data-dt-idx', endIndex + 1);
            } else {
                $('#tableId_next').hide();
            }
            var pageNumInfo = "当前第 " + pageIndex + " 页，共 " + totalPage + " 页";
            $('#tableId_info').html(pageNumInfo);
        }

        // 跳转到指定页
        function toThatPage() {
            //var index = document.getElementById('pageIndexInput').value;
            if (index < 0 || index > totalPage) {
                alert('请输入正确的页码');
            } else {
                pageNumChange(index);
            }
        }

        // 全选/全不选
        function chooseAll() {
            checkAll = !checkAll;
            var boxs = document.getElementsByName("chk");
            for (var i = 0; i < boxs.length; i++) {
                boxs[i].checked = checkAll;
            }
        }

        // 批量删除
        function deleteMore() {
            ids = []
            var boxs = document.getElementsByName("chk");
            for (var i = 0; i < boxs.length; i++) {
                if (boxs[i].checked) {
                    ids.push(boxs[i].value)
                }
            }
            if (ids.length == 0) {
                alert('请勾选要删除的记录');
            } else {
                remove(ids);
            }
        }

        // 删除
        function remove(id) {
            var mymessage = confirm("真的要删除吗？");
            if (mymessage == true) {
                var paramArray = [];
                if (id == ids) {
                    paramArray = id;
                } else {
                    paramArray.push(id);
                }
                httpJson("goodsOrder/delete", "POST", paramArray, (res) => {
                    if(res.code == 0){
                        getDataList();
                        alert('删除成功');
                    }
                });
            } else {
                alert("已取消操作");
            }
        }

        // 用户登出
        <%@ include file="../../static/logout.jsp"%>

        //修改
        function edit(id) {
            window.sessionStorage.setItem('updateId', id)
            window.location.href = "add-or-update.jsp"
        }

        //清除会重复渲染的节点
        function clear() {
            var elements = document.getElementsByClassName('useOnce');
            for (var i = elements.length - 1; i >= 0; i--) {
                elements[i].parentNode.removeChild(elements[i]);
            }
        }

        //添加
        function add() {
            window.sessionStorage.setItem("addgoodsOrder", "addgoodsOrder");
            window.location.href = "add-or-update.jsp"
        }

        //报表
        function graph() {
            window.location.href = "graph.jsp"
        }

        // 查看详情
        function detail(id) {
            window.sessionStorage.setItem("updateId", id);
            window.location.href = "info.jsp";
        }

    //填充级联表搜索下拉框
                                         
                     
            function fendianTypesSelectSearch() {
                var fendianTypesSelectSearch = document.getElementById('fendianTypesSelectSearch');
                if(fendianTypesSelectSearch != null) {
                    fendianTypesSelectSearch.add(new Option('-请选择-',''));
                    if (fendianTypesOptions != null && fendianTypesOptions.length > 0){
                        for (var i = 0; i < fendianTypesOptions.length; i++) {
                                fendianTypesSelectSearch.add(new Option(fendianTypesOptions[i].indexName, fendianTypesOptions[i].codeIndex));
                        }
                    }
                }
            }
                     
                                                                                 
                                         
            function gongyingshangTypesSelectSearch() {
                var gongyingshangTypesSelectSearch = document.getElementById('gongyingshangTypesSelectSearch');
                if(gongyingshangTypesSelectSearch != null) {
                    gongyingshangTypesSelectSearch.add(new Option('-请选择-',''));
                    if (gongyingshangTypesOptions != null && gongyingshangTypesOptions.length > 0){
                        for (var i = 0; i < gongyingshangTypesOptions.length; i++) {
                                gongyingshangTypesSelectSearch.add(new Option(gongyingshangTypesOptions[i].indexName, gongyingshangTypesOptions[i].codeIndex));
                        }
                    }
                }
            }
                     
            function gongyingshangXinyongTypesSelectSearch() {
                var gongyingshangXinyongTypesSelectSearch = document.getElementById('gongyingshangXinyongTypesSelectSearch');
                if(gongyingshangXinyongTypesSelectSearch != null) {
                    gongyingshangXinyongTypesSelectSearch.add(new Option('-请选择-',''));
                    if (gongyingshangXinyongTypesOptions != null && gongyingshangXinyongTypesOptions.length > 0){
                        for (var i = 0; i < gongyingshangXinyongTypesOptions.length; i++) {
                                gongyingshangXinyongTypesSelectSearch.add(new Option(gongyingshangXinyongTypesOptions[i].indexName, gongyingshangXinyongTypesOptions[i].codeIndex));
                        }
                    }
                }
            }
                    
    //填充本表搜索下拉框
         
     
         
            function goodsOrderTypesSelectSearch() {
                var goodsOrderTypesSelectSearch = document.getElementById('goodsOrderTypesSelectSearch');
                if(goodsOrderTypesSelectSearch != null) {
                    goodsOrderTypesSelectSearch.add(new Option('-请选择-',''));
                    if (goodsOrderTypesOptions != null && goodsOrderTypesOptions.length > 0){
                        for (var i = 0; i < goodsOrderTypesOptions.length; i++) {
                                goodsOrderTypesSelectSearch.add(new Option(goodsOrderTypesOptions[i].indexName,goodsOrderTypesOptions[i].codeIndex));
                        }
                    }
                }
            }
                
    //查询级联表搜索条件所有列表
            function fendianTypesSelect() {
                //填充下拉框选项
                http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=fendian_types", "GET", {}, (res) => {
                    if(res.code == 0){
                        fendianTypesOptions = res.data.list;
                    }
                });
            }
            function gongyingshangTypesSelect() {
                //填充下拉框选项
                http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=gongyingshang_types", "GET", {}, (res) => {
                    if(res.code == 0){
                        gongyingshangTypesOptions = res.data.list;
                    }
                });
            }
            function gongyingshangXinyongTypesSelect() {
                //填充下拉框选项
                http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=gongyingshang_xinyong_types", "GET", {}, (res) => {
                    if(res.code == 0){
                        gongyingshangXinyongTypesOptions = res.data.list;
                    }
                });
            }

    //查询当前表搜索条件所有列表
            function goodsOrderTypesSelect() {
                //填充下拉框选项
                http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=goods_order_types", "GET", {}, (res) => {
                    if(res.code == 0){
                        goodsOrderTypesOptions = res.data.list;
                    }
                });
            }











        // 新增采购 新增调度

        //调度
        function outGoodsOrderList() {
            document.getElementById("goodsOrderListModalTitle").innerHTML = "调度列表";
            $("#goodsOrderListFlag").val(2);
            $(".aaaaaa").attr("style","display:none;");
            $(".bbbbbb").removeAttr("style");
            $('#goodsOrderListModal').modal('show');
        }
        //采购
        function inGoodsOrderList() {
            document.getElementById("goodsOrderListModalTitle").innerHTML = "采购列表";
            $("#goodsOrderListFlag").val(1);
            $(".bbbbbb").attr("style","display:none;");
            $(".aaaaaa").removeAttr("style");
            $('#goodsOrderListModal').modal('show');

        }

        // 模态框打开
        $('#goodsOrderListModal').on('show.bs.modal', function () {

            // 当前表
            gongyingshangSelect();
            initializationGongyingshangSelect();
            fendianSelect();
            initializationFendianSelect();
            // 详情表
            goodsSelect();
            initializationGoodsSelect();
            $(".selectpicker" ).selectpicker('refresh');
        });
        // 模态框关闭
        $('#goodsOrderListModal').on('hide.bs.modal', function () {
            $("#goodsOrderListModalTitle").val("")
            $("#goodsOrderListFlag").val(0);
            $("#goodsOrderName").val("");
            $("#goodsOrderListTableTbody").html("");
            // 当前表
            $("#gongyingshangSelect").empty();
            $("#fendianSelect").empty();
            // 详情表
            $("#goodsSelect").empty();
            $(".selectpicker" ).selectpicker('refresh');
        });

        // 当前表
            // 模态框的 供应商初始化和查询
        function gongyingshangSelect() {
            http("gongyingshang/page?page=1&limit=100&sort=&order=", "GET", {}, (res) => {
                if(res.code == 0){
                    gongyingshangOptions = res.data.list;
                }
            });
        }
        function initializationGongyingshangSelect() {
            var gongyingshangSelect = document.getElementById('gongyingshangSelect');
            if(gongyingshangSelect != null && gongyingshangOptions != null  && gongyingshangOptions.length > 0 ) {
                for (var i = 0; i < gongyingshangOptions.length; i++) {
                        gongyingshangSelect.add(new Option(gongyingshangOptions[i].gongyingshangName, gongyingshangOptions[i].id));
                }
            }
            $("#gongyingshangSelect").change(function(e) {
                var id = e.target.value;
                http("gongyingshang/info/"+id, "GET", {}, (res) => {
                    if(res.code == 0){
                        gongyingshang = res.data;
                    }
                });
            });
        }
            // 模态框的 分店初始化和查询
        function fendianSelect() {
            http("fendian/page?page=1&limit=100&sort=&order=", "GET", {}, (res) => {
                if(res.code == 0){
                    fendianOptions = res.data.list;
                }
            });
        }
        function initializationFendianSelect() {
            var fendianSelect = document.getElementById('fendianSelect');
            if(fendianSelect != null && fendianOptions != null  && fendianOptions.length > 0 ) {
                for (var i = 0; i < fendianOptions.length; i++) {
                        fendianSelect.add(new Option(fendianOptions[i].fendianName, fendianOptions[i].id));
                }
            }
            $("#fendianSelect").change(function(e) {
                var id = e.target.value;
                http("fendian/info/"+id, "GET", {}, (res) => {
                    if(res.code == 0){
                        fendian = res.data;
                    }
                });
            });
        }

        // 详情表
            // 模态框的 物资表初始化和查询
        function goodsSelect() {
            http("goods/page?page=1&limit=100&sort=&order=", "GET", {}, (res) => {
                if(res.code == 0){
                    goodsOptions = res.data.list;
                }
            });
        }
        function initializationGoodsSelect() {
            var goodsSelect = document.getElementById('goodsSelect');
            if(goodsSelect != null && goodsOptions != null  && goodsOptions.length > 0 ) {
                for (var i = 0; i < goodsOptions.length; i++) {
                    goodsSelect.add(new Option(goodsOptions[i].goodsName, goodsOptions[i].id));
                }
            }
            $("#goodsSelect").change(function(e) {
                var id = e.target.value;
                http("goods/info/"+id, "GET", {}, (res) => {
                    if(res.code == 0){
                        goods = res.data;
                    }
                });
            });
        }

        // 模态框的添加按钮
        function addGoodsOrderList() {
            var id = document.getElementById("goodsSelect").options[document.getElementById("goodsSelect").selectedIndex].value;//获取当前选择项的值.
            if(id ==null || id=="" || id<=0){
                alert("请选择采购调度详情表");
                return;
            }
            if( $("#rowId"+id).val() == null ){
                http("goods/info/"+id, "GET", {}, (res) => {
                    if(res.code == 0){
                        var span =  setGoodsOrderListDataRow(res.data);
                        $('#goodsOrderListTableTbody').append(span);
                    }else{
                        alert("添加采购调度详情表失败,请联系管理员查看日志详情");
                        return;
                    }
                });
            }else{
                alert("您已经添加过此采购调度详情表");
            }
        }

        // 添加采购调度详情表到待提交列表
        function setGoodsOrderListDataRow(item) {
            //创建行 
            var row = document.createElement('tr');
            row.setAttribute("id","rowId"+item.id);

                //物品名字  
            var goodsNameCell = document.createElement('td');
            goodsNameCell.innerHTML = item.goodsName;
            row.appendChild(goodsNameCell);

                //物品种类   
            var goodsTypesCell = document.createElement('td');
            goodsTypesCell.innerHTML = item.goodsValue;
            row.appendChild(goodsTypesCell);

                //物资数量   
            var goodsNumberCell = document.createElement('td');
            goodsNumberCell.setAttribute("id","td"+item.id);
            goodsNumberCell.innerHTML = item.goodsNumber;
            row.appendChild(goodsNumberCell);

                //单位
            var danweiCell = document.createElement('td');
            danweiCell.innerHTML = item.danwei;
            row.appendChild(danweiCell);

                //单价  
            var danjiaCell = document.createElement('td');
            danjiaCell.innerHTML = item.danjia;
            row.appendChild(danjiaCell);

            //     //是否删除
            // var flagCell = document.createElement('td');
            // flagCell.innerHTML = item.flag;
            // row.appendChild(flagCell);

            //操作数量
            var inputCell = document.createElement('td');
            var input = document.createElement("input");
            input.setAttribute("type","input") ;
            input.setAttribute("id","inputId"+item.id) ;
            input.setAttribute("name","inputNumber") ;
            input.setAttribute("class","form-control") ;
            input.setAttribute("value",1) ;
            input.setAttribute("onchange","chickGoodsOrderNumber(this"+","+item.id+")");
            inputCell.appendChild(input);
            row.appendChild(inputCell);


            //每行按钮
            var btnGroup = document.createElement('td');
            //删除按钮
            var deleteBtn = document.createElement('button');
            deleteBtn.setAttribute("type", "button");
            deleteBtn.setAttribute("class", "btn btn-danger btn-sm 删除");
            deleteBtn.setAttribute("onclick","removeGoodsOrderOne("+item.id+")");
            deleteBtn.innerHTML = "删除";
            btnGroup.appendChild(deleteBtn);

            row.appendChild(btnGroup)
            return row;
        }

        function chickGoodsOrderNumber(e,id){
            var this_val = e.value || 0;
            if(this_val == 0){
                e.value = "";
                alert("数量为0无意义");
                return false;
            }
            var reg=/^[1-9][0-9]*$/;
            if(!reg.test(this_val)){
                e.value = "";
                alert("只能输入正整数数字");
                return false;
            }
            var tdid = "#td"+id;
            var number = $(tdid).text();
            if(number==null || number==""){
                alert("商品数量不正确,请进入商品中修改该商品数量");
                return false;
            }
        }

        function removeGoodsOrderOne(id) {
            var rowId = "#rowId"+ id;
            $(rowId).remove();

        }

        // 提交操作
        function submitGoodsOrderList() {
            var goodsOrderName = $("#goodsOrderName").val();
            if(goodsOrderName ==null || goodsOrderName == "" || goodsOrderName=="null"){
                alert("请输入要生成的订单名");
                return false;
            }

            var elementsByName = document.getElementsByName("inputNumber"); // 获取当前模态框表格中输入的input值
            var flag=false;// 用于判断是否有输入为空或者0这种无意义参数情况
            let map = {};//map就是传到后台的值,key:id value:数字
            for (var i = 0; i < elementsByName.length; i++) { //遍历一下表格数据  
                var value = elementsByName[i].value;
                if(value ==null || value =="" ||  value =="null" || value == 0){
                    flag=true;
                }else{
                    var id = parseInt(elementsByName[i].id.replace("inputId",""));
                    map[id]=parseInt(value);
                }
            }
            if(flag){
                alert("数量中有空或者为0情况");
                return false;
            }

            var flag = parseInt($("#goodsOrderListFlag").val());
            var urlParam=null;



            var msg=null;
            if(flag==1){
                urlParam="inGoodsOrderList";
                msg="采购成功";
            }else if(flag==2){
                urlParam="outGoodsOrderList";
                msg="调度成功";
            }else{
                alert("未知错误,请联系管理员");
                return false;
            }
            if(map == null || Object.keys(map).length==0){
                alert("不允许添加空值");
                return false;
            }

            httpJson("goodsOrder/" + urlParam, "POST", {
                map : map,
                goodsOrderName : goodsOrderName,
                // 当前表表关联
                gongyingshangId : $('#gongyingshangSelect option:selected').val(),//把下拉框选中的值传过去,没有就传个空
                fendianId : $('#fendianSelect option:selected').val(),//把下拉框选中的值传过去,没有就传个空
        }, (res) => {
                if(res.code == 0){
                    alert(msg);
                    $('#goodsOrderListModal').modal('hide');
                    getDataList();
                }else{
                    alert(res.msg);
                }
            });
        }







        //列表查看
        // 获取选择的列表的id
        function getId(thisId) {
            if(thisId == null || thisId=="" || thisId=="null"){
                alert("未知错误,请联系管理员处理");
                return;
            }
            id=thisId;
            $('#showGoodsOrderListModal').modal('show');
        }

        //模态框打开的时候会执行这个里面的东西
        $('#showGoodsOrderListModal').on('show.bs.modal', function () {
            //清理表格内容,防止重复回显
            $("#showGoodsOrderListTableTbody").html("");
            if(id ==null){
                alert("获取当前列id错误,请联系管理员处理");
                $('#showGoodsOrderListModal').modal('hide');
                return;
            }
            // 当前表
            gongyingshangSelect();//查询列表
            initializationGongyingshangSelect();//列表赋值
            fendianSelect();//查询列表
            initializationFendianSelect();//列表赋值
            //详情表
            goodsSelect();//查询列表
            initializationGoodsSelect();//列表赋值
            $(".selectpicker" ).selectpicker('refresh');//刷新赋值,否则下拉框还是原来的内容
            showGoodsOrderList();//查询数据列表
        });
        //模态框关闭的时候会执行这个里面的东西
        $('#showGoodsOrderListModal').on('hide.bs.modal', function () {
            $("#showGoodsOrderListTableTbody").html("");
            id=null;

                // 当前表
            $("#gongyingshangSelect").empty();//置位空,下次打开模态框再重新查,
            $("#gongyingshangName").val("");
            $("#fendianName").val("");
            $("#fendianSelect").empty();//置位空,下次打开模态框再重新查,
                //详情表
            $("#goodsSelect").empty();//置位空,下次打开模态框再重新查,
            $(".selectpicker" ).selectpicker('refresh');//刷新赋值,否则下拉框还是原来的内容
            getDataList();
        });

        // 查询所有数据
        function showGoodsOrderList() {

            // 当前表的级联表 id定义
            var gongyingshangId = "";
            var fendianId = "";
            // 查询当前数据详情
            http("goodsOrder/info/"+id, "GET", {}, (res) => {
                if(res.code == 0){
                // 当前表的级联表id赋值
                gongyingshangId = res.data.gongyingshangId;
                fendianId = res.data.fendianId;
                }
            });

            // 查询当前表级联表的数据
            if(gongyingshangId != null && gongyingshangId != "" && gongyingshangId != "null"){
                http("gongyingshang/info/"+gongyingshangId, "GET", {}, (res) => {
                    if(res.code == 0){
                        gongyingshang = res.data;
                        $("#gongyingshangName").val(gongyingshang.gongyingshangName);
                    }
                });
            }
            if(fendianId != null && fendianId != "" && fendianId != "null"){
                http("fendian/info/"+fendianId, "GET", {}, (res) => {
                    if(res.code == 0){
                        fendian = res.data;
                        $("#fendianName").val(fendian.fendianName);
                    }
                });
            }


            //查询列表详情
            http("goodsOrderList/page", "GET", {
                page: 1,
                limit: 100,
                goodsOrderId: id,
            }, (res) => {
                if(res.code == 0){
                    var list = res.data.list;
                    $("#showGoodsOrderListTableTbody").html("");
                    for (var i = 0; i < list.length; i++) { //遍历一下表格数据  
                        var trow = setShowGoodsOrderListDataRow(list[i]); //在 setShowGoodsOrderListDataRow 中拼接数据,然后返回再追加到列表中
                        $('#showGoodsOrderListTableTbody').append(trow);
                    }
                }else{
                    alert("查询列表错误,请联系管理员处理");
                    $('#showGoodsOrderListModal').modal('hide');
                    return;
                }
            });
        }

        // 渲染用户数据表格
        function setShowGoodsOrderListDataRow(item) {
            //创建行 
            var row = document.createElement('tr');
            //物品名字
            var goodsNameCell = document.createElement('td');
            goodsNameCell.innerHTML = item.goodsName;
            row.appendChild(goodsNameCell);

            //物品种类
            var goodsTypesCell = document.createElement('td');
            goodsTypesCell.innerHTML = item.goodsValue;
            row.appendChild(goodsTypesCell);

            //物资数量
            var goodsNumberCell = document.createElement('td');
            goodsNumberCell.setAttribute("id","td"+item.id);
            goodsNumberCell.innerHTML = item.goodsNumber;
            row.appendChild(goodsNumberCell);

            //单位
            var danweiCell = document.createElement('td');
            danweiCell.innerHTML = item.danwei;
            row.appendChild(danweiCell);

            //单价
            var danjiaCell = document.createElement('td');
            danjiaCell.innerHTML = item.danjia;
            row.appendChild(danjiaCell);

            // //是否删除
            // var flagCell = document.createElement('td');
            // flagCell.innerHTML = item.flag;
            // row.appendChild(flagCell);

            //操作数量
            var goodsOrderListNumberCell = document.createElement('td');
            goodsOrderListNumberCell.innerHTML = item.goodsOrderListNumber;
            row.appendChild(goodsOrderListNumberCell);


            // //每行按钮
            // var btnGroup = document.createElement('td');
            // //删除按钮
            // var deleteBtn = document.createElement('button');
            // deleteBtn.setAttribute("type", "button");
            // deleteBtn.setAttribute("class", "btn btn-danger btn-sm 删除");
            // deleteBtn.setAttribute("onclick","removeShowGoodsOrderOne("+item.id+")");
            // deleteBtn.innerHTML = "删除";
            // btnGroup.appendChild(deleteBtn);
            //
            // row.appendChild(btnGroup);
            return row;
        }

        // 删除
        function removeShowGoodsOrderOne(id) {
            var mymessage = confirm("真的要删除吗？");
            if (mymessage == true) {
                httpJson("goodsOrderList/delete?id="+id, "GET",null, (res) => {
                    if(res.code == 0){
                    alert('删除成功');
                    showGoodsOrderList();
                }else{
                    alert(res.msg);
                }
            });
            } else {
                alert("已取消操作");
            }
        }

        //新增
        function addShowGoodsOrderList() {
            var goodsId = $('#goodsSelect option:selected').val();//选中的值
            if(goodsId == null || goodsId == "" || goodsId =="null"){
                alert("不能添加空值");
                return;
            }

            var paramArray = {};
            paramArray["goodsOrderId"]=id;// 当前表的id
            paramArray["goodsId"]=goodsId; //添加的id
            httpJson("goodsOrderList/save", "POST", paramArray, (res) => {
                if(res.code == 0){
                    alert('新增成功');
                    showGoodsOrderList();
                }else{
                    alert(res.msg);
                }
            });
        }





        $(document).ready(function () {
            //激活翻页按钮
            $('#tableId_previous').attr('class', 'paginate_button page-item previous')
            $('#tableId_next').attr('class', 'paginate_button page-item next')
            //隐藏原生搜索框
            $('#tableId_filter').hide()
            //设置右上角用户名
            $('.dropdown-menu h5').html(window.sessionStorage.getItem('username'))
            //设置项目名
            $('.sidebar-header h3 a').html(projectName)
            setMenu();
            init();

            //查询级联表的搜索下拉框
            fendianTypesSelect();
            gongyingshangTypesSelect();
            gongyingshangXinyongTypesSelect();

            //查询当前表的搜索下拉框
            goodsOrderTypesSelect();
            getDataList();

        //级联表的下拉框赋值
                                                 
                         
            fendianTypesSelectSearch();
                         
                                                                                                 
                                                 
            gongyingshangTypesSelectSearch();
                         
            gongyingshangXinyongTypesSelectSearch();
                        
        //当前表的下拉框赋值
                         
             
                         
            goodsOrderTypesSelectSearch();
                                                
        <%@ include file="../../static/myInfo.js"%>
    });
</script>
</body>

</html>