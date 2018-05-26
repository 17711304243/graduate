package com.his.dao;

import java.util.List;

import com.his.vo.Doctor;
import com.his.vo.Page;
import com.his.vo.Record;
import com.his.vo.Register;

public interface RecordDao {
	
	//添加处方信息
	public int addRecord(Record rec);
	
    //根据ID查询
	public Record findRecById(int rid);

	//显示所有信息
	public List<Record> findAllRec();
	
	/**
	 * 修改
	 */
	public int updateRec(Record rec);
	
	/**
	 * 删除
	 */
	public int delRec(int rid);
	
	/**
	 * 获取所有处方id的集合
	 */
	public List<Integer> findAllId();
	
	/**
	 * 用于获取模糊查询总页数
	 */
	public int findRecCount(String rname);

	//获取页对象(用于查询和显示所有)
	public Page findRecPage(int rid ,String rname,int pageNo,int pageSize ,int totalCount);
}
