package com.myuni.wyglsys.dao;

import java.util.List;

import com.myuni.wyglsys.entity.House;
import org.apache.ibatis.annotations.*;

/**
 * @author 龙会铭 Description: 房产Dao层接口 2020年1月10日
 */
public interface IHouseDao {
    // 查询
    // 1.根据房子的id查询房产的信息
    @Select("select id,buildnum,unit,floor,housenum,resid,name,phone from tb_house where id = #{id}")
    @ResultType(House.class)
    public House findHouseById(@Param("id") int id) throws Exception;

    // 2.查询物业公司所有房产
    @Select("select id,buildnum,unit,floor,housenum,resid,name,phone from tb_house")
    @ResultType(House.class)
    public List<House> findAllHouse() throws Exception;

    // 3.根据业主id查询房子信息
    @Select("select id,buildnum,unit,floor,housenum,resid,name,phone from tb_house where resid = #{resId}")
    @ResultType(House.class)
    public List<House> findHouseByResId(@Param("resId") int resId) throws Exception;

    // 4.根据条件筛选房子
    public List<House> findHouseByIndex(@Param("buildNum") String buildNum, @Param("unit") String unit, @Param("floor") String floor, @Param("houseNum") String houseNum, @Param("name") String name,
                                        @Param("phone") String phone, @Param("currentPage") Integer currentPage, @Param("pageSize") Integer pageSize) throws Exception;

    // 添加
    // 1.登记房产（添加房产）
    @Insert("insert into tb_house ( buildnum,unit,floor,housenum,resid,name,phone ) values(#{buildNum},#{unit},#{floor},#{houseNum},#{resId},#{name},#{phone})")
    @ResultType(int.class)
    public int addHouse(House house) throws Exception;

    // 删除
    // 1.根据id注销房产（删除房子的信息）
    @Delete("delete from tb_house where id = #{id}")
    @ResultType(int.class)
    public int deleteHouse(@Param("id") int id) throws Exception;

    // 修改
    // 1.根据id修改房产的信息
    @Update("update tb_house set buildnum = #{buildNum},unit=#{unit},floor=#{floor},housenum=#{houseNum},resid=#{resId},name=#{name},phone=#{phone} where id = #{id}")
    @ResultType(int.class)
    public int updateHouse(House house) throws Exception;
}
