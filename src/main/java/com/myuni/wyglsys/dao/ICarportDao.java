package com.myuni.wyglsys.dao;

import java.util.List;

import com.myuni.wyglsys.entity.CarPort;
import org.apache.ibatis.annotations.*;

/**
 * @author 龙会铭
 * Description: 车位表Dao层接口
 * 2020年1月10日
 */

public interface ICarportDao {
    // 查询
    // 1.根据车位信息单的id查询信息
    @Select("select id,resid,resname,resPlateNum,sellmoney,isrent from tb_carport where id = #{id}")
    @ResultType(CarPort.class)
    public CarPort findCarPortById(@Param("id") int id) throws Exception;

    // 根据业主ID查询
    @Select("select id,resid,resname,resPlateNum,sellmoney,isrent from tb_carport where resid = #{resid}")
    @ResultType(CarPort.class)
    public List<CarPort> findCarPortByResId(@Param("resid") int resId) throws Exception;

    // 2.查询所有车位信息单
    @Select("select id,resid,resname,resPlateNum,sellMoney,isrent from tb_carport")
    @ResultType(CarPort.class)
    public List<CarPort> findAllCarPort() throws Exception;

    // 3.多重查询
    public List<CarPort> findCarportByIndex(@Param("resName") String resName, @Param("resPlateNum") String resPlateNum, @Param("startMoney") Double startMoney, @Param("endMoney") Double endMoney,
                                            @Param("state") Integer state, @Param("currentPage") Integer currentPage, @Param("pageSize") Integer pageSize) throws Exception;

    // 添加
    // 1.添加车位信息单
    @Insert("insert into tb_carport ( resid,resname,resPlateNum,sellMoney,isrent ) values(#{resId},#{resName},#{resPlateNum},#{sellMoney},#{isRent})")
    @ResultType(int.class)
    public int addCarPort(CarPort carPort) throws Exception;

    // 删除
    // 1.根据id删除车位信息单
    @Delete("delete from tb_carport where id = #{id}")
    @ResultType(int.class)
    public int deleteCarPort(@Param("id") int id) throws Exception;

    // 修改
    // 1.根据id修改车位信息单的信息
    @Update("update tb_carport set resid = #{resId},resname=#{resName},resPlateNum=#{resPlateNum},sellmoney=#{sellMoney},isrent=#{isRent} where id = #{id}")
    @ResultType(int.class)
    public int updateCarPort(CarPort carPort) throws Exception;
}
