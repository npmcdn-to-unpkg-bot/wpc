package com.wpc.admin.entity;

import java.io.Serializable;
import java.util.Date;

/**
*  实体类
* author wpc
*/
public class AuthPermission implements Serializable {

	private static final long serialVersionUID = 1L;
	
	/**
	 * 
	 */
	private Integer id;
	/**
	 * 
	 */
	private String permissionName;
	/**
	 * 
	 */
	private String permissionCode;
	/**
	 * 
	 */
	private String permissionType;
	/**
	 * 
	 */
	private Date updateTime;
	
	public void setId(Integer id){
		this.id=id;
	}
	public Integer getId(){
		return this.id;
	}
	
	public void setPermissionName(String permissionName){
		this.permissionName=permissionName;
	}
	public String getPermissionName(){
		return this.permissionName;
	}
	
	public void setPermissionCode(String permissionCode){
		this.permissionCode=permissionCode;
	}
	public String getPermissionCode(){
		return this.permissionCode;
	}
	
	public void setPermissionType(String permissionType){
		this.permissionType=permissionType;
	}
	public String getPermissionType(){
		return this.permissionType;
	}
	
	public void setUpdateTime(Date updateTime){
		this.updateTime=updateTime;
	}
	public Date getUpdateTime(){
		return this.updateTime;
	}
	
	@Override
	public String toString(){
		StringBuilder sb = new StringBuilder();
		sb.append("AuthPermission[");
		sb.append("id=");
		sb.append(id);
		sb.append(",permissionName=");
		sb.append(permissionName);
		sb.append(",permissionCode=");
		sb.append(permissionCode);
		sb.append(",permissionType=");
		sb.append(permissionType);
		sb.append(",updateTime=");
		sb.append(updateTime);
		sb.append("]");
		return sb.toString();
	}
}
