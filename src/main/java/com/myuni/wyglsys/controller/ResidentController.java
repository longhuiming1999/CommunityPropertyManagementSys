package com.myuni.wyglsys.controller;/*
 * author:lg
 * date:2020/3/20
 */

import com.myuni.wyglsys.entity.PageBean;
import com.myuni.wyglsys.entity.Resident;
import com.myuni.wyglsys.service.IResidentService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/Resident")
public class ResidentController {

    @Resource
    IResidentService residentService;

    /**
     * 管理员添加业主信息
     *
     * @param resident
     * @return
     */
    @PostMapping("/addResident")
    public String addResident(Resident resident) {
        try {
            int num = residentService.addResident(resident);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/CpmsHTML/AdminPage/AdminResidents.jsp";
    }

    /**
     * 管理员删除业主信息
     *
     * @param id
     * @return
     */
    @GetMapping("/delete")
    public String delete(@RequestParam("rid") int id) {
        try {
            int num = residentService.deleteResident(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/Resident/findAllResident";
    }

    /**
     * 管理员更新业主信息
     *
     * @param resident
     * @return
     */
    @PostMapping("/updResident")
    public String updResident(Resident resident) {
        try {
            int num = residentService.updateResident(resident);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/Resident/findAllResident";
    }

    /**
     * 管理员查询小区内所有业主信息
     *
     * @param model
     * @return
     */
    @GetMapping("/findAllResident")
    public String findAllResident(Model model) {
        try {
            List<Resident> list = residentService.findAllResident();
            model.addAttribute("list", list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/CpmsHTML/AdminPage/AdminResidents.jsp";
    }

    @RequestMapping("/findByIndex")
    @ResponseBody
    public PageBean<Resident> findByIndex(@RequestParam(value = "name", defaultValue = "") String name,
                                          @RequestParam(value = "startAge", defaultValue = "") String stAge,
                                          @RequestParam(value = "endAge", defaultValue = "") String enAge,
                                          @RequestParam(value = "sex", defaultValue = "") String sex,
                                          @RequestParam(value = "phone", defaultValue = "") String phone,
                                          @RequestParam(value = "startDate", defaultValue = "") String startDate,
                                          @RequestParam(value = "endDate", defaultValue = "") String endDate,
                                          @RequestParam(value = "currentPage", defaultValue = "1") Integer cp,
                                          @RequestParam(value = "pageSize", defaultValue = "8") Integer ps) {

        name = "".equals(name.trim()) ? null : name.trim();
        Integer startAge = "".equals(stAge.trim()) ? null : Integer.parseInt(stAge.trim());
        Integer endAge = "".equals(enAge.trim()) ? null : Integer.parseInt(enAge.trim());
        sex = "".equals(sex.trim()) ? null : sex.trim();
        phone = "".equals(phone.trim()) ? null : phone.trim();
        startDate = "".equals(startDate.trim()) ? null : startDate.trim();
        endDate = "".equals(endDate.trim()) ? null : endDate.trim();


        List<Resident> list = null;

        PageBean<Resident> pageBean = new PageBean<>();

        try {
            List<Resident> residentsByIndex = residentService.findResidentsByIndex(name, startAge, endAge, sex, phone, startDate, endDate, null, null);

            // 获得总查询数
            int totalItem = residentsByIndex.size();
            // 设置当前页码
            pageBean.setCurrentPageNum(cp);
            // 设置每页显示数据数
            pageBean.setPageSize(ps);
            // 设置总数据数
            pageBean.setTotalDataNum(totalItem);
            // 设置总页面数
            pageBean.setTotalPageNum(pageBean.getTotalDateNum());

            Integer off = (pageBean.getCurrentPageNum() - 1) * pageBean.getPageSize();

            list = residentService.findResidentsByIndex(name, startAge, endAge, sex, phone, startDate, endDate, off, pageBean.getPageSize());
            // 设置查询结果
            pageBean.setDateList(list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pageBean;
    }

    @GetMapping("/findResidentByRid")
    @ResponseBody
    public Resident findResidentByRid(@RequestParam("rid") Integer rid) {
        Resident resident = null;
        try {
            resident = residentService.findResidentById(rid);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resident;
    }

}
