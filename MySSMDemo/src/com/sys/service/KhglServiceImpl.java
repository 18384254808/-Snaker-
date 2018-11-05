package com.sys.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sys.Util.PageUtil;
import com.sys.dao.KhglDao;
import com.sys.pojo.DataGridResult;
import com.sys.pojo.Gcmc;
import com.sys.pojo.Khgl;
import com.sys.vo.GcmcVo;
import com.sys.vo.MessageInfo;
@Service
public class KhglServiceImpl implements KhglService{
	@Autowired
	private KhglDao khglDao;
	@Override
	public List<Khgl> getKhgls() throws Exception {
		System.out.println("KhglService");
		return khglDao.getkhgls();
	}
	@Override
	public MessageInfo deleteGcxxByids(String[] ids) throws Exception {
		int num=khglDao.deleteGcxxByids(ids);
		MessageInfo msg = new MessageInfo();
		if(num == ids.length){
			msg.setFlag(true);
			msg.setMsg("删除成功："+num+"条数据！");
		}else{
			msg.setFlag(false);
			msg.setMsg("删除错误");
		}
		return msg;
	}
	@Override
	public DataGridResult getGCXX(int id) throws Exception {
		/*List<GcmcVo> list = khglDao.getGcmcXX(id);
		DataGridResult data = new DataGridResult();
		data.setTotal(list.size());
		data.setRows(list);
		// 1000  1 20   total 1000 rows 20
		// 0            total 0 rows null
		// 19           total 19 rows list
*/		return PageUtil.convertToResult(khglDao.getGcmcXX(id));
	}
	@Override
	public MessageInfo addGcxx(String gcmc_name,String khmc_id) throws Exception {
		Gcmc gcmc=new Gcmc();
		gcmc.setKhmc_id(Integer.parseInt(khmc_id));
		gcmc.setGcmc_name(gcmc_name);
		int num=khglDao.addGcxx(gcmc);
		MessageInfo msg=new MessageInfo();
		if(num>0){
			msg.setFlag(true);
			msg.setMsg("添加成功");
		}
		else{
			msg.setFlag(false);
			msg.setMsg("添加失败");
		}
		return msg;
	}
	@Override
	public DataGridResult getLikeGcxx(int id, String key, String value) throws Exception {
		return PageUtil.convertToResult(khglDao.getLikeGcxx(id, key, value));
	}
	//查找指定gcmc_id返回Gcmcxx
	@Override
	public GcmcVo getGcmcVoByid(int id) throws Exception {
		return khglDao.getGcmcVoByid(id);
	}
	@Override
	public MessageInfo updateByid(int id, String gcmc_name, String khmc_id) throws Exception {
		int num=khglDao.updateByid(id, gcmc_name, khmc_id);
		
		System.out.println("updateByid"+num);
		MessageInfo msg=new MessageInfo();
		if(num>0){
			msg.setFlag(true);
			msg.setMsg("修改成功");
		}
		else{
			msg.setFlag(false);
			msg.setMsg("修改失败");
		}
		return msg;
	}
}
