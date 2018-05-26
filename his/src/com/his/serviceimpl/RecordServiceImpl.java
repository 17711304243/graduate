package com.his.serviceimpl;

import java.util.List;

import javax.naming.ldap.Rdn;

import com.his.dao.RecordDao;
import com.his.daoimpl.RecordDaoImpl;
import com.his.service.RecordService;
import com.his.vo.Doctor;
import com.his.vo.Page;
import com.his.vo.Record;

public class RecordServiceImpl implements RecordService{
	
	RecordDao rd = new RecordDaoImpl();

	@Override
	public int addRecord(Record rec) {
		
		return rd.addRecord(rec);
	}
	
	public int updateRec(Record rec) {
		return rd.updateRec(rec);
	}
	
	public int delRec(int rid) {
		return rd.delRec(rid);
	}

	public List<Integer> findAllId() {
		return rd.findAllId();
	}
	
	@Override
	public List<Record> findAllRec() {
	
		return rd.findAllRec();
	}


	@Override
	public Page findRecPage(int rid,String rname, int pageNo, int pageSize, int totalCount) {
		return rd.findRecPage(rid ,rname,  pageNo, pageSize, totalCount);
	}


	@Override
	public int findRecCount(String rname) {
		return rd.findRecCount(rname);
	}


	@Override
	public Record findRecById(int rid) {
		
		return rd.findRecById(rid);
	}


}
