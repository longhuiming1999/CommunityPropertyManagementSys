package com.myuni.wyglsys.service.impl;

import java.util.List;

import com.myuni.wyglsys.dao.IPayDao;
import com.myuni.wyglsys.entity.Pay;
import com.myuni.wyglsys.service.IPayService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class PayServiceImpl implements IPayService {
    // service的实现类对象交给spring容器自动创建
    @Resource
    IPayDao payDao;

    @Override
    public Pay findPayById(int id) throws Exception {
        return payDao.findPayById(id);
    }

    @Override
    public List<Pay> findAllPay() throws Exception {
        return payDao.findAllPay();
    }

    @Override
    public List<Pay> findAllPayByResId(int resId) throws Exception {
        return payDao.findAllPayByResId(resId);
    }

    @Override
    public int addPay(Pay pay) throws Exception {
        return payDao.addPay(pay);
    }

    @Override
    public int deletePay(int id) throws Exception {
        return payDao.deletePay(id);
    }

    @Override
    public int updatePay(Pay pay) throws Exception {
        return payDao.updatePay(pay);
    }

    @Override
    public List<Pay> findPayByIndex(String resName, String type, Double startMoney, Double endMoney, Integer state, Integer currentPage, Integer pageSize)
            throws Exception {
        return payDao.findPayByIndex(resName, type, startMoney, endMoney, state, currentPage, pageSize);
    }

}
