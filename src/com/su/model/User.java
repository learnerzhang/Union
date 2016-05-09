package com.su.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity // represent a entity.
@Table(name = "user") // generate a table named "user".
public class User implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 563452366098304678L;
	/*
	 * @Basic is object/table basic modify which default is
	 * "@Basic(fetch=FetchType.EAGER/LAZY,optional=true)". if use LAZY, that
	 * take "load" instead of "get"
	 * 
	 * @Transient represent that the key do not map to database. just for
	 * function using.
	 */
	@Id
	@Basic(optional = false)
	@GeneratedValue(strategy = GenerationType.AUTO) // auto_increment
	@Column(name = "id", nullable = false,updatable=false)
	private Integer id;
	@Column(name = "username", nullable = false)
	private String username;
	@Column(name = "password", nullable = false)
	private String password;
	private String new_password;
	
	@Column(name = "email")
	private String email;
	
	@Column(name = "contact")
	private String contact;// 联系人姓名
	
	@Column(name = "phone")
	private String phone;
	
	@Column(name = "sex")
	private String sex;
	
	@Column(name = "status", nullable = false)
	private String status;// "no" or "yes"
	
	private String vcode;
	
	@Column(name = "ctime")
	private Timestamp ctime;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNew_password() {
		return new_password;
	}

	public void setNew_password(String new_password) {
		this.new_password = new_password;
	}

	public String getEmail() {
		return email;
	}
	
	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getVcode() {
		return vcode;
	}

	public void setVcode(String vcode) {
		this.vcode = vcode;
	}

	public Timestamp getCtime() {
		return ctime;
	}

	public void setCtime(Timestamp ctime) {
		this.ctime = ctime;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", new_password=" + new_password
				+ ", email=" + email + ", contact=" + contact + ", phone="
				+ phone + ", status=" + status + ", vcode=" + vcode + ", ctime=" + ctime + "]";
	}

}
