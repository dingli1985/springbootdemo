<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>HTML5互动股票图形数据 - 脚本之家</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" type="text/css" href="css/hsd.css?d3fa1" />
<link rel="stylesheet" type="text/css" href="css/finance.css?d3fa1" />
</head>

<body>

<div id="content-container">
	<div id="content">
		<div id="finance">
			<div id="labels">
				<div id="financeTitle">
					NASDAQ:GOOG</div>
				<div id="time">
					<a onClick="HumbleFinance.zoom(5);">1w</a>
					<a onClick="HumbleFinance.zoom(21);">1m</a>
					<a onClick="HumbleFinance.zoom(65);">3m</a>
					<a onClick="HumbleFinance.zoom(127);">6m</a>
					<a onClick="HumbleFinance.zoom(254);">1y</a>
					<a onClick="HumbleFinance.zoom(1265);">5y</a> </div>
				<div id="h">
				</div>
			</div>
		</div>
	</div>
</div>
</div>
<script src="js/hsd.js?d3fa1"></script>
<script src="js/prototype.min.js?d3fa1"></script>
<script src="js/Finance.js?d3fa1"></script>
<script src="js/excanvas.js?d3fa1"></script>
<script src="js/base64.js?d3fa1"></script>
<script src="js/canvas2image.js?d3fa1"></script>
<script src="js/canvastext.js?d3fa1"></script>
<script src="js/flotr.js?d3fa1"></script>
<script src="js/HumbleFinance.js?d3fa1"></script>
<script src="js/data.js?d3fa1"></script>
<script src="js/demo.js?d3fa1"></script>
<div style="text-align:center;clear:both">
<p>适用浏览器：IE8、360、FireFox、Chrome、Safari、Opera、傲游、搜狗、世界之窗. </p>
<p>来源：<a href="http://www.jb51.net/" target="_blank">脚本之家</a></p>
</div>

</body>

</html>

