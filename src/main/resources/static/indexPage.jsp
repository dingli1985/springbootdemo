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
<title>金库测试页面</title>
<script src="scripts/jquery.min.js" type="text/javascript"></script>
<script src="scripts/tripleDes.js" type="text/javascript"></script>
<script src="scripts/goldbank.js" type="text/javascript"></script>
<link href="styles/main.css" type="text/css" rel="stylesheet" />

<script type="text/javascript">
function getEnCodeStr(){
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
</script>
</head>

<body>
	<div id="indexLockPing"
		style="background: url(images/sp_bg.jpg) no-repeat bottom left;">
	</div>
	<!-- 顶层 banner -->
	<div class="banner">
		<div class="banner_logo">
			<img src="images/banner_logo_SHANG_HAI.png" />
		</div>
		<div class="banner_r">
			<div class="banner_tools">
				 <div class="banner_tools_t01" onclick="window.open('idcoard.jsp','_blank');"><a href="#">帮助文档</a></div>
	             <div class="banner_tools_t02"><a id="netrate" href="#">网速测试</a></div>
	             <div class="banner_tools_t03" onclick="alert('锁屏');"><a href="#">锁定屏幕</a></div>
	             <div id="logout_div" class="banner_tools_t04" onclick="logout();" ><a href="#" >退出系统</div>
			</div>
		</div>
		<div class="banner_l">
			<div class="banner_tx">
				<div class="banner_tx_c"></div>
			</div>
			<div class="banner_word">
				<ul >
					<li>您好！<br>丁立
					</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- 一级菜单 -->
	<div class="nav">
		<div class="nav_l" id="nav_l_div">
			<ul>
			
				<li id="pIndex">首 页</li>

				<li id="auditPage">帐号类稽核</li>


				<li id="mutualPage">互斥类稽核</li>

				<li id="logininfoPage">登录类稽核</li>
			</ul>
		</div>
	</div>

	<!-- 底层 content -->
	<div class="content">
		<div class="main">
			<!-- 页签 -->
			<div class="main_tab2">
				<div class="tab_b"></div>
				<div id="main_tab_div"></div>
				<div class="tab_f"></div>
			</div>
			<!-- 内容页 -->
			<div class="main_con2" id="main_con_div">
					<table>
		<tr>
			<td>I&nbsp&nbsp&nbsp&nbsp&nbspP地址:&nbsp <input type="text"
				id="gip" value="10.10.141.104" />
			</td>
			<td>端&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp口:&nbsp <input
				type="text" id="gport" value="18080" />
			</td>
			<td><select id="target">
					<option value="uac" selected>UAC</option>
					<option value="uap">UAP</option>
			</select></td>
		</tr>
		<tr>
			<td>系统编码:&nbsp <input type="text" id="sysCode" value="SHNGCRM" />
			</td>
			<td>操作编码:&nbsp <input type="text" id="operCode"
				value="1-SHNGBOSS_CRM-50033" />
			</td>
			<td>从&nbsp&nbsp账&nbsp&nbsp号:&nbsp <input type="text"
				id="subAcct" value="fengzj" />
			</td>
		</tr>
		<tr>
			<td>电话号码:&nbsp <input type="text" id="mobile"
				value="13712341234" />
			</td>
			<td>操作内容:&nbsp <input type="text" id="operContent" value="查询详单" />
			</td>
			<td></td>
		</tr>
		<tr>
			<td>会话验证IP:&nbsp <input type="text" id="s_ip"
				value="10.10.156.214" />
			</td>
			<td>会话验证端口:&nbsp <input type="text" id="s_port" value="8080" />
			</td>
			<td>会话验证Id:&nbsp <input type="text" id="s_id" value="0123456789" />
			</td>
		</tr>
		<tr>
			<td><input onclick="getEnCodeStr()" type="button"
				id="triggerGold" value="触发金库" /> <input type="password"
				id="pwd_value" /></td>
		</tr>
		<tr>
			<td colspan="3"><textarea id="result" rows="3" cols="100">
                                                
                   </textarea></td>
		</tr>
		<tr>
			<td rowspan="4">
				<div id="c1" class="button03" onclick='does_decrypt();'>同意</div>
			</td>
			<td rowspan="4"><input type="text" id="ciphertxt"
				value="EBFF41235F699D95184D59B9CD6FE13D" /></td>
		</tr>
		<tr>
		    <td rowspan="4">
		        	<ul>
						 <li style="text-decoration:underline;list-style-type:none;">dsf</li>
						 <li style="text-decoration:none;list-style-type:none;">333</li>
						 <li style="text-decoration:underline;list-style-type:none;">dsf123</li>
		           </ul>	
		    </td>
		</tr>
	</table>
	
	
			</div>
		</div>
	</div>
</body>
</html>

