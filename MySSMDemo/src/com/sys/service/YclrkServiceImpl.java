package com.sys.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sys.dao.YclrkDao;
import com.sys.pojo.Yclrk;
@Service
public class YclrkServiceImpl implements YclrkService {
	@Autowired
	private YclrkDao yclrkDao;
	public List<Yclrk> getAllYcllrk() throws Exception {
		return yclrkDao.getAllYcllrk();
	}

}
