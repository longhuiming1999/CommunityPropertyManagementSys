$('.display_form').click(function (){
	   
    var index = $(this).data('index');
    console.log(index);
    var first = index.indexOf('[');
    var indexValue  = index.trim().substring(first+1,index.length-1).split(', ');
    var value = {};
    indexValue.forEach((item)=>{
    	var arr = item.split('=');
    	value[arr[0]] = arr[1];
    })
	$('.box_form-body input[name=id]').val(value.id);
    $('.box_form-body input[name=resId]').val(value.resId);
    $('.box_form-body input[name=resName]').val(value.resName);
    $('.box_form-body input[name=resPlateNum]').val(value.resPlateNum);
    $('.box_form-body input[name=sellMoney]').val(value.sellMoney);
    $('.box_form-body input[name=isRent]').val(value.isRent);
	$('.box').show();
})

$('#sub').click(function(){
	$('.box').hide();
})

$('#cancel').click(function(){
	$('.box').hide();
})