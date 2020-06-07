// 全局变量：查询条件的变量
var dataIndex = {currentPage: 1};
var totalPage;

// 根据不同的查询条件发送ajax请求数据
function sendAjaxRequest(requestIndex) {
    $.post("/Repair/findByIndex", requestIndex, function (data) {
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
    var phone = $("input[name='phone']").val();
    var type = $("select[name='type']").val();
    var content = $("input[name='content']").val();
    var startDate = $("input[name='startDate']").val();
    var endDate = $("input[name='endDate']").val();
    var state = $("select[name='state']").val();
    dataIndex['currentPage'] = 1;
    dataIndex['name'] = name;
    dataIndex['phone'] = phone;
    dataIndex['type'] = type;
    dataIndex['content'] = content;
    dataIndex['startDate'] = startDate;
    dataIndex['endDate'] = endDate;
    dataIndex['state'] = state;
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
        var td3 = $('<td>' + obj.resname + '</td>');
        var td4 = $('<td>' + obj.phone + '</td>');
        var td5 = $('<td>' + obj.type + '</td>');
        var td6 = $('<td>' + obj.content + '</td>');
        var td7 = $('<td>' + obj.repdate + '</td>');
        var td8 = $('<td>' + obj.state + '</td>');
        var td9 = $('<td class="display_form" data-index="' + obj.id + '">' + '<a href="#" class="btn btn-default">' + 'Edit' + '</a>' + '</td>');
        var td10 = $('<td>' + '<a class="btn btn-link" onclick="deleteConfirm(' + obj.id + ')">Delete</a>' + '</td>');

        tr.append(td1);
        tr.append(td2);
        tr.append(td3);
        tr.append(td4);
        tr.append(td5);
        tr.append(td6);
        tr.append(td7);
        tr.append(td8);
        tr.append(td9);
        tr.append(td10);
        $(".tbody").append(tr);
        $('.display_form').click(function () {

            var index = $(this).data('index');
            $.get("/Repair/findRepairByRid?rid=" + index, function (data) {
                var value = data;
                $('.box_form-body input[name=id]').val(value.id);
                $('.box_form-body input[name=resId]').val(value.resId);
                $('.box_form-body input[name=resname]').val(value.resname);
                $('.box_form-body input[name=phone]').val(value.phone);
                $('.box_form-body select[name=type]').val(value.type);
                $('.box_form-body input[name=content]').val(value.content);
                $('.box_form-body input[name=repdate]').val(value.repdate);
                $('.box_form-body select[name=state]').val(value.state);
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
        location.href = "/Repair/delete?rid=" + id;
    } else {

    }
}