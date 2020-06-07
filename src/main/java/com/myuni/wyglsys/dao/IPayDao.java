package com.myuni.wyglsys.dao;

import java.util.List;

import com.myuni.wyglsys.entity.Pay;
import org.apache.ibatis.annotations.*;

/**
 * @author 龙会铭
 * Description: 缴费单Dao层接口
 * 2020年1月10日
 */
public interface IPayDao {
    // 查询
    // 1.根据缴费单的id查询信息
    @Select("select payid,resid,resname,type,money,state from tb_pay where payid = #{id}")
    @ResultType(Pay.class)
    public Pay findPayById(@Param("id") int id) throws Exception;

    // 2.查询所有缴费单
    @Select("select payid,resid,resname,type,money,state from tb_pay")
    @ResultType(Pay.class)
    public List<Pay> findAllPay() throws Exception;

    // 3.通过业主ID查询业主所有缴费信息
    @Select("select payid,resid,resname,type,money,state from tb_pay where resid = #{resId}")
    @ResultType(Pay.class)
    public List<Pay> findAllPayByResId(@Param("resId") int resId) throws Exception;

    // 多重查询
    public List<Pay> findPayByIndex(@Param("resName") String resName, @Param("type") String type,
                                    @Param("startMoney") Double startMoney, @Param("endMoney") Double endMoney,
                                    @Param("state") Integer state, @Param("currentPage") Integer currentPage,
                                    @Param("pageSize") Integer pageSize)
            throws Exception;

    // 添加
    // 1.添加缴费单
    @Insert("insert into tb_pay ( resid,resname,type,money,state ) values(#{resId},#{resName},#{type},#{money},#{state})")
    @ResultType(int.class)
    public int addPay(Pay pay) throws Exception;

    // 删除
    // 1.根据id删除缴费单
    @Delete("delete from tb_pay where payid = #{id}")
    @ResultType(int.class)
    public int deletePay(@Param("id") int id) throws Exception;

    // 修改
    // 1.根据id修改缴费单的信息
    @Update("update tb_pay set resId = #{resId},resName=#{resName},type=#{type},money=#{money},state=#{state} where payId = #{payId}")
    @ResultType(int.class)
    public int updatePay(Pay pay) throws Exception;
}
