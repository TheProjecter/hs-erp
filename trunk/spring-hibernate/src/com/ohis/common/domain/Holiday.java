/**
 * Created on Feb 7, 2008 by jshen
 *
 * Copyright (c) 2008 OpHedge Investment Services, LLC.  All rights reserved.
 */ 
package com.ohis.common.domain;

import java.io.Serializable;
import java.util.Date;

public class Holiday implements Serializable {

	private String currency;
	private String market;
	private Date day;
	private String description;
	private Date dateAdded;
	private Date dateUpdated;
	private boolean active;
	
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public Date getDateAdded() {
		return dateAdded;
	}
	public void setDateAdded(Date dateAdded) {
		this.dateAdded = dateAdded;
	}
	public Date getDateUpdated() {
		return dateUpdated;
	}
	public void setDateUpdated(Date dateUpdated) {
		this.dateUpdated = dateUpdated;
	}
	public Date getDay() {
		return day;
	}
	public void setDay(Date day) {
		this.day = day;
	}
	public String getMarket() {
		return market;
	}
	public void setMarket(String market) {
		this.market = market;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public boolean isActive() {
		return active;
	}
	public void setActive(boolean active) {
		this.active = active;
	}
	
}
