package com.myuni.wyglsys.controller;/*
 * author:lg
 * date:2020/3/19
 */

import com.myuni.wyglsys.entity.PageBean;
import com.myuni.wyglsys.entity.Pay;
import com.myuni.wyglsys.entity.Resident;
import com.myuni.wyglsys.entity.UserLogin;
import com.myuni.wyglsys.service.IPayService;
import com.myuni.wyglsys.service.IResidentService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/Pay")
public class PayController {
    @Resource
    IPayService payService;

    @Resource
    IResidentService residentService;

    /**
     * 管理员添加缴费信息
     *
     * @param pay
     * @return
     */
    @PostMapping("/addPay")
    public String addPay(Pay pay) {
        try {
            int num = payService.addPay(pay);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/Pay/findAllPay";
    }

    /**
     * 管理员删除缴费信息
     *
     * @param id
     * @return
     */
    @GetMapping("/delete")
    public String delete(@RequestParam("pid") int id) {
        try {
            int num = payService.deletePay(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/Pay/findAllPay";
    }

    /**
     * 管理员修改缴费信息单
     *
     * @param pay
     * @return
     */
    @PostMapping("/updatePay")
    public String updatePay(Pay pay) {
        try {
            int num = payService.updatePay(pay);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/Pay/findAllPay";
    }

    /**
     * 管理员查询所有小区缴费信息
     *
     * @param model
     * @return
     */
    @GetMapping("/findAllPay")
    public String findAllPay(Model model) {
        try {
            List<Pay> list = payService.findAllPay();
            model.addAttribute("list", list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/CpmsHTML/AdminPage/AdminPay.jsp";
    }

    /**
     * 管理员模糊查询缴费信息
     *
     * @param name
     * @param type
     * @param stMoney
     * @param enMoney
     * @param st
     * @return
     */
    @PostMapping("/findByIndex")
    @ResponseBody
    public PageBean<Pay> findByIndex(@RequestParam(value = "name", defaultValue = "") String name,
                                     @RequestParam(value = "type", defaultValue = "") String type,
                                     @RequestParam(value = "startMoney", defaultValue = "") String stMoney,
                                     @RequestParam(value = "endMoney", defaultValue = "") String enMoney,
                                     @RequestParam(value = "state", defaultValue = "") String st,
                                     @RequestParam(value = "currentPage", defaultValue = "1") Integer cp,
                                     @RequestParam(value = "pageSize", defaultValue = "8") Integer ps) {
        name = "".equals(name.trim()) ? null : name.trim();
        type = "".equals(type.trim()) ? null : type.trim();
        Double startMoney = "".equals(stMoney.trim()) ? null : Double.parseDouble(stMoney.trim());
        Double endMoney = "".equals(enMoney.trim()) ? null : Double.parseDouble(enMoney.trim());
        Integer state = "".equals(st.trim()) ? null : Integer.parseInt(st.trim());

        PageBean<Pay> payPageBean = new PageBean<>();

        try {
            // 设置当前页码
            payPageBean.setCurrentPageNum(cp);
            // 设置每页显示数据数
            payPageBean.setPageSize(ps);
            // 设置总数据数
            int totalDataNum = payService.findPayByIndex(name, type, startMoney, endMoney, state, null, null).size();
            payPageBean.setTotalDataNum(totalDataNum);
            // 设置总页数
            payPageBean.setTotalPageNum(payPageBean.getTotalPageNum());

            Integer off = (payPageBean.getCurrentPageNum() - 1) * payPageBean.getPageSize();

            List<Pay> list = payService.findPayByIndex(name, type, startMoney, endMoney, state, off, payPageBean.getPageSize());
            payPageBean.setDateList(list);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return payPageBean;
    }

    @GetMapping("/findPayById")
    public String findPayById(HttpServletRequest request, Model model) {
        String msg = "";
        UserLogin userLogin = (UserLogin) request.getSession(true).getAttribute("userLogin");
        try {
            Resident resident = residentService.findResidentByPhone(userLogin.getPhone());
            if (resident == null) {
                msg = "您不是小区业主!欢迎加入小区!";
                model.addAttribute("msg", msg);
            } else {
                List<Pay> list = payService.findAllPayByResId(resident.getId());
                model.addAttribute("list", list);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/CpmsHTML/UserPage/UserPay.jsp";
    }

    @GetMapping("/findPayByPid")
    @ResponseBody
    public Pay findPayByPid(@RequestParam("pid") Integer pid) {
        Pay pay = null;
        try {
            pay = payService.findPayById(pid);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pay;
    }

}
