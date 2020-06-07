package com.myuni.wyglsys.dao;

import java.util.List;

import com.myuni.wyglsys.entity.Resident;
import org.apache.ibatis.annotations.*;

/**
 * @author 龙会铭
 * Description: 租户Dao层接口
 * 2020年1月10日
 */
public interface IResidentDao {
    // 查询
    // 1.根据业主的id查询业主的信息
    @Select("select id,name,age,sex,phone,checkindate,remark from tb_resident where id = #{id}")
    @ResultType(Resident.class)
    public Resident findResidentById(@Param("id") int id) throws Exception;

    // 2.查询所有业主
    @Select("select id,name,age,sex,phone,checkindate,remark from tb_resident")
    @ResultType(Resident.class)
    public List<Resident> findAllResident() throws Exception;

    // 3.根据业主的手机号码查询业主的信息
    @Select("select id,name,age,sex,phone,checkindate,remark from tb_resident where phone = #{phone}")
    @ResultType(Resident.class)
    public Resident findResidentByPhone(@Param("phone") String phone) throws Exception;

    // 多重条件查询
    public List<Resident> findResidentsByIndex(@Param("name") String name, @Param("startAge") Integer startAge, @Param("endAge") Integer endAge, @Param("sex") String sex, @Param("phone") String phone,
                                               @Param("startDate") String startDate, @Param("endDate") String endDate, @Param("currentPage") Integer cp, @Param("pageSize") Integer ps) throws Exception;

    // 添加
    // 1.登记业主（添加业主）
    @Insert("insert into tb_resident ( name,age,sex,phone,checkindate,remark ) values(#{name},#{age},#{sex},#{phone},#{checkInDate},#{remark})")
    @ResultType(int.class)
    public int addResident(Resident resident) throws Exception;

    // 删除
    // 1.根据id注销业主（删除业主的信息）
    @Delete("delete from tb_resident where id = #{id}")
    @ResultType(int.class)
    public int deleteResident(@Param("id") int id) throws Exception;

    // 修改
    // 1.根据id修改业主的信息
    @Update("update tb_resident set name = #{name},age=#{age},sex=#{sex},phone=#{phone},checkindate=#{checkInDate},remark=#{remark} where id = #{id}")
    @ResultType(int.class)
    public int updateResident(Resident resident) throws Exception;
}
