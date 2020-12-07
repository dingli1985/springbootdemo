<%@ page contentType="text/html;charset=UTF-8"%>
<html>
	<head>
		<title>金库审批</title>
	</head>
	<body>
		<iframe name="iframe1" src="" scrolling="no" frameborder="0" height="100%" width="100%"></iframe> 
		<form  id="form" action=""   method="post"   target="iframe1">
				<input type="hidden" id="operCode" name="operCode" value=""/>
				<input type="hidden" id="mainLoginName" name="mainLoginName" value=""/>
				<input type="hidden" id="subLoginName" name="subLoginName" value=""/>
				<input type="hidden" id="operContent" name="operContent" value=""/>
				<input type="hidden" id="appCode" name="appCode" value=""/>
				<input type="hidden" id="svcNum" name="svcNum" value=""/>
				<input type="hidden" id="sessionId" name="sessionId" value=""/>
				<input type="hidden" id="serverIp" name="serverIp" value=""/>
				<input type="hidden" id="serverPort" name="serverPort" value=""/>
				<input type="hidden" id="checkSessionUrl" name="checkSessionUrl" value=""/>			
		</form>
	</body>
 	 <script>
	    var obj = window.dialogArguments;
		document.getElementById("operCode").value=obj.operCode;
		document.getElementById("mainLoginName").value=obj.mainLoginName;
		document.getElementById("subLoginName").value=obj.subLoginName;
		document.getElementById("operContent").value=encodeURI(obj.operContent);
		document.getElementById("appCode").value=obj.appCode;
		document.getElementById("svcNum").value=obj.mobile;
		document.getElementById("sessionId").value=obj.sessionId;
		document.getElementById("serverIp").value=obj.serverIp;
	    document.getElementById("serverPort").value=obj.serverPort;
	    document.getElementById("checkSessionUrl").value=obj.checkSessionUrl;
		document.getElementById("form").action=obj.action;
		document.getElementById("form").submit();
	</script>
</html>