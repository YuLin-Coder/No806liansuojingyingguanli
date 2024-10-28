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


    <%--  新增入入入入入入入入入入入入入入入 新增购买 --%>
    <div class="modal fade" id="fendianGoodsOrderListModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <%-- 模态框标题--%>
                <div class="modal-header">
                    <h5 class="modal-title" id="fendianGoodsOrderListModalTitle">列表</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <%-- 模态框内容 --%>
                <div class="modal-body">
                    <div class="col-sm-12">
                        <%-- 当前表 --%>
                        <label class="col-sm-10">
                            会员
                            <select id="huiyuanSelect" name="huiyuanSelect"
                                    class="selectpicker form-control"  data-live-search="true"
                                    title="请选择" data-header="请选择" data-size="5">
                            </select>
                        </label>
                        <%-- 详情表 --%>
                        <label class="col-sm-10">
                            分店物资
                            <select id="fendianGoodsSelect" name="fendianGoodsSelect"
                                    class="selectpicker form-control"  data-live-search="true"
                                    title="请选择" data-header="请选择" data-size="5">
                            </select>
                        </label>
                        <input type="hidden" id="fendianGoodsOrderListFlag">
                        <label class="col-sm-1">
                            <button onclick="addFendianGoodsOrderList()" type="button" class="btn btn-success 新增">添加</button>
                        </label>
                    </div>
                    <%-- 列表 --%>
                    <table id="fendianGoodsOrderTable" class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <%--<th >分店</th>--%>
                            <th >分店物品名字</th>
                            <th >物品种类</th>
                            <th >分店物资数量</th>
                            <th >单位</th>
                            <th >单价</th>
                            <th >操作数量</th>
                            <th >总价</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="fendianGoodsOrderListTableTbody">
                        </tbody>
                    </table>
                    <div style="margin-left: 330px">
                        <div>
                            <font size="3" color="#a9a9a9"><s>原总价:<font><span id="buyOriginalMoney"></span></font></s></font>
                        </div>
                        <div>
                            <font size="4" color="red">折后价:<font><span id="buyDiscountMoney"></span></font></font>
                        </div>
                    </div>
                </div>
                <%-- 模态框按钮 --%>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" onclick="submitFendianGoodsOrderList()" class="btn btn-primary">提交</button>
                </div>
            </div>
        </div>
    </div>


    <%--  列表查看 --%>
    <div class="modal fade" id="showFendianGoodsOrderListModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                            会员姓名
                            <input id="huiyuanName" name="huiyuanName" class="form-control"
                                   placeholder="会员姓名" readonly>
                        </label>
                        <%-- 详情表 --%>
                        <%--<label class="col-sm-10">--%>
                            <%--购买订单详情--%>
                            <%--<select id="fendianGoodsISelect" name="fendianGoodsISelect"--%>
                                    <%--class="selectpicker form-control"  data-live-search="true"--%>
                                    <%--title="请选择" data-header="请选择" data-size="5">--%>
                            <%--</select>--%>
                        <%--</label>--%>
                        <%--<label class="col-sm-1">--%>
                            <%--<button onclick="addShowFendianGoodsOrderList()" type="button" class="btn btn-success 新增">添加</button>--%>
                        <%--</label>--%>
                    </div>
                    <table id="inOutTableList" class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <%--<th >分店</th>--%>
                            <th >分店物品名字</th>
                            <th >物品种类</th>
                            <th >分店物资数量</th>
                            <th >单位</th>
                            <th >单价</th>
                            <th >操作数量</th>
                            <th >总价</th>
                            <%--<th >操作</th>--%>
                        </tr>
                        </thead>
                        <tbody id="showFendianGoodsOrderListTableTbody">
                        </tbody>
                    </table>
                    <div style="margin-left: 330px">
                        <div>
                            <font size="3" color="#a9a9a9"><s>原总价:<font><span id="originalMoney"></span></font></s></font>
                        </div>
                        <div>
                            <font size="4" color="red">折后价:<font><span id="discountMoney"></span></font></font>
                        </div>
                    </div>
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
                        <h3 class="block-title">购买订单管理</h3>
                    </div>
                    <div class="col-md-6">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="${pageContext.request.contextPath}/index.jsp">
                                    <span class="ti-home"></span>
                                </a>
                            </li>
                            <li class="breadcrumb-item">购买订单管理</li>
                            <li class="breadcrumb-item active">购买订单列表</li>
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
                            <h3 class="widget-title">购买订单列表</h3>
                            <div class="table-responsive mb-3">
                                <div class="col-sm-12">
                                                                         
                                    <div class="layui-inline" style="margin-bottom: 10px;">
                                        操作人姓名
                                        <div class="layui-input-inline">
                                            <input type="text" id="caozuoNameSearch" style="width: 140px;" class="form-control form-control-sm"
                                                   placeholder="操作人姓名" aria-controls="tableId">
                                        </div>
                                    </div>
                                                                                                                                                 
                                    <div class="layui-inline" style="margin-bottom: 10px;">
                                        折后价
                                        <div class="layui-input-inline">
                                            <input type="text" id="discountMoneyStartSearch" style="width: 100px;" class="form-control form-control-sm" onchange="discountMoneyChickValue(this)"
                                                   placeholder="开始" aria-controls="tableId">
                                        </div>
                                    </div>
                                    -
                                    <div class="layui-inline" style="margin-bottom: 10px;">
                                        <div class="layui-input-inline">
                                            <input type="text" id="discountMoneyEndSearch" style="width: 100px;" class="form-control form-control-sm" onchange="discountMoneyChickValue(this)"
                                                   placeholder="结束" aria-controls="tableId">
                                        </div>
                                    </div>
                                     
                                    <div class="layui-inline" style="margin-bottom: 10px;">
                                        订单添加时间
                                        <div class="layui-input-inline">
                                            <input type="datetime-local" id="insertTimeStartSearch" style="width: 190px;" class="form-control form-control-sm"
                                                   placeholder="开始" aria-controls="tableId">
                                        </div>
                                    </div>
                                    -
                                    <div class="layui-inline" style="margin-bottom: 10px;">
                                        <div class="layui-input-inline">
                                            <input type="datetime-local" id="insertTimeEndSearch" style="width: 190px;" class="form-control form-control-sm"
                                                   placeholder="结束" aria-controls="tableId">
                                        </div>
                                    </div>
                                    
                                                                                                         
                                    <div class="layui-inline" style="margin-bottom: 10px;">
                                        会员姓名
                                        <div class="layui-input-inline">
                                            <input type="text" id="huiyuanNameSearch" style="width: 140px;" class="form-control form-control-sm"
                                                   placeholder="会员姓名" aria-controls="tableId">
                                        </div>
                                    </div>
                                                                                                         
                                    <div class="layui-inline" style="margin-bottom: 10px;">
                                        会员身份证号
                                        <div class="layui-input-inline">
                                            <input type="text" id="huiyuanIdNumberSearch" style="width: 140px;" class="form-control form-control-sm"
                                                   placeholder="会员身份证号" aria-controls="tableId">
                                        </div>
                                    </div>
                                                     
                                    <div class="layui-inline" style="margin-bottom: 10px;">
                                        会员手机号
                                        <div class="layui-input-inline">
                                            <input type="text" id="huiyuanPhoneSearch" style="width: 140px;" class="form-control form-control-sm"
                                                   placeholder="会员手机号" aria-controls="tableId">
                                        </div>
                                    </div>
                                                                                                                                                            
                                    <div class="layui-inline" style="margin-left: 30px;margin-bottom: 10px;">
                                        <button onclick="search()" type="button" class="btn btn-primary">查询</button>
                                        <%--<button onclick="add()" type="button" class="btn btn-success 新增">添加</button>--%>
                                        <button onclick="outFendianGoodsOrderList()" type="button" class="btn btn-success 新增">购买</button>
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

                                        <th >会员姓名</th>
                                        <th >会员性别</th>
                                        <th >会员身份证号</th>
                                        <th >会员手机号</th>
                                        <th >积分</th>
                                        <th >会员等级</th>
                                        <th >操作人姓名</th>
                                        <%--<th >操作人所在表名</th>--%>

                                        <th >原总价</th>
                                        <th >折后价</th>
                                        <th >订单添加时间</th>
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
        var tableName = "fendianGoodsOrder";
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
        var huiyuanOptions = [];
        var huiyuan = null;
        // 详情表的关联
        var fendianGoodsOptions = [];
        var fendianGoods = null;



        <!-- 级联表的级联字典表 -->

        <!-- 本表的级联字段表 -->

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
                                         
                            //会员姓名
            var huiyuanNameSearchInput = $('#huiyuanNameSearch');
            if( huiyuanNameSearchInput != null){
                if (huiyuanNameSearchInput.val() != null && huiyuanNameSearchInput.val() != '') {
                    searchForm.huiyuanName = $('#huiyuanNameSearch').val();
                }
            }
                                         
                            //会员身份证号
            var huiyuanIdNumberSearchInput = $('#huiyuanIdNumberSearch');
            if( huiyuanIdNumberSearchInput != null){
                if (huiyuanIdNumberSearchInput.val() != null && huiyuanIdNumberSearchInput.val() != '') {
                    searchForm.huiyuanIdNumber = $('#huiyuanIdNumberSearch').val();
                }
            }
                     
                            //会员手机号
            var huiyuanPhoneSearchInput = $('#huiyuanPhoneSearch');
            if( huiyuanPhoneSearchInput != null){
                if (huiyuanPhoneSearchInput.val() != null && huiyuanPhoneSearchInput.val() != '') {
                    searchForm.huiyuanPhone = $('#huiyuanPhoneSearch').val();
                }
            }
                                                                <!-- 本表的查询条件 -->

         
            //操作人姓名
            var caozuoNameSearchInput = $('#caozuoNameSearch');
            if( caozuoNameSearchInput != null){
                if (caozuoNameSearchInput.val() != null && caozuoNameSearchInput.val() != '') {
                    searchForm.caozuoName = $('#caozuoNameSearch').val();
                }
            }
                 
            //折后价
            var discountMoneyStartSearchInput = $('#discountMoneyStartSearch');
            if(discountMoneyStartSearchInput != null){
                var discountMoneyStartSearchValue = discountMoneyStartSearchInput.val();
                if( discountMoneyStartSearchValue  != 0){
                    searchForm.discountMoneyStart = discountMoneyStartSearchValue;
                }
            }
            var discountMoneyEndSearchInput = $('#discountMoneyEndSearch');
            if(discountMoneyEndSearchInput != null){
                var discountMoneyEndSearchValue = discountMoneyEndSearchInput.val();
                if( discountMoneyEndSearchValue  != 0){
                    searchForm.discountMoneyEnd = discountMoneyEndSearchValue;
                }
            }
     
            var insertTimeStartSearch = $('#insertTimeStartSearch');
            if( insertTimeStartSearch != null){
                if (insertTimeStartSearch.val() != null && insertTimeStartSearch.val() != '') {
                    searchForm.insertTimeStart = $('#insertTimeStartSearch').val();
                }
            }
            var insertTimeEndSearch = $('#insertTimeEndSearch');
            if( insertTimeEndSearch != null){
                if (insertTimeEndSearch.val() != null && insertTimeEndSearch.val() != '') {
                    searchForm.insertTimeEnd = $('#insertTimeEndSearch').val();
                }
            }
                getDataList();
        }

        // 获取数据列表
        function getDataList() {
            http("fendianGoodsOrder/page", "GET", {
                page: pageIndex,
                limit: pageSize,
                sort: sortColumn,
                order: sortOrder,
                //本表的
                caozuoName: searchForm.caozuoName,
                discountMoneyStart: searchForm.discountMoneyStart,
                discountMoneyEnd: searchForm.discountMoneyEnd,
                insertTimeStart: searchForm.insertTimeStart,
                insertTimeEnd: searchForm.insertTimeEnd,
            //级联表的
                huiyuanName: searchForm.huiyuanName,
                huiyuanIdNumber: searchForm.huiyuanIdNumber,
                huiyuanPhone: searchForm.huiyuanPhone,


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


                    //会员姓名
            var huiyuanNameCell = document.createElement('td');
            huiyuanNameCell.innerHTML = item.huiyuanName;
            row.appendChild(huiyuanNameCell);

                        //会员性别
            var sexTypesCell = document.createElement('td');
            sexTypesCell.innerHTML = item.sexValue;
            row.appendChild(sexTypesCell);


                    //会员身份证号
            var huiyuanIdNumberCell = document.createElement('td');
            huiyuanIdNumberCell.innerHTML = item.huiyuanIdNumber;
            row.appendChild(huiyuanIdNumberCell);


                    //会员手机号
            var huiyuanPhoneCell = document.createElement('td');
            huiyuanPhoneCell.innerHTML = item.huiyuanPhone;
            row.appendChild(huiyuanPhoneCell);

                        //积分
            var jifenCell = document.createElement('td');
            jifenCell.innerHTML = item.jifen;
            row.appendChild(jifenCell);

                        //会员等级
            var jifenTypesCell = document.createElement('td');
            jifenTypesCell.innerHTML = item.jifenValue;
            row.appendChild(jifenTypesCell);



            //操作人姓名
            var caozuoNameCell = document.createElement('td');
            caozuoNameCell.innerHTML = item.caozuoName;
            row.appendChild(caozuoNameCell);


            // //操作人所在表名
            // var caozuoTableCell = document.createElement('td');
            // caozuoTableCell.innerHTML = item.caozuoTable;
            // row.appendChild(caozuoTableCell);


            //原总价
            var originalMoneyCell = document.createElement('td');
            originalMoneyCell.innerHTML = item.originalMoney;
            row.appendChild(originalMoneyCell);


            //折后价
            var discountMoneyCell = document.createElement('td');
            discountMoneyCell.innerHTML = item.discountMoney;
            row.appendChild(discountMoneyCell);


            //订单添加时间
            var insertTimeCell = document.createElement('td');
            insertTimeCell.innerHTML = item.insertTime;
            row.appendChild(insertTimeCell);



            //每行按钮
            var btnGroup = document.createElement('td');

            //详情按钮
            var detailBtn = document.createElement('button');
            var detailAttr = "detail(" + item.id + ')';
            detailBtn.setAttribute("type", "button");
            detailBtn.setAttribute("class", "btn btn-info btn-sm 查看");
            detailBtn.setAttribute("onclick", detailAttr);
            detailBtn.innerHTML = "查看";
            btnGroup.appendChild(detailBtn);
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
            detailListBtn.setAttribute("class", "btn btn-info btn-sm");
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


            // 小数
            function discountMoneyChickValue(e){
                var this_val = e.value || 0;
                var reg=/^[1-9][0-9]{0,5}(\.[0-9]{1,2})?$/;
                if(!reg.test(this_val)){
                    e.value = "";
                    alert("只允许输入整数6位,小数2位的数字");
                    return false;
                }
            }


            // 小数
            function discountMoneyChickValue(e){
                var this_val = e.value || 0;
                var reg=/^[1-9][0-9]{0,5}(\.[0-9]{1,2})?$/;
                if(!reg.test(this_val)){
                    e.value = "";
                    alert("只允许输入整数6位,小数2位的数字");
                    return false;
                }
            }


            // 小数
            function discountMoneyChickValue(e){
                var this_val = e.value || 0;
                var reg=/^[1-9][0-9]{0,5}(\.[0-9]{1,2})?$/;
                if(!reg.test(this_val)){
                    e.value = "";
                    alert("只允许输入整数6位,小数2位的数字");
                    return false;
                }
            }


            // 小数
            function discountMoneyChickValue(e){
                var this_val = e.value || 0;
                var reg=/^[1-9][0-9]{0,5}(\.[0-9]{1,2})?$/;
                if(!reg.test(this_val)){
                    e.value = "";
                    alert("只允许输入整数6位,小数2位的数字");
                    return false;
                }
            }


            // 小数
            function discountMoneyChickValue(e){
                var this_val = e.value || 0;
                var reg=/^[1-9][0-9]{0,5}(\.[0-9]{1,2})?$/;
                if(!reg.test(this_val)){
                    e.value = "";
                    alert("只允许输入整数6位,小数2位的数字");
                    return false;
                }
            }


            // 小数
            function discountMoneyChickValue(e){
                var this_val = e.value || 0;
                var reg=/^[1-9][0-9]{0,5}(\.[0-9]{1,2})?$/;
                if(!reg.test(this_val)){
                    e.value = "";
                    alert("只允许输入整数6位,小数2位的数字");
                    return false;
                }
            }


            // 小数
            function discountMoneyChickValue(e){
                var this_val = e.value || 0;
                var reg=/^[1-9][0-9]{0,5}(\.[0-9]{1,2})?$/;
                if(!reg.test(this_val)){
                    e.value = "";
                    alert("只允许输入整数6位,小数2位的数字");
                    return false;
                }
            }


            // 小数
            function discountMoneyChickValue(e){
                var this_val = e.value || 0;
                var reg=/^[1-9][0-9]{0,5}(\.[0-9]{1,2})?$/;
                if(!reg.test(this_val)){
                    e.value = "";
                    alert("只允许输入整数6位,小数2位的数字");
                    return false;
                }
            }


            //小数
            function discountMoneyChickValue(e){
                var this_val = e.value || 0;
                var reg=/^[1-9][0-9]{0,5}(\.[0-9]{1,2})?$/;
                if(!reg.test(this_val)){
                    e.value = "";
                    alert("只允许输入整数6位,小数2位的数字");
                    return false;
                }
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
                httpJson("fendianGoodsOrder/delete", "POST", paramArray, (res) => {
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
            window.sessionStorage.setItem("addfendianGoodsOrder", "addfendianGoodsOrder");
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
                                         
                                         
                     
                                                            
    //填充本表搜索下拉框
         
                 
     
    
    //查询级联表搜索条件所有列表

    //查询当前表搜索条件所有列表











        // 新增入入入入入入入入入入入入入入入 新增购买

        //购买
        function outFendianGoodsOrderList() {
            document.getElementById("fendianGoodsOrderListModalTitle").innerHTML = "购买列表";
            $("#fendianGoodsOrderListFlag").val(2);
            $('#fendianGoodsOrderListModal').modal('show');
        }
        /*//入入入入入入入入入入入入入入入
        function inFendianGoodsOrderList() {
            document.getElementById("fendianGoodsOrderListModalTitle").innerHTML = "入入入入入入入入入入入入入入入列表";
            $("#fendianGoodsOrderListFlag").val(1);
            $('#fendianGoodsOrderListModal').modal('show');

        }*/

        // 模态框打开
        $('#fendianGoodsOrderListModal').on('show.bs.modal', function () {

            // 当前表
            huiyuanSelect();
            initializationHuiyuanSelect();

            //登录人的账户权限
            var fendianId = "";
            if (window.sessionStorage.getItem('role') == '用户') {
                var id = window.sessionStorage.getItem('userId');
                http("yonghu/info/"+id, "GET", {}, (res) => {
                    if(res.code == 0){
                        fendianId= res.data.fendianId;
                    }
                });
            }else{
                alert("您不是员工,无法添加购买订单");
                return false;
            }

            // 详情表
            fendianGoodsSelect(fendianId);
            initializationFendianGoodsSelect();
            $(".selectpicker" ).selectpicker('refresh');
        });
        // 模态框关闭
        $('#fendianGoodsOrderListModal').on('hide.bs.modal', function () {
            $("#fendianGoodsOrderListModalTitle").val("")
            $("#fendianGoodsOrderListFlag").val(0);
            // $("#fendianGoodsOrderName").val("");
            $("#fendianGoodsOrderListTableTbody").html("");
            // 当前表
            $("#huiyuanSelect").empty();
            // 详情表
            $("#fendianGoodsSelect").empty();
            $(".selectpicker" ).selectpicker('refresh');
        });

        // 当前表
            // 模态框的 会员初始化和查询
        function huiyuanSelect() {
            http("huiyuan/page?page=1&limit=100&sort=&order=", "GET", {}, (res) => {
                if(res.code == 0){
                    huiyuanOptions = res.data.list;
                }
            });
        }
        function initializationHuiyuanSelect() {
            var huiyuanSelect = document.getElementById('huiyuanSelect');
            if(huiyuanSelect != null && huiyuanOptions != null  && huiyuanOptions.length > 0 ) {
                for (var i = 0; i < huiyuanOptions.length; i++) {
                        huiyuanSelect.add(new Option(huiyuanOptions[i].huiyuanName, huiyuanOptions[i].id));
                }
            }
            $("#huiyuanSelect").change(function(e) {
                var id = e.target.value;
                http("huiyuan/info/"+id, "GET", {}, (res) => {
                    if(res.code == 0){
                        huiyuan = res.data;
                    }
                });
            });
        }

        // 详情表
            // 模态框的 分店物资初始化和查询
        function fendianGoodsSelect(fendianId) {
            http("fendianGoods/page?page=1&limit=100&sort=&order=&fendianId="+fendianId, "GET", {}, (res) => {
                if(res.code == 0){
                    fendianGoodsOptions = res.data.list;
                }
            });
        }
        function initializationFendianGoodsSelect() {
            var fendianGoodsSelect = document.getElementById('fendianGoodsSelect');
            if(fendianGoodsSelect != null && fendianGoodsOptions != null  && fendianGoodsOptions.length > 0 ) {
                for (var i = 0; i < fendianGoodsOptions.length; i++) {
                    fendianGoodsSelect.add(new Option(fendianGoodsOptions[i].goodsName, fendianGoodsOptions[i].id));
                }
            }
            $("#fendianGoodsSelect").change(function(e) {
                var id = e.target.value;
                http("fendianGoods/info/"+id, "GET", {}, (res) => {
                    if(res.code == 0){
                        fendianGoods = res.data;
                    }
                });
            });
        }

        // 模态框的添加按钮
        function addFendianGoodsOrderList() {
            var id = document.getElementById("fendianGoodsSelect").options[document.getElementById("fendianGoodsSelect").selectedIndex].value;//获取当前选择项的值.
            if(id ==null || id=="" || id<=0){
                alert("请选择购买订单详情");
                return;
            }
            if( $("#rowId"+id).val() == null ){
                http("fendianGoods/info/"+id, "GET", {}, (res) => {
                    if(res.code == 0){
                        var span =  setFendianGoodsOrderListDataRow(res.data);
                        $('#fendianGoodsOrderListTableTbody').append(span);
                    }else{
                        alert("添加购买订单详情失败,请联系管理员查看日志详情");
                        return;
                    }
                });
            }else{
                alert("您已经添加过此购买订单详情");
                return;
            }
            //填充原来总价
            var elementsByName = document.getElementsByName("zongjia");
            var originalMoney =0;
            for (var i = 0; i < elementsByName.length; i++) {
                var a = elementsByName[i].innerText;
                originalMoney = originalMoney+parseInt(a);
            }
            if(huiyuan == null ){
                alert("请选择会员");
                e.value = 1;
                return false;
            }
            var jifenTypes = huiyuan.jifenTypes;
            var discountMoney =0;
            if(jifenTypes ==1 ){
                //钻石会员 8折
                discountMoney = originalMoney*0.8;
            }else if(jifenTypes == 2 ){
                //黄金会员 85折
                discountMoney = originalMoney*0.85;
            }else if(jifenTypes == 3 ){
                //白银会员 9折
                discountMoney = originalMoney*0.90;
            }else if(jifenTypes == 4 ){
                //青铜会员 95折
                discountMoney = originalMoney*0.95;
            }else{
                alert("会员未知错误,请联系管理员");
            }
            document.getElementById("buyOriginalMoney").innerHTML=originalMoney;
            document.getElementById("buyDiscountMoney").innerHTML=discountMoney;

        }

        // 添加购买订单详情到待提交列表
        function setFendianGoodsOrderListDataRow(item) {
            //创建行 
            var row = document.createElement('tr');
            row.setAttribute("id","rowId"+item.id);
            //
            //     //分店
            // var goodsOnlyCell = document.createElement('td');
            // goodsOnlyCell.innerHTML = item.goodsOnly;
            // row.appendChild(goodsOnlyCell);

                //分店物品名字  
            var goodsNameCell = document.createElement('td');
            goodsNameCell.innerHTML = item.goodsName;
            row.appendChild(goodsNameCell);

                //物品种类   
            var goodsTypesCell = document.createElement('td');
            goodsTypesCell.innerHTML = item.goodsValue;
            row.appendChild(goodsTypesCell);

                //分店物资数量   
            var fendianGoodsNumberCell = document.createElement('td');
            fendianGoodsNumberCell.setAttribute("id","td"+item.id);
            fendianGoodsNumberCell.innerHTML = item.fendianGoodsNumber;
            row.appendChild(fendianGoodsNumberCell);

                //单位
            var danweiCell = document.createElement('td');
            danweiCell.innerHTML = item.danwei;
            row.appendChild(danweiCell);

                //单价  
            var danjiaCell = document.createElement('td');
            danjiaCell.innerHTML = item.danjia;
            danjiaCell.setAttribute("id","danjiatd"+item.id) ;
            row.appendChild(danjiaCell);

            //操作数量
            var inputCell = document.createElement('td');
            var input = document.createElement("input");
            input.setAttribute("type","input") ;
            input.setAttribute("id","inputId"+item.id) ;
            input.setAttribute("name","inputNumber") ;
            input.setAttribute("class","form-control") ;
            input.setAttribute("value",1) ;
            input.setAttribute("onchange","chickFendianGoodsOrderNumber(this"+","+item.id+")");
            inputCell.appendChild(input);
            row.appendChild(inputCell);

            //总价
            var zongjiaCell = document.createElement('td');
            zongjiaCell.setAttribute("id","zongjiatd"+item.id);
            zongjiaCell.setAttribute("name","zongjia");
            zongjiaCell.innerHTML = item.danjia;
            row.appendChild(zongjiaCell);


            //每行按钮
            var btnGroup = document.createElement('td');
            //删除按钮
            var deleteBtn = document.createElement('button');
            deleteBtn.setAttribute("type", "button");
            deleteBtn.setAttribute("class", "btn btn-danger btn-sm 删除");
            deleteBtn.setAttribute("onclick","removeFendianGoodsOrderOne("+item.id+")");
            deleteBtn.innerHTML = "删除";
            btnGroup.appendChild(deleteBtn);

            row.appendChild(btnGroup)
            return row;
        }

        function chickFendianGoodsOrderNumber(e,id){
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
            //价格计算  数量效验
            if((parseInt(number)-parseInt(this_val))<0){
                e.value = 1;
                alert("购买数量不能大于商品数量");
                return false;
            }

            //把总价算出来填充上去
            var danjia=document.getElementById("danjiatd"+id).innerText;
            document.getElementById("zongjiatd"+id).innerHTML=parseInt(danjia) * parseInt(this_val);

            //填充原来总价
            var elementsByName = document.getElementsByName("zongjia");
            var originalMoney =0;
            for (var i = 0; i < elementsByName.length; i++) {
                var a = elementsByName[i].innerText;
                originalMoney = originalMoney+parseInt(a);
            }
            if(huiyuan == null ){
                alert("请选择会员");
                e.value = 1;
                return false;
            }
            var jifenTypes = huiyuan.jifenTypes;
            var discountMoney =0;
            if(jifenTypes ==1 ){
                //钻石会员 8折
                discountMoney = originalMoney*0.8;
            }else if(jifenTypes == 2 ){
                //黄金会员 85折
                discountMoney = originalMoney*0.85;
            }else if(jifenTypes == 3 ){
                //白银会员 9折
                discountMoney = originalMoney*0.90;
            }else if(jifenTypes == 4 ){
                //青铜会员 95折
                discountMoney = originalMoney*0.95;
            }else{
                alert("会员未知错误,请联系管理员");
            }
            document.getElementById("buyOriginalMoney").innerHTML=originalMoney;
            document.getElementById("buyDiscountMoney").innerHTML=discountMoney;
        }

        function removeFendianGoodsOrderOne(id) {
            var rowId = "#rowId"+ id;
            $(rowId).remove();
            //查询出来所有条的总价
            var elementsByName = document.getElementsByName("zongjia");
            var originalMoney =0;
            for (var i = 0; i < elementsByName.length; i++) {
                var a = elementsByName[i].innerText;
                originalMoney = originalMoney+parseInt(a);
            }
            if(huiyuan == null ){
                alert("请选择会员");
                e.value = 1;
                return false;
            }
            var jifenTypes = huiyuan.jifenTypes;
            var discountMoney =0;
            if(jifenTypes ==1 ){
                //钻石会员 8折
                discountMoney = originalMoney*0.8;
            }else if(jifenTypes == 2 ){
                //黄金会员 85折
                discountMoney = originalMoney*0.85;
            }else if(jifenTypes == 3 ){
                //白银会员 9折
                discountMoney = originalMoney*0.90;
            }else if(jifenTypes == 4 ){
                //青铜会员 95折
                discountMoney = originalMoney*0.95;
            }else{
                alert("会员未知错误,请联系管理员");
            }
            document.getElementById("buyOriginalMoney").innerHTML=originalMoney;
            document.getElementById("buyDiscountMoney").innerHTML=discountMoney;

        }

        // 提交操作
        function submitFendianGoodsOrderList() {

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

            // var flag = parseInt($("#fendianGoodsOrderListFlag").val());
            // var urlParam=null;



            // var msg=null;
            // if(flag==1){
            //     urlParam="inFendianGoodsOrderList";
            //     msg="入入入入入入入入入入入入入入入成功";
            // }else if(flag==2){
                urlParam="outFendianGoodsOrderList";
                msg="购买成功";
            // }else{
            //     alert("未知错误,请联系管理员");
            //     return false;
            // }
            if(map == null || Object.keys(map).length==0){
                alert("不允许添加空值");
                return false;
            }
            var buyDiscountMoney = document.getElementById("buyDiscountMoney").innerText;
            if(buyDiscountMoney == null || buyDiscountMoney == "" || buyDiscountMoney=="null" ){
                alert("价格为空,请联系管理员");
                return false;
            }
            var buyOriginalMoney = document.getElementById("buyOriginalMoney").innerText;
            if(buyOriginalMoney == null || buyOriginalMoney == "" || buyOriginalMoney=="null"){
                alert("原总价格为空,请联系管理员");
                return false;
            }

            httpJson("fendianGoodsOrder/" + urlParam, "POST", {
                map : map,
                // fendianGoodsOrderName : fendianGoodsOrderName,
                // 当前表表关联
                huiyuanId : $('#huiyuanSelect option:selected').val(),//把下拉框选中的值传过去,没有就传个空
        }, (res) => {
                if(res.code == 0){
                    alert(msg);
                    $('#fendianGoodsOrderListModal').modal('hide');
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
            $('#showFendianGoodsOrderListModal').modal('show');
        }

        //模态框打开的时候会执行这个里面的东西
        $('#showFendianGoodsOrderListModal').on('show.bs.modal', function () {
            //清理表格内容,防止重复回显
            $("#showFendianGoodsOrderListTableTbody").html("");
            if(id ==null){
                alert("获取当前列id错误,请联系管理员处理");
                $('#showFendianGoodsOrderListModal').modal('hide');
                return;
            }
            // 当前表
            huiyuanSelect();//查询列表
            initializationHuiyuanSelect();//列表赋值
            //详情表
            fendianGoodsSelect();//查询列表
            initializationFendianGoodsSelect();//列表赋值
            $(".selectpicker" ).selectpicker('refresh');//刷新赋值,否则下拉框还是原来的内容
            showFendianGoodsOrderList();//查询数据列表
        });
        //模态框关闭的时候会执行这个里面的东西
        $('#showFendianGoodsOrderListModal').on('hide.bs.modal', function () {
            $("#showFendianGoodsOrderListTableTbody").html("");
            id=null;
            $("#originalMoney").val("");//清除原总价
            $("#discountMoney").val("");//清除折扣价

                // 当前表
            $("#huiyuanSelect").empty();//置位空,下次打开模态框再重新查,
            $("#huiyuanName").val("");
                //详情表
            $("#fendianGoodsSelect").empty();//置位空,下次打开模态框再重新查,
            $(".selectpicker" ).selectpicker('refresh');//刷新赋值,否则下拉框还是原来的内容
            getDataList();
        });

        // 查询所有数据
        function showFendianGoodsOrderList() {

            // 当前表的级联表 id定义
            var huiyuanId = "";
            // 查询当前数据详情
            http("fendianGoodsOrder/info/"+id, "GET", {}, (res) => {
                if(res.code == 0){
                    document.getElementById("originalMoney").innerHTML=res.data.originalMoney;//添加原总价
                    document.getElementById("discountMoney").innerHTML=res.data.discountMoney;//添加折扣价
                // 当前表的级联表id赋值
                huiyuanId = res.data.huiyuanId;
                }
            });

            // 查询当前表级联表的数据
            if(huiyuanId != null && huiyuanId != "" && huiyuanId != "null"){
                http("huiyuan/info/"+huiyuanId, "GET", {}, (res) => {
                    if(res.code == 0){
                        huiyuan = res.data;
                        $("#huiyuanName").val(huiyuan.huiyuanName);
                    }
                });
            }


            //查询列表详情
            http("fendianGoodsOrderList/page", "GET", {
                page: 1,
                limit: 100,
                fendianGoodsOrderId: id,
            }, (res) => {
                if(res.code == 0){
                    var list = res.data.list;
                    $("#showFendianGoodsOrderListTableTbody").html("");
                    for (var i = 0; i < list.length; i++) { //遍历一下表格数据  
                        var trow = setShowFendianGoodsOrderListDataRow(list[i]); //在 setShowFendianGoodsOrderListDataRow 中拼接数据,然后返回再追加到列表中
                        $('#showFendianGoodsOrderListTableTbody').append(trow);
                    }
                }else{
                    alert("查询列表错误,请联系管理员处理");
                    $('#showFendianGoodsOrderListModal').modal('hide');
                    return;
                }
            });
        }


        // 渲染用户数据表格
        function setShowFendianGoodsOrderListDataRow(item) {
            //创建行 
            var row = document.createElement('tr');
            //     //分店
            // var goodsOnlyCell = document.createElement('td');
            // goodsOnlyCell.innerHTML = item.goodsOnly;
            // row.appendChild(goodsOnlyCell);

                //分店物品名字  
            var goodsNameCell = document.createElement('td');
            goodsNameCell.innerHTML = item.goodsName;
            row.appendChild(goodsNameCell);

                //物品种类   
            var goodsTypesCell = document.createElement('td');
            goodsTypesCell.innerHTML = item.goodsValue;
            row.appendChild(goodsTypesCell);

                //分店物资数量   
            var fendianGoodsNumberCell = document.createElement('td');
            fendianGoodsNumberCell.setAttribute("id","td"+item.id);
            fendianGoodsNumberCell.innerHTML = item.fendianGoodsNumber;
            row.appendChild(fendianGoodsNumberCell);

                //单位
            var danweiCell = document.createElement('td');
            danweiCell.innerHTML = item.danwei;
            row.appendChild(danweiCell);

                //单价  
            var danjiaCell = document.createElement('td');
            danjiaCell.innerHTML = item.danjia;
            row.appendChild(danjiaCell);

            //操作数量
            var fendianGoodsOrderListNumberCell = document.createElement('td');
                fendianGoodsOrderListNumberCell.innerHTML = item.fendianGoodsOrderListNumber;
            row.appendChild(fendianGoodsOrderListNumberCell);

            //总价
            var zongjiaCell = document.createElement('td');
            zongjiaCell.setAttribute("id","zongjiatd"+item.id);
            zongjiaCell.setAttribute("name","zongjia");
            zongjiaCell.innerHTML = item.fendianGoodsOrderListNumber;//要乘以单价
            row.appendChild(zongjiaCell);


            /*//每行按钮
            var btnGroup = document.createElement('td');
            //删除按钮
            var deleteBtn = document.createElement('button');
            deleteBtn.setAttribute("type", "button");
            deleteBtn.setAttribute("class", "btn btn-danger btn-sm 删除");
            deleteBtn.setAttribute("onclick","removeShowFendianGoodsOrderOne("+item.id+")");
            deleteBtn.innerHTML = "删除";
            btnGroup.appendChild(deleteBtn);

            row.appendChild(btnGroup);*/
            return row;
        }

        // 删除
        function removeShowFendianGoodsOrderOne(id) {
            var mymessage = confirm("真的要删除吗？");
            if (mymessage == true) {
                httpJson("fendianGoodsOrderList/delete?id="+id, "GET",null, (res) => {
                    if(res.code == 0){
                    alert('删除成功');
                    showFendianGoodsOrderList();
                }else{
                    alert(res.msg);
                }
            });
            } else {
                alert("已取消操作");
            }
        }

        //新增
        function addShowFendianGoodsOrderList() {
            var fendianGoodsId = $('#fendianGoodsSelect option:selected').val();//选中的值
            if(fendianGoodsId == null || fendianGoodsId == "" || fendianGoodsId =="null"){
                alert("不能添加空值");
                return;
            }

            var paramArray = {};
            paramArray["fendianGoodsOrderId"]=id;// 当前表的id
            paramArray["fendianGoodsId"]=fendianGoodsId; //添加的id
            httpJson("fendianGoodsOrderList/save", "POST", paramArray, (res) => {
                if(res.code == 0){
                    alert('新增成功');
                    showFendianGoodsOrderList();
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

            //查询当前表的搜索下拉框
            getDataList();

        //级联表的下拉框赋值
                                                 
                                                 
                         
                                                                        
        //当前表的下拉框赋值
                         
                                                 
             
            
        <%@ include file="../../static/myInfo.js"%>
    });
</script>
</body>

</html>