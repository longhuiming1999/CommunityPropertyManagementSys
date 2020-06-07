// 全局变量：查询条件的变量
var dataIndex = {currentPage: 1};
var totalPage;

// 根据不同的查询条件发送ajax请求数据
function sendAjaxRequest(requestIndex) {
    $.post("/Car/findByIndex", requestIndex, function (data) {
        dealData(data);
        console.log(data);
        dataIndex.currentPage = data.currentPageNum;
        totalPage = data.totalPageNum;
    });
}

// 页面刚加载时
$(window).load(function () {
    sendAjaxRequest(dataIndex);
})

// 首页
$("#firstPageId").click(function () {
    dataIndex.currentPage = 1;
    sendAjaxRequest(dataIndex);
})

// 上一页
$("#prePageId").click(function () {
    dataIndex.currentPage = dataIndex.currentPage <= 1 ? 1 : dataIndex.currentPage - 1;
    sendAjaxRequest(dataIndex);
})

// 下一页
$("#nextPageId").click(function () {
    dataIndex.currentPage = dataIndex.currentPage >= totalPage ? totalPage : dataIndex.currentPage + 1;
    sendAjaxRequest(dataIndex);
})

// 末页
$("#endPageId").click(function () {
    dataIndex.currentPage = totalPage;
    sendAjaxRequest(dataIndex);
})

// 点击搜索改变请求条件，并发送ajax请求
$(".infoSeachBtn").click(function () {
    var name = $("input[name='name']").val();
    var resPlateNum = $("input[name='resPlateNum']").val();
    var startMoney = $("input[name='startMoney']").val();
    var endMoney = $("select[name='endMoney']").val();
    var isRent = $("select[name='isRent']").val();
    dataIndex = {
        currentPage: 1,
        name: name,
        resPlateNum: resPlateNum,
        startMoney: startMoney,
        endMoney: endMoney,
        isRent: isRent
    };
    sendAjaxRequest(dataIndex);
})


//处理回调数据
function dealData(data) {
    $(".tbody").empty();
    var list = eval(data.dataList);
    for (var obj of list) {
        var tr = $("<tr></tr>");
        var td1 = $('<td>' + obj.id + '</td>');
        var td2 = $('<td>' + obj.resId + '</td>');
        var td3 = $('<td>' + obj.resName + '</td>');
        var td4 = $('<td>' + obj.resPlateNum + '</td>');
        var td5 = $('<td>' + obj.sellMoney + '</td>');
        var td6 = $('<td>' + obj.isRent + '</td>');
        var td7 = $('<td class="display_form" data-index="' + obj.id + '">' + '<a href="#" class="btn btn-default">' + 'Edit' + '</a>' + '</td>');
        var td8 = $('<td>' + '<a class="btn btn-link" onclick="deleteConfirm(' + obj.id + ')">Delete</a>' + '</td>');

        tr.append(td1);
        tr.append(td2);
        tr.append(td3);
        tr.append(td4);
        tr.append(td5);
        tr.append(td6);
        tr.append(td7);
        tr.append(td8);

        $(".tbody").append(tr);
    }
    $(".display_form").click(function () {
        var index = $(this).data('index');
        $.post("/Car/findCartPortByCid", {cid: index}, function (data) {
            console.log(data);
            $('.box_form-body input[name=id]').val(data.id);
            $('.box_form-body input[name=resId]').val(data.resId);
            $('.box_form-body input[name=resName]').val(data.resName);
            $('.box_form-body input[name=resPlateNum]').val(data.resPlateNum);
            $('.box_form-body input[name=sellMoney]').val(data.sellMoney);
            $('.box_form-body select[name=isRent]').val(data.isRent);
        })

        $('.box').show();
    })
}

$('#cancel').click(function () {
    $('.box').hide();
})
$('#addInfo').click(function () {
    $('.boxAdd').show();
})

$('#cancelAdd').click(function () {
    $('.boxAdd').hide();
})

function deleteConfirm(id) {
    if (confirm("是否确认删除?")) {
        location.href = "/Car/deleteCarPortByCid?cid=" + id;
    } else {

    }
}

