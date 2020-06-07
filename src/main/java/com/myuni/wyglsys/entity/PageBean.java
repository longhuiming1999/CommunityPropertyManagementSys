package com.myuni.wyglsys.entity;

import java.util.ArrayList;
import java.util.List;

/**
 * author lg
 * version ideal 2019.3.1
 * jdk 1.8
 * date 2020/2/17
 * remark 分页核心bean
 */

public class PageBean<T> {
    private int currentPageNum = 1; // 当前页面数
    private int totalPageNum = 0; // 总页面数
    private int totalDataNum = 0; // 总数据数
    private int pageSize = 8;     // 每页显示的数据数
    private List<T> dataList = new ArrayList<T>(); // 每页数据的集合

    public int getCurrentPageNum() {
        return currentPageNum;
    }

    public void setCurrentPageNum(int currentPageNum) {
        this.currentPageNum = currentPageNum;
    }

    public int getTotalPageNum() {
        if (totalDataNum % pageSize == 0) {
            totalPageNum = totalDataNum / pageSize;
        } else {
            totalPageNum = (totalDataNum / pageSize) + 1;
        }
        return totalPageNum;
    }

    public void setTotalPageNum(int totalPageNum) {
        this.totalPageNum = totalPageNum;
    }

    public int getTotalDateNum() {
        return totalDataNum;
    }

    public void setTotalDataNum(int totalDateNum) {
        this.totalDataNum = totalDateNum;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public List<T> getDataList() {
        return dataList;
    }

    public void setDateList(List<T> dataList) {
        this.dataList = dataList;
    }
}
