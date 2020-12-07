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
<title>表格排序插件blueTable</title>
<script type="text/javascript" src="jquery.js" charset="utf-8"></script>
<script type="text/javascript" src="blueTable.js" charset="utf-8"></script>
<script type='text/javascript'>

function loaded(){
 var $tb =$('#tb')
 $tb.blueTable({
			  SelectRowOrder:{index:10},//设置选中行排序坐标
			  DataSize:{index:8},//设置数据大小排序坐标
			  ExtensionName:{index:9,extension:'extension',name:'name',strongClass:'ext'},
			  NotOrder:[],//过滤不需要排序的列
			  HighLightColClass:'highlight'
			  },finish)
	.find('tbody tr').hover(function(){$(this).addClass('over');},
							function(){$(this).removeClass('over');})
		.find('input').bind('click',function(){
									$(this).parent().parent().toggleClass('select');
									this.src = this.checked?'checked.png':'checkbox.png';
									});
  function finish(CurrentIndex,BeforeIndex){
	  //排序完成之后需要执行的函数 可以收到一个对象作为参数，前一次排序的对象排序列坐标和当前被排序列坐标
	var th	= $tb.find('th:eq('+CurrentIndex+')'),
	    th1 = $tb.find('th:eq('+BeforeIndex+')');
		
	th.hasClass('up')?th.removeClass('up').addClass('down'):
					  th.removeClass('down').addClass('up');
	(BeforeIndex!=CurrentIndex)&&th1.removeClass();
	}
	
}
	
$(loaded);	
	

</script>
<style type="text/css">
#tb{
	background:url(room-bg.gif) transparent repeat-x 0 -13px;
	table-layout:auto;
	font-family:Arial, Helvetica, sans-serif;
	font-size:12px;
	border:1px #CCC solid;
	text-align:center;
	border-collapse:collapse;
	width:950px;
	cursor:default;
	}
#tb th{
	padding:5px;
	color:#03C;
	padding: .6em;
	}	
#tb th.up{
	background:transparent url(up.png) no-repeat center 3px
	}
#tb th.down{
	background:transparent url(down.png) no-repeat center 3px
	}

#tb tbody tr.select{background:#EFe}
#tb tbody tr.select td{color:#900;border-bottom-color:#0CC}
#tb tbody tr.over{background:#EFF}
#tb tbody tr.over td{color:#03c}
#tb td{
	border-bottom:1px #ccc solid;
	border-top:1px #ccc solid;
	padding:.2em;
	color:#000;
	}
#tb td.highlight{color:#03c}	
#tb span {padding:.2em}	
#tb colgroup col {
	 background-image:none;/*IE下的colgroup会继承table的背景设置 所以这里设置none*/
	}

#tb colgroup col.c2{text-align:right;} 
#tb td+td+td+td+td+td+td+td+td{text-align:right;}
#tb td:last-child {text-align:center }	/*发现IE7并不支持last:child  倒是支持first:child*/
#tb input {cursor:pointer}
</style>
</head> 

<body>
<div id="time"></div>
<table id="tb" class="tb2">
  <caption>blueTable</caption>
  <colgroup><col class="cc" /><col /><col /><col /><col /><col /><col /><col />
  <col class="c2" /><col class="c2" /><col  />
  </colgroup>
  <thead>
    <tr>
      <th>number</th>
      <th>date</th>
      <th>letter and number</th>
      <th>digit</th>
      <th>contains</th>
      <th>price</th>
      <th>price total</th>
      <th>case</th>
      <th>dataSize</th>
      <th><span ID='name'>name</span>/<span ID='extension'>type</span></th>
      <th>behavior</th>
    </tr>
  </thead>
  <tbody>
    <tr class="a">
      <td>u0628</td>
      <td>9/14/2008</td>
      <td>Std Hotel Room 2 Double (27 left)</td>
      <td>5</td>
      <td>4 人</td>
      <td>$109.00</td>
      <td>￥436.00</td>
      <td>衣服1-2</td>
      <td>0.9gb</td>
      <td>new.exe</td>
      <td><input type='image' src='checkbox.png' /></td>
    </tr>
    <tr >
      <td>u0631</td>
      <td>10/4/2008</td>
      <td>Lodge Rm/Shared Bath Q (4 left)</td>
      <td>15</td>
      <td>2 人</td>
      <td>$109.00</td>
      <td>￥436.00</td>
      <td>衣服1-1</td>
      <td>1KB</td>
      <td>123.exe</td>
      <td><input type='image' src='checkbox.png' /></td>
    </tr>
    <tr >
      <td >u0636</td>
      <td >3/18/2008</td>
      <td >Std Hotel Room Q (34 left)</td>
      <td >7</td>
      <td >2 人</td>
      <td >$117.00</td>
      <td >￥466.00</td>
      <td>衣服1-3</td>
      <td>1.1kb</td>
      <td>压缩包.rar</td>
      <td><input type='image' src='checkbox.png' /></td>
    </tr>
    <tr >
      <td>u0638</td>
      <td >9/19/2008</td>
      <td >Std Hotel Room 2 Q (28 left)</td>
      <td >6</td>
      <td >4 人</td>
      <td >$117.00</td>
      <td>￥466.00</td>
      <td>衣服1-6</td>
      <td>100.3KB</td>
      <td>17173.rar</td>
      <td><input type='image' src='checkbox.png' /></td>
    </tr>
    <tr >
      <td>u0612</td>
      <td >9/1/2008</td>
      <td >Studio Condo (10 left)</td>
      <td >5</td>
      <td >4 人</td>
      <td >$149.00</td>
      <td>￥596.00</td>
      <td>衣服1-5</td>
      <td>1.7KB</td>
      <td>4589.txt</td>
      <td><input type='image' src='checkbox.png' /></td>
    </tr>
    <tr >
      <td>u0626</td>
      <td >9/13/2008</td>
      <td >Hotel Jr Suite K (4 left)</td>
      <td >4</td>
      <td >2 人</td>
      <td >$149.00</td>
      <td>￥596.00</td>
      <td>衣服1-4</td>
      <td>350.8KB</td>
      <td>17173.html</td>
      <td><input type='image' src='checkbox.png' /></td>
    </tr>
    <tr >
      <td>u0641</td>
      <td >9/22/2008</td>
      <td >Hotel Superior K (26 left)</td>
      <td >3</td>
      <td >2 人</td>
      <td >$149.00</td>
      <td>￥596.00</td>
      <td>袜子1-2</td>
      <td>1.4KB</td>
      <td>1.html</td>
      <td><input type='image' src='checkbox.png' /></td>
    </tr>
    <tr >
      <td>u0602</td>
      <td >8/31/2008</td>
      <td >1 Bdrm Condo K (96 left)</td>
      <td >2</td>
      <td >4 人</td>
      <td >$169.00</td>
      <td>￥676.00</td>
      <td>袜子1-6</td>
      <td>1.2KB</td>
      <td>歌曲.mp3</td>
      <td><input type='image' src='checkbox.png' /></td>
    </tr>
    <tr >
      <td>u0616</td>
      <td >10/8/2008</td>
      <td >Studio Condo Murphy (5 left)</td>
      <td>NaN</td>
      <td >4 人</td>
      <td >$169.00</td>
      <td>￥676.00</td>
      <td>袜子1-9</td>
      <td>1.1KB</td>
      <td>歌曲.mp4</td>
      <td><input type='image' src='checkbox.png' /></td>
    </tr>
    <tr >
      <td>u0623</td>
      <td >10/2/2008</td>
      <td >Studio Cabin Q (6 left)</td>
      <td >1</td>
      <td >2 人</td>
      <td >$169.00</td>
      <td>￥676.00</td>
      <td>袜子1-22</td>
      <td>1024KB</td>
      <td>歌曲10.mp4</td>
      <td><input type='image' src='checkbox.png' /></td>
    </tr>
    <tr >
      <td>u0633</td>
      <td >9/16/2008</td>
      <td >Studio Q/Murphy (6 left)</td>
      <td >2</td>
      <td >4 人</td>
      <td >$169.00</td>
      <td>￥676.00</td>
      <td>袜子2-2</td>
      <td>1.8MB</td>
      <td>王者归来.png</td>
      <td><input type='image' src='checkbox.png' /></td>
    </tr>
    <tr >
      <td>u0637</td>
      <td >10/5/2008</td>
      <td >Lodge Room Q (4 left)</td>
      <td >1</td>
      <td >2 人</td>
      <td >$169.00</td>
      <td>￥676.00</td>
      <td>袜子3-2</td>
      <td>1.4MB</td>
      <td>刘德华.mp3</td>
      <td><input type='image' src='checkbox.png' /></td>
    </tr>
 	   <tr >
      <td>u0622</td>
      <td >9/11/2008</td>
      <td >Hotel Loft Ste K/Q (3 left)</td>
      <td >2</td>
      <td >4 人</td>
      <td >$179.00</td>
      <td>￥716.00</td>
      <td>裤子3-2</td>
      <td>1.6MB</td>
      <td>function.js</td>
      <td><input type='image' src='checkbox.png' /></td>
    </tr>
    <tr >
      <td>u0629</td>
      <td >10/10/2008</td>
      <td >1 Bdrm Condo K (76 left)</td>
      <td >1</td>
      <td >4 人</td>
      <td >$179.00</td>
      <td>￥716.00</td>
      <td>裤子3-4</td>
      <td>1.2MB</td>
      <td>c#.cs</td>
      <td><input type='image' src='checkbox.png' /></td>
    </tr>
    <tr >
      <td>u0603</td>
      <td >9/8/2008</td>
      <td >Hotel Loft K/Q (16 left)</td>
      <td >2</td>
      <td >4 人</td>
      <td >$189.00</td>
      <td>￥756.00</td>
      <td>袜子1-20</td>
      <td>1.1MB</td>
      <td>asp.net-c#.cs</td>
      <td><input type='image' src='checkbox.png' /></td>
    </tr>
    <tr >
      <td>u0632</td>
      <td >9/15/2008</td>
      <td >Hotel Loft K/2T (15 left)</td>
      <td >3</td>
      <td >4 人</td>
      <td >$189.00</td>
      <td>￥756.00</td>
      <td>衣服1-22</td>
      <td>1.6MB</td>
      <td>c#-asp.net.cs</td>
      <td><input type='image' src='checkbox.png' /></td>
    </tr>
    <tr >
      <td>u0619</td>
      <td >10/1/2008</td>
      <td >Studio Cabin Firepl K (6 left)</td>
      <td >1</td>
      <td >2 人</td>
      <td >$209.00</td>
      <td>￥836.00</td>
      <td>衣服1-23</td>
      <td>1.5MB</td>
      <td>jquery.1.3.min.js</td>
      <td><input type='image' src='checkbox.png' /></td>
    </tr>
    <tr >
      <td>u0608</td>
      <td >10/7/2008</td>
      <td >1 Bdrm Condo with Den K (1 left)</td>
      <td >1</td>
      <td >6 人</td>
      <td >$222.00</td>
      <td>￥886.00</td>
      <td>靴子4-22</td>
      <td>1.9MB</td>
      <td>jquery.1.26.min.txt</td>
      <td><input type='image' src='checkbox.png' /></td>
    </tr>
    <tr >
      <td>u0620</td>
      <td >9/5/2008</td>
      <td >2 Bdrm Condo K/K (25 left)</td>
      <td >2</td>
      <td >6 人</td>
      <td >$229.00</td>
      <td>￥916.00</td>
      <td>衣服1-17</td>
      <td>1.42MB</td>
      <td>jquery.1.31.min.js</td>
      <td><input type='image' src='checkbox.png' /></td>
    </tr>
    <tr >
      <td>u0630</td>
      <td >9/7/2008</td>
      <td >2 Bdrm Condo K/2T (57 left)</td>
      <td >3</td>
      <td >6 人</td>
      <td >$229.00</td>
      <td>￥916.00</td>
      <td>靴子4-12</td>
      <td>1.55MB</td>
      <td>class.cs</td>
      <td><input type='image' src='checkbox.png' /></td>
    </tr>
    <tr >
      <td>u0634</td>
      <td >10/11/2008</td>
      <td >2 Bdrm Condo K/Q (88 left)</td>
      <td>2</td>
      <td>6 人</td>
      <td>$229.00</td>
      <td>￥916.00</td>
      <td>衣服1-25</td>
      <td>1.48MB</td>
      <td>jquery.1.11.min.js</td>
      <td><input type='image' src='checkbox.png' /></td>
    </tr>
    <tr >
      <td>u0639</td>
      <td >9/20/2008</td>
      <td >1 Bdrm K/Murphy (19 left)</td>
      <td >2</td>
      <td >4 人</td>
      <td >$229.00</td>
      <td>￥916.00</td>
      <td>袜子2-2</td>
      <td>1.4KB</td>
      <td>obox.xml</td>
      <td><input type='image' src='checkbox.png' /></td>
    </tr>
    <tr >
      <td>u0614</td>
      <td >9/2/2008</td>
      <td >2 Bdrm Townhome (7 left)</td>
      <td >2</td>
      <td >4 人</td>
      <td >$239.00</td>
      <td>￥956.00</td>
      <td>内衣5-32</td>
      <td>2.08KB</td>
      <td>obox.html</td>
      <td><input type='image' src='checkbox.png' /></td>
    </tr>
    <tr >
      <td>u0610</td>
      <td >9/10/2008</td>
      <td >1 Bdrm Loft K/Q+2T/Murphy (5 left)</td>
      <td >5</td>
      <td >8 人</td>
      <td >$269.00</td>
      <td>￥1076.00</td>
      <td>靴子4-21</td>
      <td>1.4GB</td>
      <td>members.xml</td>
      <td><input type='image' src='checkbox.png' /></td>
    </tr>
    <tr >
      <td>u0625</td>
      <td >9/12/2008</td>
      <td >2 Bdrm K/Q/Murphy (6 left)</td>
      <td >3</td>
      <td >6 人</td>
      <td >$269.00</td>
      <td>￥1076.00</td>
      <td>靴子5-2</td>
      <td>1.1GB</td>
      <td>歌曲4.mp3</td>
      <td><input type='image' src='checkbox.png' /></td>
    </tr>
    <tr >
      <td>u0640</td>
      <td >9/21/2008</td>
      <td >Exec. 2 Bdrm K/2Q/Murphy (2 left)</td>
      <td >4</td>
      <td >8 人</td>
      <td >$269.00</td>
      <td>￥1076.00</td>
      <td>内衣6-2</td>
      <td>1.0GB</td>
      <td>obosx.xml</td>
      <td><input type='image' src='checkbox.png' /></td>
    </tr>
    <tr >
      <td>u0606</td>
      <td >9/26/2008</td>
      <td >2 Bdrm Cabin K/Q+T (2 left)</td>
      <td >3</td>
      <td >5 人</td>
      <td >$279.00</td>
      <td>￥1116.00</td>
      <td>靴子1-2</td>
      <td>1.1GB</td>
      <td>文档记录.doc</td>
      <td><input type='image' src='checkbox.png' /></td>
    </tr>
    <tr >
      <td>u0613</td>
      <td >9/29/2008</td>
      <td >Lodge 2 Bdrm Suite Q/Q (1 left)</td>
      <td >2</td>
      <td >4 人</td>
      <td >$279.00</td>
      <td>￥1116.00</td>
      <td>内衣3-7</td>
      <td>1.445GB</td>
      <td>文档记录.txt</td>
      <td><input type='image' src='checkbox.png' /></td>
    </tr>
    <tr >
      <td>u0624</td>
      <td >10/3/2008</td>
      <td >1 Bdrm Cabin Firepl K (3 left)</td>
      <td >1</td>
      <td >4 人</td>
      <td >$279.00</td>
      <td>￥1116.00</td>
      <td>内衣4-7</td>
      <td>3.69GB</td>
      <td>图片类型.jpg</td>
      <td><input type='image' src='checkbox.png' /></td>
    </tr>
    <tr >
      <td>u0618</td>
      <td >9/4/2008</td>
      <td >2 Bdrm Condo w/Den Custom (1 left)</td>
      <td >2</td>
      <td >6 人</td>
      <td >$329.00</td>
      <td>￥1316.00</td>
      <td>靴子3-7</td>
      <td>3.69MB</td>
      <td>图片类型2.gif</td>
      <td><input type='image' src='checkbox.png' /></td>
    </tr>
    <tr >
      <td>u0627</td>
      <td >10/9/2008</td>
      <td >3 Bdrm Condo K/Q/Q (6 left)</td>
      <td >3</td>
      <td >8 人</td>
      <td >$339.00</td>
      <td>￥1356.00</td>
      <td>袜子3-5</td>
      <td>3.19KB</td>
      <td>图片类型3.png</td>
      <td><input type='image' src='checkbox.png' /></td>
    </tr>
    <tr >
      <td>u0642</td>
      <td >9/23/2008</td>
      <td >2 Bdrm Cabin Firepl K/Q+T (1 left)</td>
      <td >3</td>
      <td >7 人</td>
      <td >$339.00</td>
      <td>￥1356.00</td>
      <td>袜子3-1</td>
      <td>3.01GB</td>
      <td>图片类型7.jpg</td>
      <td><input type='image' src='checkbox.png' /></td>
    </tr>
    <tr >
      <td>u0615</td>
      <td >9/3/2008</td>
      <td >3 Bdrm Condo K/Q/2T (2 left)</td>
      <td >4</td>
      <td >8 人</td>
      <td >$379.00</td>
      <td>￥1516.00</td>
      <td>衣服1-18</td>
      <td>1.69KB</td>
      <td>图片类型22.png</td>
      <td><input type='image' src='checkbox.png' /></td>
    </tr>
    <tr >
      <td>u0607</td>
      <td >9/9/2008</td>
      <td >2 Bdrm. Loft K/Q/Q,3T/SS (9 left)</td>
      <td >6</td>
      <td >11 人</td>
      <td >$389.00</td>
      <td>￥1556.00</td>
      <td>衣服1-19</td>
      <td>3.69GB</td>
      <td>图片类型6.gif</td>
      <td><input type='image' src='checkbox.png' /></td>
    </tr>
    <tr >
      <td>u0609</td>
      <td >9/27/2008</td>
      <td >Dlx 1 Bdrm Cabin Firepl K (3 left)</td>
      <td >1</td>
      <td >4 人</td>
      <td >$389.00</td>
      <td>￥1556.00</td>
      <td>靴子5-12</td>
      <td>1.129MB</td>
      <td>图片类型7.jpg</td>
      <td><input type='image' src='checkbox.png' /></td>
    </tr>
    <tr >
      <td>u0635</td>
      <td >9/17/2008</td>
      <td >Exec 2 Bdrm Lft K/K/2Q/SS (1 left)</td>
      <td >4</td>
      <td >10 人</td>
      <td >$399.00</td>
      <td>￥1596.00</td>
      <td>内衣5-3</td>
      <td>2.129KB</td>
      <td>文件类型1.psd</td>
      <td><input type='image' src='checkbox.png' /></td>
    </tr>
    <tr >
      <td>u0621</td>
      <td >9/6/2008</td>
      <td >3 Bdrm Townhome (3 left)</td>
      <td >3</td>
      <td >6 人</td>
      <td >$409.00</td>
      <td>￥1636.00</td>
      <td>衣服4-2</td>
      <td>3.129MB</td>
      <td>文件类型1.ai</td>
      <td><input type='image' src='checkbox.png' /></td>
    </tr>
    <tr >
      <td>u0601</td>
      <td >9/24/2008</td>
      <td >3 Bdrm Cabin K/Q+T/2T (1 left)</td>
      <td >5</td>
      <td >9 人</td>
      <td >$469.00</td>
      <td>￥1876.00</td>
      <td>内衣5-2</td>
      <td>2.129MB</td>
      <td>文件类型12.psd</td>
      <td><input type='image' src='checkbox.png' /></td>
    </tr>
    <tr >
      <td>u0605</td>
      <td >9/25/2008</td>
      <td >Dlx 1Bd Loft,K,Q/T firepl (1 left)</td>
      <td >3</td>
      <td >6 人</td>
      <td >$469.00</td>
      <td>￥1876.00</td>
      <td>靴子2-30</td>
      <td>7.129MB</td>
      <td>12.zip</td>
      <td><input type='image' src='checkbox.png' /></td>
    </tr>
    <tr >
      <td>u0611</td>
      <td >9/28/2008</td>
      <td >Dlx 2 Bdm Cbn Firepl K/2T (3 left)</td>
      <td >2</td>
      <td >6 人</td>
      <td >$469.00</td>
      <td>￥1876.00</td>
      <td>裤子2-2</td>
      <td>8.129MB</td>
      <td>模板1-1.psd</td>
      <td><input type='image' src='checkbox.png' /></td>
    </tr>
    <tr >
      <td>u0604</td>
      <td >10/6/2008</td>
      <td >Deluxe 3 Bdrm Condo K/Q/Q (2 left)</td>
      <td >3</td>
      <td >8 人</td>
      <td >$499.00</td>
      <td>￥1996.00</td>
      <td>衣服2-32</td>
      <td>85.129MB</td>
      <td>矢量图.ai</td>
      <td><input type='image' src='checkbox.png' /></td>
    </tr>
    <tr >
      <td>u0617</td>
      <td >9/30/2008</td>
      <td >Dlx3Bdm/2Bth/FP/K/QT/QT (1 left)</td>
      <td >5</td>
      <td >8 人</td>
      <td >$549.00</td>
      <td>￥2196.00</td>
      <td>靴子4-22</td>
      <td>11.129MB</td>
      <td>1.zip</td>
      <td><input type='image' src='checkbox.png' /></td>
    </tr> 
  </tbody>
  <tfoot><tr>
      <td>number</td>
      <td>date</td>
      <td>letter and number<span id="spans"></span></th>
      <td>digit</td>
      <td>容量</td>
      <td>price</td>
      <td>price total</td>
      <td>产品</td>
      <td>数据大小</td>
      <td>文件类型</td>
      <td>操作</td>
    </tr>
    </tr> </tfoot>
</table>

</body>
</html>

