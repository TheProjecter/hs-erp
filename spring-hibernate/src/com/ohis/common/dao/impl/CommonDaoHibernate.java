/**
 * Created on Feb 7, 2008 by jshen
 *
 * Copyright (c) 2008 OpHedge Investment Services, LLC.  All rights reserved.
 */ 
package com.ohis.common.dao.impl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.ohis.common.dao.CommonDao;
import com.ohis.common.domain.Holiday;

public class CommonDaoHibernate 
	extends HibernateDaoSupport implements CommonDao {

	public List<Holiday> findUSHolidayForYear(Date date) {
		DateFormat f = new SimpleDateFormat("yyyy");
		String year = f.format(date);
		HibernateTemplate ht = getHibernateTemplate();
		String sql = "from Holiday h " +
				" where h.currency = 'USD'" +
				" and h.market = 'FI'" + 
				" and to_char(h.day, 'yyyy') = ?";
		return  ht.find(sql, new Object[] {year});
	}

}
