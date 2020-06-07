package com.myuni.wyglsys.controller;/*
 * author:lg
 * date:2020/3/18
 */

import com.myuni.wyglsys.entity.Admin;
import com.myuni.wyglsys.service.IAdminService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/Admin")
public class AdminLoginController {

    @Resource
    IAdminService adminService;

    @GetMapping("/findAllAdmin")
    public String findAllAdmin(Model model) {
        try {
            List<Admin> list = adminService.findAllUser();
            model.addAttribute("list", list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/CpmsHTML/AdminPage/AdminLoginManage.jsp";
    }

    @PostMapping("/AdminLogin")
    public String adminLogin(@RequestParam("account") String account, @RequestParam("pwd") String password, HttpServletRequest request) {
        String msg = "";
        try {
            Admin admin = adminService.findUser(account, password);
            if (admin == null) {
                msg = "账号或者密码不正确!";
                // 用转发把失败信息带回登录界面
                request.setAttribute("msg", msg);
                return "/CpmsHTML/AdminLogin.jsp";
            }
            // 如果有
            // 创建此用户的session信息保存到服务器端
            HttpSession session = request.getSession();
            session.setAttribute("admin", admin);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/CpmsHTML/AdminPage/AdminIndex.jsp";
    }

    @GetMapping("/exit")
    public String exit(HttpServletRequest request){
        Admin admin = (Admin) request.getSession(true).getAttribute("admin");
        if(admin != null){
            request.getSession().removeAttribute("admin");
        }
        return "redirect:/CpmsHTML/AdminLogin.jsp";
    }

}
