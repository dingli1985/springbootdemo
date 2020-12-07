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
<title>TableDemo</title>

</head>

<body>
<table class="list_table">
	<tr>
  		<th class="w40">编号</th>
        <th>公司名称</th>
        <th>分类</th>
        <th>电话</th>        
        <th>地址</th>
        <th class="w40">网址</th>
        <th class="w40">资料库</th>        
        <th class="w40">性质</th>
        <th class="w40">人数</th>
        <th class="w40">面积</th>
        <th class="w40">资金</th>
        <th class="w40">操作</th>
    	<th class="w40">移动</th>
    </tr>
    <tr>
      <td>1</td>
      <td>2</td>
      <td>3</td>
      <td>4</td>
      <td>5</td>
      <td>6</td>
      <td>7</td>
      <td>8</td>
      <td>9</td>
      <td>10</td>
      <td>11</td>
      <td>12</td>
      <td>13</td>
    </tr>
    <tr>
      <td>1</td>
      <td>2</td>
      <td>3</td>
      <td>4</td>
      <td>5</td>
      <td>6</td>
      <td>7</td>
      <td>8</td>
      <td>9</td>
      <td>10</td>
      <td>11</td>
      <td>12</td>
      <td>13</td>
    </tr>
    <tr>
      <td>1</td>
      <td>2</td>
      <td>3</td>
      <td>4</td>
      <td>5</td>
      <td>6</td>
      <td>7</td>
      <td>8</td>
      <td>9</td>
      <td>10</td>
      <td>11</td>
      <td>12</td>
      <td>13</td>
    </tr>
    <tr>
      <td>1</td>
      <td>2</td>
      <td>3</td>
      <td>4</td>
      <td>5</td>
      <td>6</td>
      <td>7</td>
      <td>8</td>
      <td>9</td>
      <td>10</td>
      <td>11</td>
      <td>12</td>
      <td>13</td>
    </tr>
    <tr>
      <td>1</td>
      <td>2</td>
      <td>3</td>
      <td>4</td>
      <td>5</td>
      <td>6</td>
      <td>7</td>
      <td>8</td>
      <td>9</td>
      <td>10</td>
      <td>11</td>
      <td>12</td>
      <td>13</td>
    </tr>
    <tr>
      <td>1</td>
      <td>2</td>
      <td>3</td>
      <td>4</td>
      <td>5</td>
      <td>6</td>
      <td>7</td>
      <td>8</td>
      <td>9</td>
      <td>10</td>
      <td>11</td>
      <td>12</td>
      <td>13</td>
    </tr>
        <tr>
      <td>1</td>
      <td>2</td>
      <td>3</td>
      <td>4</td>
      <td>5</td>
      <td>6</td>
      <td>7</td>
      <td>8</td>
      <td>9</td>
      <td>10</td>
      <td>11</td>
      <td>12</td>
      <td>13</td>
    </tr>
        <tr>
      <td>1</td>
      <td>2</td>
      <td>3</td>
      <td>4</td>
      <td>5</td>
      <td>6</td>
      <td>7</td>
      <td>8</td>
      <td>9</td>
      <td>10</td>
      <td>11</td>
      <td>12</td>
      <td>13</td>
    </tr>
        <tr>
      <td>1</td>
      <td>2</td>
      <td>3</td>
      <td>4</td>
      <td>5</td>
      <td>6</td>
      <td>7</td>
      <td>8</td>
      <td>9</td>
      <td>10</td>
      <td>11</td>
      <td>12</td>
      <td>13</td>
    </tr>
</table>
<style type="text/css">

table.list_table{
	font-family:Arial, Helvetica, sans-serif;
	margin-top:10px;
	border-collapse:collapse;
	border:1px solid #888;
	width:100%;
	}

table.list_table th {
	vertical-align:baseline;
	padding:5px 5px 5px 5px;
	background-color:#f2f2f2;
	border:1px solid #ccc;
	text-align:left;
	text-align:center;
	}

table.list_table td {
	vertical-align:text-top;
	padding:5px 5px 5px 5px;
	background-color:#FFF;
	border:1px solid #ccc;
	text-align:center;
}
table.list_table tr.hover td {
	background-color:#F4FAFB;
}

table.list_table tr.odd td {
	background-color:red;
}

table.list_table tr td.reds{ background:#F00;}
table.list_table tr.bg td.reds {background：#f00;}
</style>
<script>
	var trarr = document.getElementsByTagName('tr');
	var yuanclassname = '';
	var yuantdclassname=new Array();
	for(var i=0, j=trarr.length; i < j; i++){
		if(i % 2 == 0){
			trarr[i].className = 'hover';
		}else{
			trarr[i].className = '';	
		}
	}
	for(var i=0, j=trarr.length; i < j; i++){
		trarr[i].onmouseover=function(){
			yuanclassname = this.className;
			this.className = 'odd';
		}
		trarr[i].onmouseout=function(){
			this.className = yuanclassname;
		}
		for(var x = 0, z = trarr[i].childNodes.length; x < z; x++){
			if(trarr[i].childNodes[x].nodeName == 'TD'){
				trarr[i].childNodes[x].onmouseover=function(){
					var num=0;
					var obj=this;
					while(obj.previousSibling){
						num++
						obj=obj.previousSibling;
					}
					for(var i=0, j=trarr.length; i < j; i++){
						yuantdclassname[i] = trarr[i].childNodes[num].className;
						trarr[i].childNodes[num].className = 'reds';
					}
				}
				
				trarr[i].childNodes[x].onmouseout=function(){
					var num=0;
					var obj=this;
					while(obj.previousSibling){
						num++
						obj=obj.previousSibling;
					}
					for(var i=0, j=trarr.length; i < j; i++){
						trarr[i].childNodes[num].className = yuantdclassname[i];
					}
				}		
			}
		}
	}
</script>
</body>
</html>

