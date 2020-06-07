package com.myuni.wyglsys.controller;/*
 * author:lg
 * date:2020/3/20
 */

import com.myuni.wyglsys.entity.PageBean;
import com.myuni.wyglsys.entity.Repair;
import com.myuni.wyglsys.entity.Resident;
import com.myuni.wyglsys.entity.UserLogin;
import com.myuni.wyglsys.service.IRepairService;
import com.myuni.wyglsys.service.IResidentService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/Repair")
public class RepairController {

    @Resource
    IRepairService repairService;

    @Resource
    IResidentService residentService;

    /**
     * 管理员添加报修信息单
     *
     * @param repair
     * @return
     */
    @PostMapping("/addRepair")
    public String addRepair(Repair repair) {
        try {
            int num = repairService.addRepair(repair);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/Repair/findAllRepair";
    }

    /**
     * 管理员删除报修信息单
     *
     * @param id
     * @return
     */
    @GetMapping("/delete")
    public String delete(@RequestParam("rid") int id) {
        try {
            int num = repairService.deleteRepair(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/Repair/findAllRepair";
    }

    /**
     * 管理员修改报修单信息
     *
     * @param repair
     * @return
     */
    @PostMapping("/updateRepair")
    public String updateRepair(Repair repair) {
        try {
            int num = repairService.updateRepair(repair);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/Repair/findAllRepair";
    }

    /**
     * 管理员查询所有报修单信息
     *
     * @param model
     * @return
     */
    @GetMapping("/findAllRepair")
    public String findAllRepair(Model model) {
        try {
            List<Repair> list = repairService.findAllRepair();
            model.addAttribute("list", list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/CpmsHTML/AdminPage/AdminRepair.jsp";
    }

    /**
     * 管理员多重查询
     *
     * @param name
     * @param phone
     * @param type
     * @param content
     * @param startDate
     * @param endDate
     * @param st
     * @return
     */
    @PostMapping("/findByIndex")
    @ResponseBody
    public PageBean<Repair> findByIndex(@RequestParam(value = "name", defaultValue = "") String name,
                                        @RequestParam(value = "phone", defaultValue = "") String phone,
                                        @RequestParam(value = "type", defaultValue = "") String type,
                                        @RequestParam(value = "content", defaultValue = "") String content,
                                        @RequestParam(value = "startDate", defaultValue = "") String startDate,
                                        @RequestParam(value = "endDate", defaultValue = "") String endDate,
                                        @RequestParam(value = "state", defaultValue = "") String st,
                                        @RequestParam(value = "currentPage", defaultValue = "1") Integer cp,
                                        @RequestParam(value = "pageSize", defaultValue = "8") Integer ps) {
        name = "".equals(name.trim()) ? null : name.trim();
        phone = "".equals(phone.trim()) ? null : phone.trim();
        type = "".equals(type.trim()) ? null : type.trim();
        content = "".equals(content.trim()) ? null : content.trim();
        startDate = "".equals(startDate.trim()) ? null : startDate.trim();
        endDate = "".equals(endDate.trim()) ? null : endDate.trim();
        Integer state = "".equals(st.trim()) ? null : Integer.parseInt(st.trim());

        PageBean<Repair> pageBean = new PageBean<>();

        try {
            pageBean.setCurrentPageNum(cp);
            pageBean.setPageSize(ps);
            int totalDataNum = repairService.findRepairByIndex(name, phone, type, content, st, endDate, state, null, null).size();
            pageBean.setTotalDataNum(totalDataNum);
            pageBean.setTotalPageNum(pageBean.getTotalPageNum());

            Integer off = (pageBean.getCurrentPageNum() - 1) * pageBean.getPageSize();
            List<Repair> list = repairService.findRepairByIndex(name, phone, type, content, st, endDate, state, off, pageBean.getPageSize());
            pageBean.setDateList(list);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return pageBean;
    }

    @PostMapping("/submitRepair")
    public String submitRepair(Repair repair, Model model, HttpServletRequest request) {
        String msg = "";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String date = sdf.format(new Date());

        repair.setRepdate(date);

        UserLogin userLogin = (UserLogin) request.getSession(true).getAttribute("userLogin");

        try {
            Resident resident = residentService.findResidentByPhone(userLogin.getPhone());
            if (resident == null) {
                msg = "您不是小区业主!欢迎加入小区!";
                model.addAttribute("msg", msg);
            } else {
                repair.setResId(resident.getId());
                repairService.addRepair(repair);
                msg = "提交成功!";
                model.addAttribute("msg", msg);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/CpmsHTML/UserPage/UserRepair.jsp";
    }

    @GetMapping("/findRepairByRid")
    @ResponseBody
    public Repair findRepairBypid(@RequestParam("rid") Integer pid) {
        Repair repair = null;
        try {
            repair = repairService.findRepairById(pid);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return repair;
    }

}
