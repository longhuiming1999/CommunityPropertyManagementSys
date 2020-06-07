package com.myuni.wyglsys.controller;/*
 * author:lg
 * date:2020/3/19
 */

import com.myuni.wyglsys.entity.Complaint;
import com.myuni.wyglsys.entity.PageBean;
import com.myuni.wyglsys.entity.UserLogin;
import com.myuni.wyglsys.service.IComplaintService;
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
@RequestMapping("/Complaint")
public class ComplaintController {

    @Resource
    IComplaintService complaintService;

    @Resource
    IResidentService residentService;

    /**
     * 管理员查询小区内所有投诉信息
     *
     * @param model model对象，用来存放查询到的投诉集合
     * @return 返回到view页面
     */
    @GetMapping("/findAllComplaint")
    public String findAllComplaint(Model model) {
        try {
            List<Complaint> list = complaintService.findAllComplaint();
            model.addAttribute("list", list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/CpmsHTML/AdminPage/AdminComplaintsInfo.jsp";
    }

    /**
     * 管理员添加投诉信息
     *
     * @param complaint
     * @return
     */
    @PostMapping("/adminAddComplaint")
    public String addComplaint(Complaint complaint) {
        try {
            int num = complaintService.addComplaint(complaint);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/Complaint/findAllComplaint";
    }

    /**
     * 管理员删除单个投诉信息
     *
     * @param cid
     * @return
     */
    @GetMapping("/deleteComplaint")
    public String deleteComplaint(@RequestParam("cid") int cid) {
        try {
            int num = complaintService.deleteComplaint(cid);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/Complaint/findAllComplaint";
    }

    /**
     * 管理员修改投诉信息
     *
     * @param complaint
     * @return
     */
    @PostMapping("/updateComplaint")
    public String updateComplaint(Complaint complaint) {
        try {
            int num = complaintService.updateComplaint(complaint);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/Complaint/findAllComplaint";
    }

    /**
     * 管理员多重查询投诉信息
     *
     * @param name
     * @param content
     * @param startDate
     * @param endDate
     * @param st
     * @return
     */
    @PostMapping("/findByIndex")
    @ResponseBody
    public PageBean<Complaint> findByIndex(@RequestParam(value = "name", defaultValue = "") String name,
                                           @RequestParam(value = "content", defaultValue = "") String content,
                                           @RequestParam(value = "startDate", defaultValue = "") String startDate,
                                           @RequestParam(value = "endDate", defaultValue = "") String endDate,
                                           @RequestParam(value = "state", defaultValue = "") String st,
                                           @RequestParam(value = "currentPage", defaultValue = "1") Integer cp,
                                           @RequestParam(value = "pageSize", defaultValue = "8") Integer ps) {

        name = "".equals(name.trim()) ? null : name.trim();
        content = "".equals(content.trim()) ? null : content.trim();
        startDate = "".equals(startDate.trim()) ? null : startDate.trim();
        endDate = "".equals(endDate.trim()) ? null : endDate.trim();
        Integer state = "".equals(st.trim()) ? null : Integer.parseInt(st.trim());

        PageBean<Complaint> pageBean = new PageBean<>();

        try {
            // 设置当前页码
            pageBean.setCurrentPageNum(cp);
            // 设置每页显示数据条数
            pageBean.setPageSize(ps);
            // 设置多重查询总条数
            int totalDataNum = complaintService.findComplaintByIndex(name, content, startDate, endDate, state, null, null).size();
            pageBean.setTotalDataNum(totalDataNum);
            // 设置总页码数
            pageBean.setTotalPageNum(pageBean.getTotalPageNum());

            Integer off = (pageBean.getCurrentPageNum() - 1) * pageBean.getPageSize();

            List<Complaint> list = complaintService.findComplaintByIndex(name, content, startDate, endDate, state, off, pageBean.getPageSize());

            // 设置查询结果
            pageBean.setDateList(list);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return pageBean;
    }


    /**
     * 用户提交投诉信息
     *
     * @param complaint
     * @param model
     * @return
     */
    @PostMapping("/addComplaint")
    public String addComplaintForUser(Complaint complaint, Model model, HttpServletRequest request) {
        String msg = "";
        System.out.println(complaint);

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String date = sdf.format(new Date());
        complaint.setDate(date);

        UserLogin userLogin = (UserLogin) request.getSession(true).getAttribute("userLogin");

        try {
            int resId = residentService.findResidentByPhone(userLogin.getPhone()).getId();
            complaint.setResId(resId);

            int num = complaintService.addComplaint(complaint);
            if (num > 0) {
                msg = "投诉已提交!";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("msg", msg);
        return "/CpmsHTML/UserPage/UserComplaints.jsp";
    }

    @GetMapping("/findComplaintByCid")
    @ResponseBody
    public Complaint findComplaintByCid(@RequestParam("cid") Integer cid) {
        Complaint complaint = null;
        try {
            complaint = complaintService.findComplaintById(cid);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return complaint;
    }

}
