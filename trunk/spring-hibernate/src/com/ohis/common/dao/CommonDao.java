/**
 * Created on Feb 7, 2008 by jshen
 *
 * Copyright (c) 2008 OpHedge Investment Services, LLC.  All rights reserved.
 */ 
package com.ohis.common.dao;

import java.util.Date;
import java.util.List;

import com.ohis.common.domain.Holiday;

public interface CommonDao {
	List<Holiday> findUSHolidayForYear(Date date);
}
