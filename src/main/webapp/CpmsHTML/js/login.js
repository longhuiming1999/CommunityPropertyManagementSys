function confirmName() {

	var oUserName = document.getElementById("username");
	var userName = oUserName.value;
	// 书写正则表达式
	var userNamePatt = /^[a-z][a-z0-9]{5,14}$/i;

	// 获得Span对象
	var oSpan = document.getElementById("userSpanId");

	if(userNamePatt.test(userName)) {
		oSpan.innerHTML = "√".fontcolor("green");
		return true;
	} else {
		oSpan.innerHTML = "用户名格式错误！".fontcolor("red") + "长度6-15,英文开头,不能含有特殊字符".fontsize(1).fontcolor("#888888");
		return false;
	}

}

function confirmPwd1() {
	var oSpan = document.getElementById("userPwdId");

	var pwd = document.getElementById("password").value;

	// 书写正则表达式
	var userPwdPatt = /^\w{6,10}$/;

	if(userPwdPatt.test(pwd)) {
		oSpan.innerHTML = "√".fontcolor("green");
		return true;
	} else {
		oSpan.innerHTML = "密码格式不正确".fontcolor("red") + "长度6-10,由英文字母下划线组成,不能含有特殊字符".fontsize(1).fontcolor("#888888");
		return false;
	}
}

function confirmPwd2() {

	// 获取密码确认框的span对象

	var oSpan = document.getElementById("userCfmPwdId");
	// 获取用户输入的两次密码
	var pwd = document.getElementById("password").value;
	var cfmPwd = document.getElementById("cfmpassword").value;

	if(pwd != null && cfmPwd == pwd) {
		oSpan.innerHTML = "√".fontcolor("green");
		return true;
	} else {
		oSpan.innerHTML = "密码输入不一致".fontcolor("red");
		return false;
	}
}

function confirmPhone() {
	// 获取密码确认框的span对象
	var oSpan = document.getElementById("userPhoneId");
	// 获取用户输入的两次密码
	var phone = document.getElementById("phone").value;

	// 书写正则表达式
	var userPhonePatt = /^[1][3-9][0-9]{9}$/;

	if(userPhonePatt.test(phone)) {
		oSpan.innerHTML = "√".fontcolor("green");
		return true;
	} else {
		oSpan.innerHTML = "手机号格式错误！".fontcolor("red") + "11位手机号码".fontsize(1).fontcolor("#888888");
		return false;
	}
}

function confirmEmail() {
	// 获取密码确认框的span对象
	var oSpan = document.getElementById("userEmailId");
	// 获取用户输入的两次密码
	var email = document.getElementById("email").value;

	// 书写正则表达式
	var userEmailPatt = /^[a-z0-9]{5,15}@[a-z0-9]{2,5}\.[a-z0-9]{2,5}$/i;

	if(userEmailPatt.test(email)) {
		oSpan.innerHTML = "√".fontcolor("green");
		return true;
	} else {
		oSpan.innerHTML = "邮箱格式错误！".fontcolor("red") + "正确的邮箱格式".fontsize(1).fontcolor("#888888");
		return false;
	}
}

function register() {
	// 当所有信息格式正确才能提交
	var fName = confirmName();
	var fPwd1 = confirmPwd1();
	var fPwd2 = confirmPwd2();
	var fPhone = confirmPhone();
	var fEmail = confirmEmail();
	if(fName && fPwd1 && fPwd2 && fPhone && fEmail) {
		return true;
	} else {
		return false;
	}

}