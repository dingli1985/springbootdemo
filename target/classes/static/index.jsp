<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>jQuery鼠标悬停下拉导航菜单</title>

<link href="css/menu.css" rel="stylesheet" type="text/css" />
<script src="scripts/jquery.min.js" type="text/javascript"></script>
<script src="scripts/tripleDes.js" type="text/javascript"></script>
<script src="scripts/goldbank.js" type="text/javascript"></script>
<link href="styles/main.css" type="text/css" rel="stylesheet" />

<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="js/nav.js" type="text/javascript"></script>
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
				alert(3);
				var ret = showBank(array[0], array[1]);
				
				alert(ret);
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
				<div class="banner_tools_t01"
					onclick="window.open('idcoard.jsp','_blank');">
					<a href="#">帮助文档</a>
				</div>
				<div class="banner_tools_t02">
					<a id="netrate" href="#">网速测试</a>
				</div>
				<div class="banner_tools_t03" onclick="alert('锁屏');">
					<a href="#">锁定屏幕</a>
				</div>
				<div id="logout_div" class="banner_tools_t04" onclick="logout();">
					<a href="#">退出系统 
				</div>
			</div>
		</div>
		<div class="banner_l">
			<div class="banner_tx">
				<div class="banner_tx_c"></div>
			</div>
			<div class="banner_word">
				<ul>
					<li>您好！<br>丁立
					</li>
				</ul>
			</div>
		</div>
	</div>

	<div class="rz_bw_nav001_m">
		<div class="nav">
			<div class="nav_main">
				<ul id="nav_all">
					<li><a href="#">首页</a></li>
					<li><a href="#">关于我们</a>
						<ul style="display: none;">
							<li style="width: 8px;"></li>
							<li><a href="#">公司简介</a></li>
							<li><a href="#">企业文化</a></li>
							<li><a href="#">荣誉资质</a></li>
						</ul></li>
					<li><a href="#">服务项目</a>
						<ul style="display: none;">
							<li style="width: 28px;"></li>
							<li><a href="#">网站建设</a></li>
							<li><a href="#">微信开发</a></li>
							<li><a href="#">电商商务</a></li>
							<li><a href="#">安卓开发</a></li>
							<li><a href="#">苹果开发</a></li>
							<li><a href="#">动画制作</a></li>
							<li><a href="#">艺术设计</a></li>
						</ul></li>
					<li><a href="#">
							<div style="_margin-top: 12px;"></div>合作案例
					</a>
						<ul style="display: none;">
							<li style="width: 52px;"></li>
							<li><a href="#">网站建设</a></li>
							<li><a href="#">微信开发</a></li>
							<li><a href="#">电商商务</a></li>
							<li><a href="#">安卓开发</a></li>
							<li><a href="#">苹果开发</a></li>
							<li><a href="#">动画制作</a></li>
							<li><a href="#">艺术设计</a></li>
						</ul></li>
					<li><a href="#">新闻资讯</a>
						<ul style="display: none;">
							<li style="width: 340px;"></li>
							<li><a href="#">公司动态</a></li>
							<li><a href="#">行业新闻</a></li>
						</ul></li>
					<li><a href="#">信息收集</a>
						<ul style="display: none;">
							<li style="width: 398px;"></li>
							<li><a href="#">设计欣赏</a></li>
							<li><a href="#">资源共享</a></li>
							<li><a href="#">百家杂谈</a></li>
						</ul></li>
					<li><a href="#">养生堂</a>
						<ul style="display: none;">
							<li style="width: 260px;"></li>
							<li><a href="#">开心一刻</a></li>
							<li><a href="#">美食餐饮</a></li>
							<li><a href="#">世界之醉</a></li>
							<li><a href="#">科技之炫</a></li>
							<li><a href="#">植物之美</a></li>
							<li><a href="#">世界之美</a></li>
							<li><a href="#">玩物把件</a></li>
							<li><a href="#">养生保健</a></li>
							<li><a href="#">心灵鸡汤</a></li>
						</ul>
					</li>
				</ul>
				<div class="rz_bw_server_tel">服务热线：138-0000-0000</div>
			</div>
		</div>
	</div>

	<div class="content">
		<div class="main">
			<!-- 内容页 -->
			<div class="main_con2" id="main_con_div">
				<table>
					<tr>
						<td width="7%" align="right">I&nbsp&nbsp&nbspP地址:&nbsp</td>
						<td><input type="text" id="gip" value="10.10.141.104" /></td>
						<td width="7%" align="right">端&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp口:&nbsp</td>
						<td><input type="text" id="gport" value="18080" /></td>
						<td width="7%" align="right">目&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp标:&nbsp</td>
						<td ><select id="target">
								<option value="uac" selected>UAC</option>
								<option value="uap">UAP</option>
						</select></td>
					</tr>
					<tr>
						<td width="7%" align="right">系统编码:&nbsp</td>
						<td><input type="text" id="sysCode" value="SHNGCRM" /></td>
						<td width="7%" align="right">操作编码:&nbsp</td>
						<td><input type="text" id="operCode"
							value="1-SHNGBOSS_CRM-50033" /></td>
						<td width="7%" align="right">从&nbsp&nbsp账&nbsp&nbsp号:&nbsp</td>
						<td><input type="text" id="subAcct" value="fengzj" /></td>
					</tr>
					<tr>
						<td width="7%" align="right">电话号码:&nbsp</td>
						<td><input type="text" id="mobile" value="13712341234" /></td>
						<td width="7%" align="right">操作内容:&nbsp</td>
						<td><input type="text" id="operContent" value="查询详单" /></td>
						<td width="7%" align="right"></td>
						<td></td>
					</tr>
					<tr>
						<td width="7%" align="right">会话验证IP:&nbsp</td>
						<td><input type="text" id="s_ip" value="10.10.156.214" /></td>
						<td width="7%" align="right">会话验证端口:&nbsp</td>
						<td><input type="text" id="s_port" value="9191" /></td>
						<td width="7%" align="right">会话验证Id:&nbsp </td>
						<td><input type="text" id="s_id"
							value="0123456789" />
						</td>
					</tr>
					<tr>
						<td colspan="1">
							<div id="c1" class="button03" onclick='getEnCodeStr();'>触发金库</div>
						</td>
						<td colspan="5"><textarea id="result" rows="3" cols="100"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="1"><input onclick="does_decrypt()" type="button"
							id="triggerGold" value="解密" /></td>
						<td colspan="5"><textarea id="ciphertxt" rows="3" cols="100">EBFF41235F699D95184D59B9CD6FE13D</textarea></td>
					</tr>
				    <tr>
						<td colspan="1"><input onclick="does_decrypt()" type="button"
							id="triggerGold" value="解密" /></td>
						<td colspan="5"><textarea id="ciphertxt" rows="3" cols="100">EBFF41235F699D95184D59B9CD6FE13D</textarea></td>
					</tr>
				</table>
				<!--iframe src="./graphFortFileService.html" scrolling="no" name="iframepage" height="100%" width="100%" frameBorder="0"></iframe-->
			</div>
		</div>
	</div>
</body>
</html>


