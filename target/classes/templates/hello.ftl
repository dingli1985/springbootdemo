<#import "spring.ftl" as spring /> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"   
 "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
    <head>  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
        <title>${title}</title>  
    </head>  
    <body> 
    <img src="<@spring.url'/images/sp_bg.jpg'/>"/>  
        ${content}  <br>
        ${table}<br>
        ${td}<br>
    </body>  
</html>  
