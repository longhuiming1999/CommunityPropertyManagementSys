package com.myuni.wyglsys.dao;

import java.util.List;

import com.myuni.wyglsys.entity.Service;
import org.apache.ibatis.annotations.*;

/**
 * @author 龙会铭
 * Description: 维修单Dao层接口
 * 2020年1月10日
 */
public interface IServiceDao {
    // 查询
    // 1.根据维修单的id查询信息
    @Select("select id,type,content,cost,date,state from tb_service where id = #{id}")
    @ResultType(Service.class)
    public Service findServiceById(@Param("id") int id) throws Exception;

    // 2.查询所有维修单
    @Select("select id,type,content,cost,date,state from tb_service")
    @ResultType(Service.class)
    public List<Service> findAllService() throws Exception;

    // 多重查询
    public List<Service> findServiceByIndex(@Param("type") String type, @Param("content") String content,
                                            @Param("startMoney") Double startMoney, @Param("endMoney") Double endMoney,
                                            @Param("startDate") String startDate, @Param("endDate") String endDate,
                                            @Param("state") Integer state, @Param("currentPage") Integer currentPage,
                                            @Param("pageSize") Integer pageSize) throws Exception;

    // 添加
    // 1.添加维修单
    @Insert("insert into tb_service ( id,type,content,cost,date,state ) values(null,#{type},#{content},null,#{date},0)")
    @ResultType(int.class)
    public int addService(Service service) throws Exception;

    // 删除
    // 1.根据id删除维修单
    @Delete("delete from tb_service where id = #{id}")
    @ResultType(int.class)
    public int deleteService(@Param("id") int id) throws Exception;

    // 修改
    // 1.根据id修改维修单的信息
    @Update("update tb_service set type = #{type},content=#{content},cost=#{cost},date=#{date},state=#{state} where id = #{id}")
    @ResultType(int.class)
    public int updateService(Service service) throws Exception;

}
