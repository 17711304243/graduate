import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.his.service.DepService;
import com.his.service.DoctorService;
import com.his.serviceimpl.DepServiceImpl;
import com.his.serviceimpl.DoctorServiceImpl;
import com.his.vo.Dep;
import com.his.vo.Doctor;

public class depFilter implements Filter{
	@Override
    public void destroy() {
 
    }
 
    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
    	DoctorService docs=new DoctorServiceImpl();
        DepService ds=new DepServiceImpl();
		List<Dep> depList=ds.findDepList();
		request.setAttribute("depList", depList);
		List<Doctor> docList=docs.findAllDoc();
		request.setAttribute("docList", docList);
        System.out.printf("access depFilter");
        chain.doFilter(request, response);
    }
 
    @Override
    public void init(FilterConfig arg0) throws ServletException {
        System.out.println("First Filter init()");
    }
}
