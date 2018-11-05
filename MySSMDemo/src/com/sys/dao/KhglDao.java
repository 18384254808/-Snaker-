package com.sys.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.sys.pojo.Gcmc;
import com.sys.pojo.Khgl;
import com.sys.vo.GcmcVo;

public interface KhglDao {
	//查询所有客户
	public List<Khgl> getkhgls() throws Exception;
	/*查询指定khmc_id的工程信息*/
	public List<GcmcVo> getGcmcXX(@Param("id") int id) throws Exception;
	//批量删除数据
	public int deleteGcxxByids(@Param("ids") String[] ids)throws Exception;
	//新增工程信息
	public int addGcxx(Gcmc gcmc)throws Exception;
	//模糊查询工程信息
	public List<GcmcVo> getLikeGcxx(@Param("id") int id,@Param("key") String key,@Param("value") String value)throws Exception;
	//查找指定gcmc_id返回Gcmcxx
	public GcmcVo getGcmcVoByid(@Param("id") int id)throws Exception;
	//修改指定gcmc_id信息
	public int updateByid(@Param("id") int id,@Param("gcmc_name") String gcmc_name,@Param("khmc_id") String khmc_id)throws Exception;
}
