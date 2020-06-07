package com.myuni.wyglsys.test;/*
 * author:lg
 * date:2020/4/2
 */

import com.myuni.wyglsys.entity.*;
import com.myuni.wyglsys.service.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring-mybatis.xml")
public class TestServiceFindByIndex {
    @Resource
    ICarPortService carPortService;

    @Resource
    IComplaintService complaintService;

    @Resource
    IHouseService houseService;

    @Resource
    IPayService payService;

    @Resource
    IRepairService repairService;

    @Test
    public void testCartPortFindByIndex() {
        System.out.println(carPortService);
        try {
            List<CarPort> carportByIndex = carPortService.findCarportByIndex(null, null, null, null, null, 0, 3);
            for (CarPort byIndex : carportByIndex) {
                System.out.println(byIndex);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void testComplaintFindByIndex() {
        try {
            List<Complaint> complaintByIndex = complaintService.findComplaintByIndex(null, null, null, null, null, null, null);
            for (Complaint byIndex : complaintByIndex) {
                System.out.println(byIndex);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @Test
    public void testHouseFindByIndex(){
        try {
            List<House> list = houseService.findHouseByIndex(null, null, null, null, null, null, 0, 3);
            for (House house : list) {
                System.out.println(house);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void testPayFindByIndex(){
        try {
            List<Pay> list = payService.findPayByIndex(null, null, null, null, null, 0, 1);
            for (Pay pay : list) {
                System.out.println(pay);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Test
    public void testRepairFindByIndex(){
        try {
            List<Repair> list = repairService.findRepairByIndex(null, null, null, null, null, null, null, null, null);
            for (Repair repair : list) {
                System.out.println(repair);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
