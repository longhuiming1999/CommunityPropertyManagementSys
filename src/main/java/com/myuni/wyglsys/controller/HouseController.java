package com.myuni.wyglsys.controller;/*
 * author:lg
 * date:2020/3/19
 */

import com.myuni.wyglsys.entity.House;
import com.myuni.wyglsys.entity.PageBean;
import com.myuni.wyglsys.entity.Resident;
import com.myuni.wyglsys.entity.UserLogin;
import com.myuni.wyglsys.service.IHouseService;
import com.myuni.wyglsys.service.IResidentService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/House")
public class HouseController {

    @Resource
    IHouseService houseService;

    @Resource
    IResidentService residentService;

    /**
     * 管理员添加房产信息
     *
     * @param house
     * @return
     */
    @PostMapping("/addHouse")
    public String addHouse(House house) {
        try {
            int num = houseService.addHouse(house);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/House/findAllHouse";
    }

    /**
     * 管理员删除房产信息
     *
     * @param id
     * @return
     */
    @GetMapping("/delete")
    public String delete(@RequestParam("hid") int id) {
        try {
            int num = houseService.deleteHouse(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/House/findAllHouse";
    }

    /**
     * 管理员修改房产信息
     *
     * @param house
     * @return
     */
    @PostMapping("/updateHouse")
    public String updateHouse(House house) {
        try {
            int num = houseService.updateHouse(house);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/House/findAllHouse";
    }

    /**
     * 管理员查询小区内所有房产信息
     *
     * @param model
     * @return
     */
    @GetMapping("/findAllHouse")
    public String findAllHouse(Model model) {
        try {
            List<House> list = houseService.findAllHouse();
            model.addAttribute("list", list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/CpmsHTML/AdminPage/AdminHouseInfo.jsp";
    }

    /**
     * 管理员多重查询房产信息
     *
     * @param buildNum
     * @param unit
     * @param floor
     * @param houseNum
     * @param name
     * @param phone
     * @return
     */
    @PostMapping("/findByIndex")
    @ResponseBody
    public PageBean<House> findByIndex(@RequestParam(value = "buildNum", defaultValue = "") String buildNum,
                                       @RequestParam(value = "unit", defaultValue = "") String unit,
                                       @RequestParam(value = "floor", defaultValue = "") String floor,
                                       @RequestParam(value = "houseNum", defaultValue = "") String houseNum,
                                       @RequestParam(value = "name", defaultValue = "") String name,
                                       @RequestParam(value = "phone", defaultValue = "") String phone,
                                       @RequestParam(value = "currentPage", defaultValue = "1") Integer cp,
                                       @RequestParam(value = "pageSize", defaultValue = "8") Integer ps) {

        buildNum = "".equals(buildNum.trim()) ? null : buildNum.trim();
        unit = "".equals(unit.trim()) ? null : unit.trim();
        floor = "".equals(floor.trim()) ? null : floor.trim();
        houseNum = "".equals(houseNum.trim()) ? null : houseNum;
        name = "".equals(name.trim()) ? null : name.trim();
        phone = "".equals(phone.trim()) ? null : phone.trim();

        PageBean<House> pageBean = new PageBean<>();

        try {
            // 设置当前页码
            pageBean.setCurrentPageNum(cp);
            // 设置每页显示数据数
            pageBean.setPageSize(ps);
            // 设置查询数据总条数
            int totalDataNum = houseService.findHouseByIndex(buildNum, unit, floor, houseNum, name, phone, null, null).size();
            pageBean.setTotalDataNum(totalDataNum);
            // 计算总页面数
            pageBean.setTotalPageNum(pageBean.getTotalPageNum());

            Integer off = (pageBean.getCurrentPageNum() - 1) * pageBean.getPageSize();

            List<House> list = houseService.findHouseByIndex(buildNum, unit, floor, houseNum, name, phone, off, pageBean.getPageSize());

            // 设置查询结果
            pageBean.setDateList(list);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return pageBean;
    }

    /**
     * 用户查询自己的房产信息
     *
     * @param request
     * @param model
     * @return
     */
    @GetMapping("/findHouseById")
    public String findHouseById(HttpServletRequest request, Model model) {
        String msg = "";
        UserLogin userLogin = (UserLogin) request.getSession(true).getAttribute("userLogin");
        try {
            Resident resident = residentService.findResidentByPhone(userLogin.getPhone());
            if (resident == null) {
                msg = "您不是小区业主!欢迎加入小区!";
                model.addAttribute("msg", msg);
            } else {
                List<House> list = houseService.findHouseByResId(resident.getId());
                model.addAttribute("list", list);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/CpmsHTML/UserPage/UserHouseInfo.jsp";
    }

    @GetMapping("/findHouseByHid")
    @ResponseBody
    public House findHouseByHid(@RequestParam("hid") Integer hid) {
        House house = null;

        try {
            house = houseService.findHouseById(hid);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return house;
    }
}
