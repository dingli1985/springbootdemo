/**
 * function getEnCodeStr(){
     var operCode=document.getElementById("operCode").value;
     var subAcct=document.getElementById("subAcct").value;
     $.ajax({
		type: "POST",
		url: "<%=basePath%>gold/DesEnCode",
	    data : "operCode=" + operCode + "&subAcct=" + subAcct,
		success : function(msg) {
		   var array = msg.split("==");
		   showBank(array[0], array[1]);
		}
     });
}
 */


function showBank(operCodeDes, subAcctDes) {
	var url = "jsp/goldbank/goldbank!goldBankIframeAction.action";
	var requestIp = document.getElementById("gip").value;
	var requestPort = document.getElementById("gport").value;
	var sysCode = document.getElementById("sysCode").value;
	var mobile = document.getElementById("mobile").value;
	var operContent = document.getElementById("operContent").value;
	var s_ip = document.getElementById("s_ip").value;
	var s_port = document.getElementById("s_port").value;
	var s_id = document.getElementById("s_id").value;
	var iWidth = 800; //模态窗口宽度
	var iHeight = 600;//模态窗口高度
	var iTop = (window.screen.height - iHeight - 100) / 2;
	var iLeft = (window.screen.width - iWidth) / 2;
	var source = document.getElementById("target").options;
	var target = "";
	for (var i = 0; i < source.length; i++) {
		if (source[i].selected) {
			target = source[i].value;
		}
	}
	url = "http://" + requestIp + ":" + requestPort + "/" + target + "/" + url;
	var obj = new Object();
	obj.operCode = operCodeDes;
	obj.mainLoginName = "";
	obj.subLoginName = subAcctDes;
	obj.appCode = sysCode;
	obj.mobile = mobile;
	obj.sessionId = s_id;
	obj.serverIp = s_ip;
	obj.serverPort = s_port;
	obj.operContent = operContent;
	obj.doneCodeToken = "123456"; //可选
	obj.checkSessionUrl = "";
	obj.action = url;
	var returnValue = window
			.showModalDialog(
					"goldIframe?id=" + new Date(),
					obj,
					"dialogHeight:"
							+ iHeight
							+ "px; dialogWidth:"
							+ iWidth
							+ "px; toolbar:no; menubar:no;  titlebar:no; scrollbars:yes; resizable:no; location:no; status:no;left:"
							+ iLeft + "px;top:" + iTop + "px;");
	//document.getElementById("result").value = returnValue;
	//alert(returnValue);
	trippleDecrypt(returnValue);
	return returnValue;
}

/**
 * 解密
 */
function doTripleDecrypt(cipherkey, cipherText) {
	if (false == checkCipherKey("3DES", cipherkey)) {
		return;
	}
	if (typeof (cipherText) == "undefined") {
		return;
	}
	var plainText = fix_des_result(des(cipherkey,
			hexToStringForDES(cipherText), 0, 0));
	return plainText;
}

/**
 * 加密
 */
function doTripleEncrypt(cipherkey, plaintext) {
	if (false == checkCipherKey("3DES", cipherkey)) {
		return;
	}
	var ciphertext = stringToHexForDES(des(cipherkey, suffix_8Blank(plaintext),
			1, 0));
	return ciphertext;
}

var cipher_key = "cZzvzmbjZRWkdjZwj2BNWT1P";// 密钥

function trippleEncrypt(plaintext) {
	//alert(plaintext + "  加密后：\n" + doTripleEncrypt(cipher_key, plaintext));
	document.getElementById("result").value = doTripleEncrypt(cipher_key, plaintext);
}

function trippleDecrypt(ciphertext) {
	//alert(ciphertext + "  解密后：\n" + doTripleDecrypt(cipher_key, ciphertext));
	document.getElementById("result").value =encodeURIComponent(doTripleDecrypt(cipher_key, ciphertext));
}


function does_encrypt() {
	var plaintext = document.getElementById("plaintxt").value;
	//alert(plaintext);
	alert(plaintext + "  加密后：\n" + doTripleEncrypt(cipher_key, plaintext));
}

function does_decrypt() {
	var ciphertext = document.getElementById("ciphertxt").value;
	alert(ciphertext + "  解密后：\n" + doTripleDecrypt(cipher_key, ciphertext));
}