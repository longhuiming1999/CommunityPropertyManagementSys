package com.myuni.wyglsys.entity;

/**
 * @author 龙会铭
 * Description: 车位信息单实体类
 * 2020年1月9日
 */
public class CarPort {
    private int id;
    private int resId;
    private String resName;
    private String resPlateNum;
    private double sellMoney;
    private int isRent;

    public CarPort() {
        super();
        // TODO Auto-generated constructor stub
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getResId() {
        return resId;
    }

    public void setResId(int resId) {
        this.resId = resId;
    }

    public String getResName() {
        return resName;
    }

    public void setResName(String resName) {
        this.resName = resName;
    }

    public String getResPlateNum() {
        return resPlateNum;
    }

    public void setResPlateNum(String resPlateNum) {
        this.resPlateNum = resPlateNum;
    }

    public double getSellMoney() {
        return sellMoney;
    }

    public void setSellMoney(double sellMoney) {
        this.sellMoney = sellMoney;
    }

    public int getIsRent() {
        return isRent;
    }

    public void setIsRent(int isRent) {
        this.isRent = isRent;
    }

    @Override
    public String toString() {
        return "CarPort [id=" + id + ", resId=" + resId + ", resName=" + resName + ", resPlateNum=" + resPlateNum
                + ", sellMoney=" + sellMoney + ", isRent=" + isRent + "]";
    }

    public CarPort(int id, int resId, String resName, String resPlateNum, double sellMoney, int isRent) {
        super();
        this.id = id;
        this.resId = resId;
        this.resName = resName;
        this.resPlateNum = resPlateNum;
        this.sellMoney = sellMoney;
        this.isRent = isRent;
    }


}
