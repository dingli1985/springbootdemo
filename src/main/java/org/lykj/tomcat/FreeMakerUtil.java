package org.lykj.tomcat;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;

public class FreeMakerUtil extends Configuration {
	
	private File templateDir;
	
	@Override
	public void setDirectoryForTemplateLoading(File arg0) throws IOException {
		super.setDirectoryForTemplateLoading(templateDir);
	}

	public String toXml(){
		return null;
	}
	
	   public static void model() throws TemplateException, IOException{
		   /* ------------------------------------------------------------------------ */    
	        /* You should do this ONLY ONCE in the whole application life-cycle:        */    
	    
	        /* Create and adjust the configuration singleton */
	        Configuration cfg = new Configuration(Configuration.VERSION_2_3_22);
	        cfg.setDirectoryForTemplateLoading(new File("src/main/config/templates"));
	        cfg.setDefaultEncoding("UTF-8");
	        cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);

	        /* ------------------------------------------------------------------------ */    
	        /* You usually do these for MULTIPLE TIMES in the application life-cycle:   */    

	        /* Create a data-model */
	        Map root = new HashMap();
	        List list = new ArrayList();
	        List list1=new ArrayList();
	        List list2=new ArrayList();
	      
	      /*  list1.add("1");
	        list1.add("2");
	        list1.add("3");
	        list1.add("4");
	        list2.add("5");
	        list2.add("6");
	        list2.add("7");
	        list2.add("8");
	        list.add(list1);
            list.add(list2);*/
	        
	        Map map1= new LinkedHashMap();
	        map1.put("A", "234");
	        map1.put("B", "345");
	        Map map2= new LinkedHashMap();
	        map2.put("C", "456");
	        map2.put("D", "567");
	        list.add(map1);
	        list.add(map2);
	        
           
	        root.put("list",list);
	        //root.put("clientSourceData", map1);
	        //root.put("totalNum", map1.size());
	       /* root.put(
	                "doc",
	                freemarker.ext.dom.NodeModel.parse(new File("the/path/of/the.xml")));*/

	        /* Get the template (uses cache internally) */
	        Template temp = cfg.getTemplate("user2.ftl");

	        /* Merge data-model with template */
	       // Writer out = new OutputStreamWriter(System.out);
	        Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream("d:\\user.xml"), "UTF-8"));  
	        temp.process(root, out);
	        // Note: Depending on what `out` is, you may need to call `out.close()`.
	        // This is usually the case for file output, but not for servlet output.
		   
	   }


	    public static void main(String[] args) throws Exception {
	    	model();
	        
	        /* ------------------------------------------------------------------------ */    
	        /* You should do this ONLY ONCE in the whole application life-cycle:        */    
	    
	        /* Create and adjust the configuration singleton */
	        Configuration cfg = new Configuration(Configuration.VERSION_2_3_22);
	        cfg.setDirectoryForTemplateLoading(new File("src/main/config/templates"));
	        cfg.setDefaultEncoding("UTF-8");
	        cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);

	        /* ------------------------------------------------------------------------ */    
	        /* You usually do these for MULTIPLE TIMES in the application life-cycle:   */    

	        /* Create a data-model */
	        Map root = new HashMap();
	        root.put("user", "Big Joe");
	        Map latest = new HashMap();
	        root.put("latestProduct", latest);
	        latest.put("url", "products/greenmouse.html");
	        latest.put("name", "green mouse");
	        
	       /* root.put(
	                "doc",
	                freemarker.ext.dom.NodeModel.parse(new File("the/path/of/the.xml")));*/

	        /* Get the template (uses cache internally) */
	        Template temp = cfg.getTemplate("user.ftl");

	        /* Merge data-model with template */
	        Writer out = new OutputStreamWriter(System.out);
	        temp.process(root, out);
	        // Note: Depending on what `out` is, you may need to call `out.close()`.
	        // This is usually the case for file output, but not for servlet output.
	    }

}
