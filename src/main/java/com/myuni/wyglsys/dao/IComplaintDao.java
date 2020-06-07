package com.myuni.wyglsys.dao;

import java.util.List;

import com.myuni.wyglsys.entity.Complaint;
import org.apache.ibatis.annotations.*;

/**
 * @author 龙会铭
 * Description: 投诉单Dao层接口
 * 2020年1月10日
 */
public interface IComplaintDao {
    // 查询
    // 1.根据投诉单的id查询信息
    @Select("select id,resid,resname,content,date,state from tb_complaints where id = #{id} ")
    @ResultType(Complaint.class)
    public Complaint findComplaintById(@Param("id") int id) throws Exception;


    // 2.查询所有投诉单
    @Select("select id,resid,resname,content,date,state from tb_complaints")
    @ResultType(Complaint.class)
    public List<Complaint> findAllComplaint() throws Exception;

    // 多重查询
    public List<Complaint> findComplaintByIndex(@Param("name") String name, @Param("content") String content, @Param("startDate") String startDate, @Param("endDate") String endDate,
                                                @Param("state") Integer state, @Param("currentPage") Integer currentPage, @Param("pageSize") Integer pageSize) throws Exception;

    // 添加
    // 1.添加投诉单
    @Insert("insert into tb_complaints ( resid,resname,content,date,state ) values(#{resId},#{resName},#{content},#{date},#{state})")
    @ResultType(int.class)
    public int addComplaint(Complaint complaint) throws Exception;

    // 删除
    // 1.根据id删除投诉单
    @Delete("delete from tb_complaints where id = #{id}")
    @ResultType(int.class)
    public int deleteComplaint(@Param("id") int id) throws Exception;

    // 修改
    // 1.根据id修改投诉单的信息
    @Update("update tb_complaints set resid = #{resId},resname = #{resName}, content = #{content}, date = #{date}, state = #{state} where id = #{id}")
    @ResultType(int.class)
    public int updateComplaint(Complaint complaint) throws Exception;
}
