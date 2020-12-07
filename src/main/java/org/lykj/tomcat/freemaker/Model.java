package org.lykj.tomcat.freemaker;

import org.springframework.stereotype.Service;


public class Model {
	
	private String ids;


	public void setId(String id) {
		this.ids = id;
	}
	
	public String getId(){
		return this.ids;
	}
}
