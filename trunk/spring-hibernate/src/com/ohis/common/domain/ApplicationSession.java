package com.ohis.common.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.Calendar;
import java.util.Set;
import java.util.Iterator;

public class ApplicationSession implements Serializable {
	private Long appId;
	private String name;
	private String[] urlpattern;
	private int timeout;
	private Date lastAccessed;

	public Date getLastAccessed() {
		return lastAccessed;
	}

	public void setLastAccessed(Date lastAccessed) {
		this.lastAccessed = lastAccessed;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getTimeout() {
		return timeout;
	}

	public void setTimeout(int timeout) {
		this.timeout = timeout;
	}

	public String[] getUrlpattern() {
		return urlpattern;
	}

	public void setUrlpattern(String[] urlpattern) {
		this.urlpattern = urlpattern;
	}

	public boolean isAuthenticated() {
		boolean isAuthenticated = false;
		if (getLastAccessed() != null) {
			Calendar now = Calendar.getInstance();
			Calendar last = Calendar.getInstance();
			last.setTime(getLastAccessed());
			last.add(Calendar.MINUTE, getTimeout());
			if (last.before(now)) {
				logout();
			} else {
				isAuthenticated = true; 
			}
		}
		return isAuthenticated;
	}
	
	public boolean isUrlForThisApplication(String url) {
		if (url != null && getUrlpattern() != null && getUrlpattern().length > 0) {
			for (int i=0; i<getUrlpattern().length; i++) {
				if (url.indexOf(getUrlpattern()[i]) >= 0) {
					return true;
				}
			}
		}
		return false;
	}

	public void login() {
		setLastAccessed(new Date());
	}
	
	public void logout() {
		setLastAccessed(null);
	}

	public Long getAppId() {
		return appId;
	}

	public void setAppId(Long appId) {
		this.appId = appId;
	}
}
