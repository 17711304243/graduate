package com.his.service;

import java.util.List;

import com.his.vo.Doctor;
import com.his.vo.Page;
import com.his.vo.Record;

public interface RecordService {
	
	//添加
	public int addRecord(Record rec);
	
	/**
	 * 根据id查询
	 */
	public Record findRecById(int rid);
	
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
	
	//获取所有信息
	public List<Record> findAllRec();
	
	/**
	 * 获取页对象(用于模糊查询和显示所有)
	 */
	public Page findRecPage(int rid,String rname,int pageNo,int pageSize ,int totalCount);
	
	/**
	 * 用于获取模糊查询总页数
	 */
	public int findRecCount(String rname);

}
