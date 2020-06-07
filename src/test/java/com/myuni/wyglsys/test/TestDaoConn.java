package com.myuni.wyglsys.test;/*
 * author:lg
 * date:2020/3/18
 */

import com.myuni.wyglsys.dao.*;
import com.myuni.wyglsys.entity.CarPort;
import com.myuni.wyglsys.entity.Resident;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring-mybatis.xml")
public class TestDaoConn {
    @Resource
    ICarportDao carportDao;
    @Resource
    IAdminDao adminDao;
    @Resource
    IComplaintDao complaintDao;
    @Resource
    IHouseDao houseDao;
    @Resource
    IPayDao payDao;
    @Resource
    IRepairDao repairDao;
    @Resource
    IResidentDao residentDao;
    @Resource
    IServiceDao serviceDao;
    @Resource
    IUserLoginDao userLoginDao;

    @Test
    public void testDaoConn() {
        System.out.println(carportDao);
        System.out.println(adminDao);
        System.out.println(houseDao);
        System.out.println(payDao);
        System.out.println(complaintDao);
        System.out.println(repairDao);
        System.out.println(residentDao);
        System.out.println(serviceDao);
        System.out.println(complaintDao);
        System.out.println(userLoginDao);
    }

    @Test
    public void testIndex() {
        try {
            List<Resident> residentsByIndex = residentDao.findResidentsByIndex(null, null, null, null, null, null, null, null, null);
            System.out.println(residentsByIndex);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }


}
