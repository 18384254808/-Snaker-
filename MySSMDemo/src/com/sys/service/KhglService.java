package com.sys.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sys.pojo.DataGridResult;
import com.sys.pojo.Gcmc;
import com.sys.pojo.Khgl;
import com.sys.vo.GcmcVo;
import com.sys.vo.MessageInfo;

public interface KhglService {
	//获得khgl集合
	public List<Khgl> getKhgls() throws Exception;
	//获得分页GCxx
	public DataGridResult getGCXX(int id) throws Exception;
	//批量删除工程数据
	public MessageInfo deleteGcxxByids(@Param("ids") String[] ids)throws Exception;
	//新增工程信息
	public MessageInfo addGcxx(String gcmc_name,String khmc_id)throws Exception;
	//模糊查询工程信息
	public DataGridResult getLikeGcxx(@Param("id") int id,@Param("key") String key,@Param("value") String value)throws Exception;
	//查找指定gcmc_id返回Gcmcxx
	public GcmcVo getGcmcVoByid(@Param("id") int id)throws Exception;
	//修改指定gcmc_id信息
	public MessageInfo updateByid(@Param("id") int id,@Param("gcmc_name") String gcmc_name,@Param("khmc_id") String khmc_id)throws Exception;
}
