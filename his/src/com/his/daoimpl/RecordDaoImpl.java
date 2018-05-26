package com.his.daoimpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.his.dao.RecordDao;
import com.his.db.DBConnection;
import com.his.vo.Doctor;
import com.his.vo.Drug;
import com.his.vo.Page;
import com.his.vo.Record;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class RecordDaoImpl implements RecordDao{
	
	private PreparedStatement ps= null;
	private ResultSet rs= null;
	private Connection conn= null;

	@Override
	public int addRecord(Record rec) {
		
		int flag=0;
		String sql="insert into record (rname,rdesc,rview,rpresc,rcure) values(?,?,?,?,?)";
		DBConnection db = new DBConnection();
		conn = db.getConn();
		
		try {
		ps = conn.prepareStatement(sql);
		ps.setString(1, rec.getRname());
		ps.setString(2, rec.getRdesc());
		ps.setString(3, rec.getRview());
		ps.setString(4, rec.getRpresc());
		ps.setString(5, rec.getRcure());
		flag = ps.executeUpdate();
		ps.close();
		conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
		return flag;
	}
	
	public int updateRec(Record rec) {
		int flag=0;
		String sql="update record set rname=?,rdesc=?,rview=?,rpresc=?,rcure=? where rid=?";
		DBConnection db=new DBConnection();
		conn=db.getConn();
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1,rec.getRname());
			ps.setString(2,rec.getRdesc());
			ps.setString(3,rec.getRview());
			ps.setString(4,rec.getRpresc());
			ps.setString(5,rec.getRcure());
			ps.setInt(6,rec.getRid());
			flag=ps.executeUpdate();
			ps.close();
			conn.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public int delRec(int rid) {
		int flag=0;
		String sql="delete from record where rid=?";
		DBConnection db=new DBConnection();
		conn=db.getConn();
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1,rid);
			flag=ps.executeUpdate();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public List<Integer> findAllId(){
		String sql="select id from record";
		DBConnection db=new DBConnection();
		conn=db.getConn();
		List<Integer> ridList=new ArrayList<Integer>();
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while (rs.next()) {
				ridList.add(rs.getInt("rid"));
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ridList;
	}

	@Override
	public List<Record> findAllRec() {
		
		List<Record> recList = new ArrayList<Record>();
		String sql = "select * from record";
		DBConnection db = new DBConnection();
		conn = db.getConn();
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				
				Record rec = new Record();
				rec.setRid(rs.getInt("rid"));
				rec.setRname(rs.getString("rname"));
				rec.setRdesc(rs.getString("rdesc"));
				rec.setRview(rs.getString("rview"));
				rec.setRpresc(rs.getString("rpresc"));
				rec.setRcure(rs.getString("rcure"));
				recList.add(rec);
			}
			rs.close();
			ps.close();
			conn.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return recList;
	}

	@Override
	public Page findRecPage(int rid,String rname, int pageNo, int pageSize, int totalCount) {
		
		Page page = new Page();
		String sql="select * from record where rname like '%"+rname+"%' limit "+page.getOffset(pageNo)+","+pageSize;
		
		/*
		if (rname!=null) {		
				sql="select * from record where record like '%"+rname+"%' limit "+page.getOffset(pageNo)+","+pageSize;		
		}else{
			sql="select * from record limit "+page.getOffset(pageNo)+","+pageSize;
		}
		*/
		DBConnection db = new DBConnection();
		conn = db.getConn();
		List<Record> recList=new ArrayList<Record>();
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while (rs.next()) {
				Record rec = new Record();
				rec.setRid(rs.getInt("rid"));
				rec.setRname(rs.getString("rname"));
				rec.setRdesc(rs.getString("rdesc"));
				rec.setRview(rs.getString("rview"));
				rec.setRpresc(rs.getString("rpresc"));
				rec.setRcure(rs.getString("rcure"));
				recList.add(rec);
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		page.setPageItem(recList);
		return page;
	}

	@Override
	public int findRecCount(String rname) {
		int count=0;
		String sql;
		if (rname!=null) {
				sql="select count(*) as num from record where rname like '%"+rname+"%'";
		}else{
			sql="select count(*) as num from record";
		}
		DBConnection db = new DBConnection();
		conn = db.getConn();
		try {
			ps =conn.prepareStatement(sql);
			rs =ps.executeQuery();
			while (rs.next()) {
				count=rs.getInt("num");
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public Record findRecById(int rid) {
		
		Record rec=new Record();
		String sql="select * from record where rid=?";
		DBConnection db=new DBConnection();
		conn=db.getConn();
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1,rid);
			rs=ps.executeQuery();
			while (rs.next()) {
				rec.setRid(rs.getInt("rid"));
				rec.setRname(rs.getString("rname"));
				rec.setRdesc(rs.getString("rdesc"));
				rec.setRview(rs.getString("rview"));
				rec.setRpresc(rs.getString("rpresc"));
				rec.setRcure(rs.getString("rcure"));
			
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rec;
	}



	
}
