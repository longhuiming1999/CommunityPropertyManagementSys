package com.myuni.wyglsys.controller;/*
 * author:lg
 * date:2020/3/20
 */

import com.myuni.wyglsys.entity.PageBean;
import com.myuni.wyglsys.entity.Service;
import com.myuni.wyglsys.service.IServiceService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/Server")
public class ServerController {
    @Resource
    IServiceService serviceService;

    /**
     * 管理员添加维修信息
     *
     * @param service
     * @return
     */
    @PostMapping("/addService")
    public String addService(Service service) {
        try {
            int num = serviceService.addService(service);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/Server/findAllService";
    }

    /**
     * 管理员删除维修信息
     *
     * @param id
     * @return
     */
    @GetMapping("/delete")
    public String delete(@RequestParam("sid") int id) {
        try {
            int num = serviceService.deleteService(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/Server/findAllService";
    }

    /**
     * 管理员修改维修信息
     *
     * @param service
     * @return
     */
    @PostMapping("/updateService")
    public String updateService(Service service) {
        try {
            int num = serviceService.updateService(service);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/Server/findAllService";
    }

    /**
     * 管理员查询小区内所有维修信息
     *
     * @param model
     * @return
     */
    @GetMapping("/findAllService")
    public String findAllService(Model model) {
        try {
            List<Service> list = serviceService.findAllService();
            model.addAttribute("list", list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/CpmsHTML/AdminPage/AdminServer.jsp";
    }

    /**
     * 管理员多重查询
     *
     * @param type
     * @param content
     * @param stMoney
     * @param enMoney
     * @param startDate
     * @param endDate
     * @param st
     * @return
     */
    @PostMapping("/findByIndex")
    @ResponseBody
    public PageBean<Service> findByIndex(@RequestParam(value = "type", defaultValue = "") String type,
                                         @RequestParam(value = "content", defaultValue = "") String content,
                                         @RequestParam(value = "startMoney", defaultValue = "") String stMoney,
                                         @RequestParam(value = "endMoney", defaultValue = "") String enMoney,
                                         @RequestParam(value = "startDate", defaultValue = "") String startDate,
                                         @RequestParam(value = "endDate", defaultValue = "") String endDate,
                                         @RequestParam(value = "state", defaultValue = "") String st,
                                         @RequestParam(value = "currentPage", defaultValue = "1") Integer cp,
                                         @RequestParam(value = "pageSize", defaultValue = "8") Integer ps) {
        type = "".equals(type.trim()) ? null : type.trim();
        content = "".equals(content.trim()) ? null : content.trim();
        Double startMoney = "".equals(stMoney.trim()) ? null : Double.parseDouble(stMoney.trim());
        Double endMoney = "".equals(enMoney.trim()) ? null : Double.parseDouble(enMoney.trim());
        startDate = "".equals(startDate.trim()) ? null : startDate.trim();
        endDate = "".equals(endDate.trim()) ? null : endDate.trim();
        Integer state = "".equals(st.trim()) ? null : Integer.parseInt(st.trim());

        PageBean<Service> pageBean = new PageBean<>();

        try {
            pageBean.setCurrentPageNum(cp);
            pageBean.setPageSize(ps);

            int totalDataNum = serviceService.findServiceByIndex(type, content, startMoney, endMoney, startDate, endDate, state, null, null).size();
            pageBean.setTotalDataNum(totalDataNum);
            pageBean.setTotalPageNum(pageBean.getTotalPageNum());

            Integer off = (pageBean.getCurrentPageNum() - 1) * pageBean.getPageSize();

            List<Service> list = serviceService.findServiceByIndex(type, content, startMoney, endMoney, startDate, endDate, state, off, pageBean.getPageSize());
            pageBean.setDateList(list);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return pageBean;
    }

    /**
     * 用户提交小区维修申请
     *
     * @param service
     * @return
     */
    @PostMapping("/submitServer")
    public String submitServer(Service service, Model model) {
        String msg = "";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String date = sdf.format(new Date());
        service.setDate(date);
        try {
            int num = serviceService.addService(service);
            msg = "发送成功!";
            model.addAttribute("msg", msg);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/CpmsHTML/UserPage/UserServer.jsp";
    }

    @GetMapping("/findServiceBySid")
    @ResponseBody
    public Service findServiceBySid(@RequestParam("sid") Integer sid) {
        Service service = null;
        try {
            service = serviceService.findServiceById(sid);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return service;
    }
}
