function AddOrderData(row,tableData){
	var ExtensionName = tableData.ExtensionName ,
		DataSize =  tableData.DataSize,
		SelectRowOrder =  tableData.SelectRowOrder,
		string , 
		text,
		previous = '<strong style="font-weight:normal">',
		next = '</strong>',
		 kb = /KB/i ,
		 gb = /GB/i ,
		 mb = /MB/i ,
		 kmg = /KB|GB|MB/i;
		
		if(DataSize){ 
		 
			$('td:eq('+(DataSize.index)+')',row).each(function(i){
				text = $(this).text();
				string = kmg.exec(text);
				
				if(gb.test(string)){
					this.axis = parseFloat(text)*1024000000||0;
						}	
				else if(mb.test(string)){
					this.axis = parseFloat(text)*1024000||0;
					}
				else if(kb.test(string)) {
					this.axis = parseFloat(text)*1024||0;
					}
				else {
					this.axis = 0;
					
					}
				
					 })
			
		}
		if(ExtensionName){
			var arr = [];
			$('td:eq('+(ExtensionName.index)+')',row).each(function(i){
				string = $(this).text();
				if(string.lastIndexOf('.')>0){
					this.axis = string.substring(string.lastIndexOf('.')+1);
					}
				else this.axis = 0;
				ExtensionName.strongClass && 
				strong($(this),previous,this.axis,next)&&arr.push(this.axis);
			})
			
			tableData.strongExtName = ExtensionName.strongClass && OrderExtNum(arr);
			
		}
		if(SelectRowOrder){
			$('td:eq('+(SelectRowOrder.index)+')',row).find('input').each(
				function(){
					if(this.type=='image'){this.checked=this.checked?1:0}
					$(this).parent()[0].axis=this.checked?1:0;
						 
						 $(this).bind('click',function(){
								if(this.type=='image'){this.checked=this.checked?0:1}
								$(this).parent()[0].axis=this.checked?1:0;
						  });
						 
						 })
			}
		function OrderExtNum(){
			var count = arr.length;
				$.each($(arr).Filter(),function(i,v){ 
									arr.push( {} );
									arr[arr.length-1][v] = i;
									});
				
				 return arr.slice(count).sort(function(a,b){
								  for(var i in a){
									  for(var j in b)
									  return -(a[i].localeCompare(b[j]))
									  }
								  })
			}	
}
function strong(o,previous,oldText,next){
		
		return oldText &&
		o.html(o.text().replace(oldText,Array.prototype.slice.call(arguments).slice(1).join('')))
		
		}
(function($){
$.fn.Filter=function(){
  var self = this.get(),o={},result=[];
  if(!arguments[0]){
	  this.each(
			function(index){
				if( !o[self[index]] ){
					o[self[index]] = 1;
					}
				else {
					o[self[index]]++ ; 
				}
					 });
	  return o;
  }
  else {
	  this.each(
		function(index){
			if( o[self[index]] != self[index] )	
				o[self[index]] = self[index];
			else delete o[self[index]];
					  });
  }
  for(var i in o)
	  result.push(i);
  return result
  }		  
$.fn.blueTable=function(options,callback){
  this.data('setting',
	$.extend({					
			 DataSize:null,			
			 ExtensionName:null,
			 NotOrder:null,			
			 SelectRowOrder:null,
			 HighLightColClass:false
			 },options||{}))
  var th = $('thead th',this).get(),	
	  rows = $('tbody:first tr',this),
	  tableData = this.data('setting'),				
	  NotOrder = tableData.NotOrder,				
	  DataSize = tableData.DataSize,			
	  SelectRowOrder = tableData.SelectRowOrder,
	  ExtensionName = tableData.ExtensionName,
	  ColClass = tableData.HighLightColClass, 						
	  Finish = callback||function(){},
	  filterTh = th,
	  table = this,
	  clickEvent;
	  tableData.target = {};
	  if(NotOrder!=null){
		  var arr=[],	Count=th.length;	
		  filterTh={};
		  while(Count--)arr.push(Count);
		  arr = $(NotOrder.concat(arr)).Filter(true);
		  Count = arr.length;
		  while(Count--){filterTh[arr[Count]] = th[arr[Count]]}
		  }
	  ((ExtensionName) || (SelectRowOrder) ||(DataSize)) && AddOrderData(rows,tableData);
	for(var i in filterTh){
	 $(filterTh[i]).css('cursor','pointer').bind('click',custom(i),
	  clickEvent=function(e){
		    e.data.sorted = Boolean($(this).attr('sorted'));
			tableData.target = e.data;
			tableData.BeforeIndex = tableData.CurrentIndex;
			tableData.CurrentIndex = parseInt(e.data.index);
			table.find('thead [sorted=ed]').attr('sorted','');
			$(this).attr('sorted','ed');
			quickSort();
					})
	}
			
	if(ExtensionName){
		  $(th).eq(ExtensionName.index).unbind('click').css('cursor','');
		  }
	
	function custom(i){
		
		var o = {index:i, method:'text', args:null,sorted:null};
		if(ExtensionName&&i==ExtensionName.index){
			
			$('#'+ExtensionName.extension)
			.bind('click',{index:i,method:'attr', args:'axis',sorted:null },clickEvent)
			.css('cursor','pointer');
			$('#'+ExtensionName.name)
			.bind('click',{index:i,method:'text', args:null,sorted:null }, clickEvent)
			.css('cursor','pointer');
			return ;
			} 
		if(DataSize&&i==DataSize.index){
			 o.method = 'attr';
			 o.args = 'axis';
			 return o ;
			 }
		if(SelectRowOrder&&i==SelectRowOrder.index){
			o.method = 'attr';
			 o.args = 'axis';
			 return o;
			}
		return o;
		}
	function quickSort(){
		  var fragment=document.createDocumentFragment(),
			r = $('tbody:first tr',table).get(),
			rowCount = r.length,
			arr =[],
			tbody = $('tbody:first',table);
		if( !tableData.target.sorted||(SelectRowOrder&&(tableData.CurrentIndex==SelectRowOrder.index))){
			arr = GetValues();													
			arr.sort(naturalSort);
			while(rowCount--)
			fragment.appendChild( r[ arr[rowCount].split(',').pop() ]   );
		}
		else {
			Array.prototype.reverse.call(r);
			$(r).each(function(){fragment.appendChild(this)})
			} 
		tbody.append(fragment);
			
		if(SelectRowOrder!=null&&($.browser.version==6.0)){
			IE6Checked();
			}
		
		ColClass&&AddColClass();
		tableData.strongExtName&&strongExt();	
		Finish(tableData.CurrentIndex,tableData.BeforeIndex);
		}
	function GetValues(){
		var stringArr =[],
			re = /([-]{0,1}[0-9.]{1,})/g ,
			i = tableData.CurrentIndex,
			method = tableData.target.method,
			args = tableData.target.args,			
			s,
			sD , 
			sN,
			chars = String.fromCharCode(0);
		$('tbody:first tr',table).each(
			 function(j,tr){
				 s = $(tr.cells[i])[method](args).toString().toLowerCase()||'',
				 sD = (new Date(s)).getTime();
				 sN = s.replace(re ,chars +'$1'+chars ).split(chars);
				 !sD ? stringArr.push(sN.join(',')+','+j) : stringArr.push(sD+','+j);
					})
			return stringArr;
		}	
	function naturalSort(a,b) {
		var arr1 = a.split(','),arr2 = b.split(','),
			xN = arr1.slice(0,(arr1.length-1)),
			yN = arr2.slice(0,(arr2.length-1));
			
			for ( var i=0, numS = Math.max( xN.length, yN.length ); i < numS; i++ ){
					if ( ( parseFloat( xN[i] ) || xN[i] ) < ( parseFloat( yN[i] ) || yN[i] ) )
							return -1;
					else if ( ( parseFloat( xN[i] ) || xN[i] ) > ( parseFloat( yN[i] ) || yN[i] ) )
							return 1;
							}
			return 0;
			}
	function AddColClass(){
		(tableData.BeforeIndex!=tableData.CurrentIndex) &&
		rows.find('td:eq('+tableData.BeforeIndex+')').removeClass(ColClass);
		rows.find('td:eq('+tableData.CurrentIndex+')').addClass(ColClass);
		}		
	function IE6Checked(){
		rows.find('td:eq('+(SelectRowOrder.index)+') input')
		.each(
			function(){
				this.checked = parseInt($(this).parent()[0].axis);
				}
			)
	}
	function strongExt(){
		if(!$('#'+ExtensionName.extension).attr('sorted')){return} 
		if ((tableData.CurrentIndex==ExtensionName.index)&&!tableData.coloration){
	      var arr = tableData.strongExtName,
			  target = ExtensionName.strongClass=='ext'?'strong':'',
			  strong  =  table.find('td:nth-child('+(tableData.CurrentIndex+1)+') '+target+''),
			  j=0,
			  color = ['03c','060'];
		
		 $.each(arr,function(i){
			$.each(arr[i],function(k,v){
								   strong.slice(j,parseInt(k)+j).css({color:'#'+color[i%2]});
								   j=j+parseInt(k);});
			 });
		 tableData.coloration = true;
		  }
		  else return 
		}
	return this
	  }})(jQuery)



