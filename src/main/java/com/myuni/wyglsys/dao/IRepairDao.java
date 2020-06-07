package com.myuni.wyglsys.dao;

import java.util.List;

import com.myuni.wyglsys.entity.Repair;
import org.apache.ibatis.annotations.*;

/**
 * @author 龙会铭
 * Description: 报修单Dao层接口
 * 2020年1月10日
 */
public interface IRepairDao {
    // 查询
    // 1.根据报修单的id查询信息
    @Select("select id,resid,resname,phone,type,content,repdate,state from tb_repair where id = #{id}")
    @ResultType(Repair.class)
    public Repair findRepairById(@Param("id") int id) throws Exception;

    // 2.查询所有报修单
    @Select("select id,resid,resname,phone,type,content,repdate,state from tb_repair")
    @ResultType(Repair.class)
    public List<Repair> findAllRepair() throws Exception;

    // 多重查询
    public List<Repair> findRepairByIndex(@Param("name") String name, @Param("phone") String phone, @Param("type") String type, @Param("content") String content, @Param("startDate") String startDate,
                                          @Param("endDate") String endDate, @Param("state") Integer state, @Param("currentPage") Integer cp, @Param("pageSize") Integer pageSize) throws Exception;

    // 添加
    // 1.添加报修单
    @Insert("insert into tb_repair ( resid,resname,phone,type,content,repdate,state ) values(#{resId},#{resname},#{phone},#{type},#{content},#{repdate},#{state})")
    @ResultType(int.class)
    public int addRepair(Repair repair) throws Exception;

    // 删除
    // 1.根据id删除报修单
    @Delete("delete from tb_repair where id = #{id}")
    @ResultType(int.class)
    public int deleteRepair(@Param("id") int id) throws Exception;

    // 修改
    // 1.根据id修改报修单的信息
    @Update("update tb_repair set resid = #{resId},resname=#{resname},phone=#{phone},type=#{type},content=#{content},repdate=#{repdate},state=#{state} where id = #{id}")
    @ResultType(int.class)
    public int updateRepair(Repair repair) throws Exception;
}
