package com.his.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.his.service.DepService;
import com.his.service.RecordService;
import com.his.service.ResourcesService;
import com.his.service.RoleService;
import com.his.service.Role_ResourcesService;
import com.his.service.UserService;
import com.his.serviceimpl.DepServiceImpl;
import com.his.serviceimpl.RecordServiceImpl;
import com.his.serviceimpl.ResourcesServiceImpl;
import com.his.serviceimpl.RoleServiceImpl;
import com.his.serviceimpl.Role_ResourcesServiceImpl;
import com.his.serviceimpl.UserServiceImpl;
import com.his.vo.Dep;
import com.his.vo.Doctor;
import com.his.vo.Drug;
import com.his.vo.Page;
import com.his.vo.Record;
import com.his.vo.Resources;
import com.his.vo.Role;
import com.his.vo.User;

public class RecordAction extends HttpServlet{
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) 
			throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		RecordService rs = new RecordServiceImpl();
		String action = request.getParameter("action");
		
	    if (action.equals("FindRecPage")) {//------------------------------查看处方
			String ui=request.getParameter("uid");
			
			if (ui==null||ui=="") {
				ui="125";
			}
			int uid=Integer.valueOf(ui);
		
			UserService users=new UserServiceImpl();
			User user0=users.findUserById(uid);
			int roleid0=user0.getRoleid();
			RoleService roles=new RoleServiceImpl();
			Role role0=roles.findRoleById(roleid0);
			int rolesta=role0.getRoleStatus();
			if (rolesta==0) {
				request.setAttribute("meesg","当前角色已禁用!");
				try {
					request.getRequestDispatcher("Error.jsp").forward(request, response);
				} catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else{
				Role_ResourcesService rolers=new Role_ResourcesServiceImpl();
				List<Integer> residdList=rolers.finResIdByRoleId(roleid0);
				boolean boo=false;
				for (Integer reid0: residdList) {
					if (reid0==3) {
						boo=true;
					}
				}
				if (!boo) {
					request.setAttribute("meesg","当前角色不具有该权限!");
					try {
						request.getRequestDispatcher("Error.jsp").forward(request, response);
					} catch (ServletException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}else{
					
					String recid=request.getParameter("recid");
					int rid=0;
					if (recid!=null&&recid!="") {
					rid=Integer.valueOf(recid);
					}else{
						recid="";
					}
					
					
					String rname=request.getParameter("rname");
				
					
					int totalCount=rs.findRecCount(rname);//获取条数
					int pageSize=5;
					String pageNo=request.getParameter("pageNo");
					int pageNot=1;
					if(pageNo!=null&&pageNo!=""){
						pageNot = Integer.valueOf(pageNo);
					}else{
						pageNo=String.valueOf(pageNot);
					} 
					Page page =rs.findRecPage(rid ,rname, pageNot, pageSize, totalCount);
					
					List<Record> recList=page.getPageItem();
					request.setAttribute("rid",rid);
					request.setAttribute("rname",rname);

					request.setAttribute("recList",recList);
					request.setAttribute("totalCount",totalCount);
					request.setAttribute("pageNo",pageNo);
					request.setAttribute("totalPage",page.getTotalPage(totalCount,pageSize));
					int t=page.getTotalPage(totalCount,pageSize);
					List<Integer> lis=new ArrayList<Integer>();
					for (int i = 1; i <= t; i++) {
						lis.add(i);
					}
					if (t!=pageNot&&pageNot!=1) {
						request.setAttribute("pageMid", pageNot);
					}else if(pageNot==1){
						request.setAttribute("pageMid", 2);
					}else{
						request.setAttribute("pageMid", t-1);
					}
					request.setAttribute("lis", lis);
					try {
						request.getRequestDispatcher("Knowedge/example.jsp").forward(request, response);
					} catch (ServletException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					}
				
			}
		
	}

	    else if(action.equals("AddRec")) {
			
			Record rec = new Record();
			String rname = request.getParameter("rname");
			String rdesc = request.getParameter("rdesc");
			String rview = request.getParameter("rview");
			//System.out.println(rview);
			String rpresc = request.getParameter("rpresc");
			String rcure = request.getParameter("rcure");
			
			
			rec.setRname(rname);			
			rec.setRdesc(rdesc);
			rec.setRview(rview);
			rec.setRpresc(rpresc);
			rec.setRcure(rcure);		
			
			
			rs.addRecord(rec);

		
			
			try {
				response.sendRedirect("Knowedge/record.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		}
		

		else if(action.equals("Look")) {          //------------------处方详情
			
			
			String rid=request.getParameter("rid");
			int recid=Integer.valueOf(rid);
			Record rec = rs.findRecById(recid);
			request.setAttribute("rec",rec );
			try {
				request.getRequestDispatcher("Knowedge/look.jsp").forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(action.equals("FindRecById")){//-------------修改之前，获取用户返回编辑页面
			String rid=request.getParameter("rid");
			int recid=Integer.valueOf(rid);
			Record rec=rs.findRecById(recid);
			request.setAttribute("rec", rec);
			
			try {
				request.getRequestDispatcher("Knowedge/edit.jsp").forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(action.equals("EditRec")){//--------------编辑页面提交后执行修改
			String rid=request.getParameter("recid");
			int recid=Integer.valueOf(rid);
			String rname=request.getParameter("rname");
			String rdesc=request.getParameter("rdesc");
			
			String rview =request.getParameter("rview");
			String rpresc =request.getParameter("rpresc");
			String rcure =request.getParameter("rcure");
			

			Record rec=new Record();
			rec.setRid(recid);
			rec.setRname(rname);
			rec.setRdesc(rdesc);
			rec.setRview(rview);
			rec.setRpresc(rpresc);
			rec.setRcure(rcure);
			rs.updateRec(rec);
			try {
				response.sendRedirect("RecordAction?action=FindRecPage");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

}
		
		else if(action.equals("DelRecById")){//-------------删除
			String rid=request.getParameter("rid");
			int recid=Integer.valueOf(rid);
			Record rec=rs.findRecById(recid);
			request.setAttribute("rec", rec);
			rs.delRec(recid);
			try {
				response.sendRedirect("RecordAction?action=FindRecPage");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
		else if(action.equals("delChecked")){//-------------------------复选框删除
			String result = request.getParameter("rids"); 
			String[] rids = result.split(",");
			for (String s : rids) {
				int rid=Integer.valueOf(s);
				rs.delRec(rid);

			}
			try {
				response.sendRedirect("RecordAction?action=FindRecPage");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	}
	
	

		
		
		
		
