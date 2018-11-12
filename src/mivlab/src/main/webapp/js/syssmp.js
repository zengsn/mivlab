
function sybtdown(svlt, tname) {
	var pnum = $("#hpagenum").val();
	if (Number(pnum) != 1) {
		$("#fm").prop("action", svlt);
		$("#pt").val(tname);
		$("#fm").submit();
	} else {
		return;
	}
}
function syybtdown(svlt,tname) {
	var pnum = $("#hpagenum").val();
	if (Number(pnum) > 1) {
		$("#fm").prop("action", svlt);
		$("#pt").val(tname);
		$("#fm").submit();
	} else {
		return;
	}
}

function xyybtdown(svlt,tname) {
	var pnum = $("#hpagenum").val();
	var pnums = $("#hpagenums").val();
	
	//alert(Number(pnum) < Number(pnums));
	if (Number(pnum) < Number(pnums)) {
		$("#fm").prop("action", svlt);
		$("#pt").val(tname);
		$("#fm").submit();
	} else {
		return;
	}
}

function wybtdown(svlt,tname) {
	var pnum = $("#hpagenum").val();
	var pnums = $("#hpagenums").val();
	if (Number(pnum) != Number(pnums)) {
		$("#fm").prop("action", svlt);
		$("#pt").val(tname);
		$("#fm").submit();
	} else {
		return;
	}
}
//验证非负整数
function ckznum(znum) {
    var checkNum = /^[1-9]\d*|0$/;
    if (checkNum.test(znum)) {
        return true;
    } else {
        return false;
    }
}
//验证非负浮点数
function ckfffds(znum) {
    var checkNum= /^\d+(\.\d+)?$/;
    if(checkNum.test(znum)){
        return true;
    }else{
        return false;
    }
}
//验证邮箱格式
function ckemail(email){
    var checkEmail=/[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?/;
    if(checkEmail.test(email)){
        return true;
    }else{
        return false;
    }
}
//验证手机号
function ckPhone(phone){
    var checkPhone=/^1[3|4|5|7|8]\d{9}$/ ;
    if(checkPhone.test(phone)){
        return true;
    }else{
        return false;
    }
}