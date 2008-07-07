package com.ohis.common.domain;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class Client implements Serializable {
	private static final long serialVersionUID = 9120861349469205296L;

	private Long id = new Long(-1);
	private String clientName;
	private String short_nm;
	private String address1;
	private String address2;
	private String addrCity;
	private String addrState;
	private String addrZip;
	private String addrCountry;
	private String phone;
	private String status;
	private String ldapUserGroup;
	private String contentDir;
	private String clientGroup;
	private Set users = new HashSet();
	private boolean isManager = false;

	public Client() {
		super();
	}

	public Client(Long id, String short_nm) {
		super();
		this.id = id;
		this.short_nm = short_nm;
	}

	public String getClientName() {
		return clientName;
	}

	public void setClientName(String clientName) {
		this.clientName = clientName;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Set getUsers() {
		return users;
	}

	public void setUsers(Set users) {
		this.users = users;
	}

	public String getAddrCity() {
		return addrCity;
	}

	public void setAddrCity(String addrCity) {
		this.addrCity = addrCity;
	}

	public String getAddrCountry() {
		return addrCountry;
	}

	public void setAddrCountry(String addrCountry) {
		this.addrCountry = addrCountry;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getAddrState() {
		return addrState;
	}

	public void setAddrState(String addrState) {
		this.addrState = addrState;
	}

	public String getAddrZip() {
		return addrZip;
	}

	public void setAddrZip(String addrZip) {
		this.addrZip = addrZip;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getShort_nm() {
		if ("ohpp".equalsIgnoreCase(short_nm)) return "pgam";
		return short_nm == null ? null : short_nm.toLowerCase();
	}

	public void setShort_nm(String short_nm) {
		this.short_nm = short_nm;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getLdapUserGroup() {
		return ldapUserGroup;
	}

	public void setLdapUserGroup(String ldapUserGroup) {
		this.ldapUserGroup = ldapUserGroup;
	}

	public String getContentDir() {
		return contentDir;
	}

	public void setContentDir(String contentDir) {
		this.contentDir = contentDir;
	}

	public String getClientGroup() {
		return clientGroup;
	}

	public void setClientGroup(String clientGroup) {
		this.clientGroup = clientGroup;
	}

	public boolean isOhis() {
		return "ohis".equalsIgnoreCase(getShort_nm());
	}
	public boolean isPgam() {
		return "pgam".equalsIgnoreCase(getShort_nm());
	}

	public boolean isManager() {
		return isManager;
	}

	public void setManager(boolean isManager) {
		this.isManager = isManager;
	}
}
