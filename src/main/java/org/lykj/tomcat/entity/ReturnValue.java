package org.lykj.tomcat.entity;

import java.io.Serializable;

public class ReturnValue implements Serializable {
   /**
	 * 
	 */
   private static final long serialVersionUID = 1L;
   private int code;
   private int level;
   private String msg;
   
	public ReturnValue(){}
	   
	public ReturnValue(int code, int level, String msg) {
		this.code = code;
		this.level = level;
		this.msg = msg;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
}