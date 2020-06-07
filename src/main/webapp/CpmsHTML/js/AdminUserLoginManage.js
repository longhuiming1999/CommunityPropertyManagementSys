// 全局变量：查询条件的变量
var dataIndex = {currentPage: 1};
var totalPage;

// 根据不同的查询条件发送ajax请求数据
function sendAjaxRequest(requestIndex) {
    $.post("/User/findByIndex", requestIndex, function (data) {
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
    var account = $("input[name='account']").val();
    var phone = $("input[name='phone']").val();
    var email = $("input[name='email']").val();
    dataIndex['currentPage'] = 1;
    dataIndex['account'] = account;
    dataIndex['phone'] = phone;
    dataIndex['email'] = email;
    sendAjaxRequest(dataIndex);
})

//处理回调数据
function dealData(data) {
    $(".tbody").empty();
    var list = eval(data.dataList);
    for (var obj of list) {
        var tr = $("<tr></tr>");
        var td1 = $('<td>' + obj.id + '</td>');
        var td2 = $('<td>' + obj.account + '</td>');
        var td3 = $('<td>' + obj.pwd + '</td>');
        var td4 = $('<td>' + obj.phone + '</td>');
        var td5 = $('<td>' + obj.email + '</td>');
        var td6 = $('<td class="display_form" data-index="' + obj.id + '">' + '<a href="#" class="btn btn-default">' + 'Edit' + '</a>' + '</td>');
        var td7 = $('<td>' + '<a class="btn btn-link" onclick="deleteConfirm(' + obj.id + ')">Delete</a>' + '</td>');

        tr.append(td1);
        tr.append(td2);
        tr.append(td3);
        tr.append(td4);
        tr.append(td5);
        tr.append(td6);
        tr.append(td7);
        $(".tbody").append(tr);

        $('.display_form').click(function () {
            var index = $(this).data('index');
            $.get("/User/findUserByUid?uid=" + index, function (data) {
                var value = data;
                $('.box_form-body input[name=id]').val(value.id);
                $('.box_form-body input[name=account]').val(value.account);
                $('.box_form-body input[name=pwd]').val(value.pwd);
                $('.box_form-body input[name=phone]').val(value.phone);
                $('.box_form-body input[name=email]').val(value.email);
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

}

function deleteConfirm(id) {
    if (confirm("是否确认删除?")) {
        location.href = "/User/delete?uid=" + id;
    } else {

    }
}