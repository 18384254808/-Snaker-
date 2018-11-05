package com.sys.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.sys.Util.PageUtil;
import com.sys.pojo.DataGridResult;
import com.sys.pojo.Gcmc;
import com.sys.pojo.Khgl;
import com.sys.service.KhglService;
import com.sys.vo.GcmcVo;
import com.sys.vo.MessageInfo;

@Controller
public class KnglController {
	@Autowired
	private KhglService khglService;
	
	@RequestMapping("/getKhgl.do")
	@ResponseBody
	public List<Khgl> getAll() throws Exception{
		return khglService.getKhgls();
	}
	@RequestMapping("/khgl.do")
	public String getkhgl(){
		return "khgl";
	}
	@RequestMapping("/getGcmcById/{id}")
	@ResponseBody
	public DataGridResult getGcmc(@PathVariable("id") int id,int page,int rows) throws Exception{
		System.out.println(rows+"|"+page);
		//分页组件使用
		PageHelper.startPage(page, rows);
		DataGridResult data = khglService.getGCXX(id);
		return data;
	}
	
	@RequestMapping("/deleteGcxxByids.do")
	@ResponseBody
	public MessageInfo  deleteGcxx(String ids) throws Exception{
		String[] array=ids.split(",");
		MessageInfo msg=khglService.deleteGcxxByids(array);
		return msg;
	}
	@RequestMapping("/addGcxx.do")
	@ResponseBody
	public MessageInfo addGcxx(String gcmc_name,String khmc_id) throws Exception{
		MessageInfo msg=khglService.addGcxx(gcmc_name, khmc_id);
		return msg;
	}
	//多条件模糊查询
	@RequestMapping("/getGcmcSerach/{id}/{key}/{value}")
	@ResponseBody
	public DataGridResult getGcmcSerach(@PathVariable("id") int id,@PathVariable("key") String key,@PathVariable("value") String value,int page,int rows) throws Exception{
		System.out.println("进入getGcmcSerach");
		PageHelper.startPage(page, rows);
		DataGridResult data=khglService.getLikeGcxx(id, key, value);
		return data;
	}
	
	
	//修改工程信息(得到需要修改信息修改数据)
	@RequestMapping("/getGcmcVoByid.do/{id}")
	@ResponseBody
	public MessageInfo getGcmcVoById(@PathVariable("id") int id,String gcmc_name,String khmc_id) throws Exception{
		System.out.println("getGcmcVoByIddfdfdf"+id+gcmc_name+khmc_id);
		MessageInfo msg=khglService.updateByid(id, gcmc_name, khmc_id);
		return msg;
	}
	//修改工程信息(得到修改对象信息)
		@RequestMapping("/getupdate.do/{id}")
		public String getGcmcVoByIds(@PathVariable("id") int id,HttpSession session) throws Exception{
			GcmcVo gcmcVo=khglService.getGcmcVoByid(id);
			session.setAttribute("gcmcVo", gcmcVo);
			return "update";
		}
}
