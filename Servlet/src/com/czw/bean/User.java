package com.czw.bean;

public class User {
	private Integer id;
	private String userName;
	private String password;

	public User(Integer id, String userName, String passwrod) {
		super();
		this.id = id;
		this.userName = userName;
		this.password = passwrod;
	}

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPasswrod() {
		return password;
	}

	public void setPasswrod(String passwrod) {
		this.password = passwrod;
	}

}
