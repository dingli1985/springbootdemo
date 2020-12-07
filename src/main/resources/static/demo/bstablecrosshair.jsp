﻿<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="JS代码,表格高亮,交叉表,jquery" />
<meta name="description" content="jquery实现的漂亮的表格交叉高亮显示效果，更多表格高亮,交叉表,jquery请访问脚本之家JS代码频道。" />
<title>jquery实现的漂亮的表格交叉高亮显示效果_脚本之家</title>
<link href="styles.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="jquery.js"></script>
<script language="javascript" type="text/javascript" src="jquery.bstablecrosshair.js"></script>
</head>d
<body>

<div>
<h2 id="x">Demonstration of BS Table Crosshair</h2>
</div>

<table style="border:2px solid #444;border-collapse:collapse;" id="mytable">
<tr>
<td>
Product
</td>
<td>
Price
</td>
<td>
ID Code
</td>
<td>
Quality
</td>
<td>
Exp Date
</td>
</tr>
<tr>
<td>Pro 1</td>
<td>51 $</td>
<td>4587</td>
<td>Good</td>
<td>02/01/2009</td>
</tr>
<tr>
<td>Pro 2</td>
<td>151 $</td>
<td>4847</td>
<td>Great</td>
<td>10/05/2009</td>
</tr>
<tr>
<td>Pro 3</td>
<td>34 $</td>
<td>5682</td>
<td>Good</td>
<td>01/08/2010</td>
</tr>
<tr>
<td>Pro 4</td>
<td>28 $</td>
<td>5147</td>
<td>Bad</td>
<td>02/09/2009</td>
</tr>
<tr>
<td>Pro 5</td>
<td>151 $</td>
<td>7874</td>
<td>Good</td>
<td>10/10/2009</td>
</tr>
<tr>
<td>Pro 6</td>
<td>11 $</td>
<td>4017</td>
<td>Good</td>
<td>05/07/2009</td>
</tr>
</table>
<br />
<hr />
<h4>By Behnam Soltanrezaey</h4><script type="text/javascript">

$.bstablecrosshair('mytable',{color:'#444',background:'#aaa','foreground':'#fff'});

</script>


<div style="text-align:center;clear:both">
<p>来源：<a href="http://www.jb51.net" target="_blank">Behnam</a>　代码整理：<a href="http://www.jb51.net" target="_blank">脚本之家</a>　感谢：<a href="http://www.jb51.net" target="_blank">neinei</a></p>
<p>转载请注明出处，此代码仅供学习交流，请勿用于商业用途。</p>
<p><script language="javascript" src="http://www.sharejs.com/js/720.js"></script></p>
</div>
</body>
</html>

