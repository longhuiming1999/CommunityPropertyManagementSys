package com.myuni.wyglsys.controller;/*
 * author:lg
 * date:2020/3/19
 */

import com.myuni.wyglsys.entity.CarPort;
import com.myuni.wyglsys.entity.PageBean;
import com.myuni.wyglsys.entity.Resident;
import com.myuni.wyglsys.entity.UserLogin;
import com.myuni.wyglsys.service.ICarPortService;
import com.myuni.wyglsys.service.IResidentService;
import com.myuni.wyglsys.service.IUserLoginService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/Car")
public class CarController {
    @Resource
    ICarPortService carPortService;

    @Resource
    IResidentService residentService;

    /**
     * 管理员修改车位信息
     *
     * @param carPort 被修改的车位信息
     * @return 返回管理员查询所有车位界面
     */
    @PostMapping("/updateCarPort")
    public String updateCarPort(CarPort carPort) {
        try {
            System.out.println(carPort.toString());
            int num = carPortService.updateCarPort(carPort);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/Car/findAllCarPort";
    }

    /**
     * 管理员添加小区车位信息
     *
     * @param carPort 被添加的车位信息
     * @return 返回小区所有车位信息界面
     */
    @PostMapping("/addCarPort")
    public String addCarPort(CarPort carPort) {
        System.out.println(carPort);
        try {
            int num = carPortService.addCarPort(carPort);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/Car/findAllCarPort";
    }

    /**
     * 管理员删除车位信息
     *
     * @param cid 被删除车位的id
     * @return 删除之后返回主页面
     */
    @GetMapping("/deleteCarPortByCid")
    public String deleteCarByCid(@RequestParam("cid") int cid) {
        try {
            int num = carPortService.deleteCarPort(cid);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/Car/findAllCarPort";
    }

    /**
     * 管理员查询所有车辆
     *
     * @param model model域
     * @return 返回路径
     */
    @GetMapping("/findAllCarPort")
    public String findAllCarPort(Model model) {
        try {
            List<CarPort> list = carPortService.findAllCarPort();
            model.addAttribute("list", list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/CpmsHTML/AdminPage/AdminCar.jsp";
    }

    /**
     * 用户修改自己的车位信息状态
     *
     * @param carPort 被修改的车位
     * @return 返回用户车位界面
     */
    @PostMapping("/updateCarPortFormUser")
    public String updateCarPortFormUser(CarPort carPort) {
        try {
            int num = carPortService.updateCarPort(carPort);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/Car/findCarPortByResId";
    }

    /**
     * 管理员多重查询车位信息
     *
     * @param name
     * @param resPlateNum
     * @param stMoney
     * @param enMoney
     * @param iRent
     * @return
     */
    @PostMapping("/findByIndex")
    @ResponseBody
    public PageBean<CarPort> findByIndex(@RequestParam(value = "name", defaultValue = "") String name,
                                         @RequestParam(value = "resPlateNum", defaultValue = "") String resPlateNum,
                                         @RequestParam(value = "startMoney", defaultValue = "") String stMoney,
                                         @RequestParam(value = "endMoney", defaultValue = "") String enMoney,
                                         @RequestParam(value = "isRent", defaultValue = "") String iRent,
                                         @RequestParam(value = "currentPage", defaultValue = "1") Integer cp,
                                         @RequestParam(value = "pageSize", defaultValue = "8") Integer ps) {

        name = "".equals(name.trim()) ? null : name.trim();
        resPlateNum = "".equals(resPlateNum.trim()) ? null : resPlateNum.trim();
        Double startMoney = "".equals(stMoney.trim()) ? null : Double.parseDouble(stMoney.trim());
        Double endMoney = "".equals(enMoney.trim()) ? null : Double.parseDouble(enMoney.trim());
        Integer isRent = "".equals(iRent.trim()) ? null : Integer.parseInt(iRent.trim());

        PageBean<CarPort> pageBean = new PageBean<>();
        try {
            // 获得总查询条数
            int totalDataItem = carPortService.findCarportByIndex(name, resPlateNum, startMoney, endMoney, isRent, null, null).size();
            // 设置页面显示数据大小
            pageBean.setPageSize(ps);
            // 设置当前页码
            pageBean.setCurrentPageNum(cp);
            // 设置总数据条数
            pageBean.setTotalDataNum(totalDataItem);
            // 设置总页面数
            pageBean.setTotalPageNum(pageBean.getTotalPageNum());

            Integer off = (pageBean.getCurrentPageNum() - 1) * pageBean.getPageSize();

            List<CarPort> list = carPortService.findCarportByIndex(name, resPlateNum, startMoney, endMoney, isRent, off, pageBean.getPageSize());
            // 设置查询结果
            pageBean.setDateList(list);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return pageBean;
    }

    /**
     * 用户查询自己拥有的所有车位
     *
     * @param request 请求对象
     * @param model   model对象
     * @return 展示用户所有的车位
     */
    @GetMapping("/findCarPortByResId")
    public String findCarPortByResId(HttpServletRequest request, Model model) {
        String msg = "";
        UserLogin userLogin = (UserLogin) request.getSession(true).getAttribute("userLogin");
        if (userLogin == null) {
            return "redirect:/CpmsHTML/sign-in.jsp";
        }
        String phone = userLogin.getPhone();
        try {
            Resident resident = residentService.findResidentByPhone(phone);
            if (resident == null) {
                msg = "您不是小区业主!欢迎加入小区!";
                model.addAttribute("msg", msg);
            } else {
                List<CarPort> list = carPortService.findCarPortByResId(resident.getId());
                model.addAttribute("list", list);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/CpmsHTML/UserPage/UserCar.jsp";
    }

    @PostMapping("findCartPortByCid")
    @ResponseBody
    public CarPort findCartPortByCid(@RequestParam("cid") Integer cid) {
        CarPort carPortById = null;
        try {
            carPortById = carPortService.findCarPortById(cid);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return carPortById;
    }
}
