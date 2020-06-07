package com.myuni.wyglsys.controller;/*
 * author:lg
 * date:2020/3/19
 */

import com.myuni.wyglsys.entity.PageBean;
import com.myuni.wyglsys.entity.UserLogin;
import com.myuni.wyglsys.service.IUserLoginService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/User")
public class UserLoginController {

    @Resource
    IUserLoginService userLoginService;

    @PostMapping("/addUserLogin")
    public String addUserLogin(UserLogin userLogin) {
        try {
            int num = userLoginService.addUserLogin(userLogin);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/User/findAllUser";
    }

    @GetMapping("/delete")
    public String deleteUser(@RequestParam("uid") int id) {
        try {
            int num = userLoginService.deleteUserById(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/User/findAllUser";

    }

    @PostMapping("/updUserLogin")
    public String updUserLogin(UserLogin userLogin) {
        try {
            int num = userLoginService.updateUserLogin(userLogin);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/User/findAllUser";
    }

    @GetMapping("/findAllUser")
    public String findAllUser(Model model) {
        try {
            List<UserLogin> list = userLoginService.findAllUser();
            model.addAttribute("list", list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/CpmsHTML/AdminPage/AdminUserLoginManage.jsp";
    }

    @PostMapping("/findByIndex")
    @ResponseBody
    public PageBean<UserLogin> findByIndex(@RequestParam(value = "account", defaultValue = "") String account,
                                           @RequestParam(value = "phone", defaultValue = "") String phone,
                                           @RequestParam(value = "email", defaultValue = "") String email,
                                           @RequestParam(value = "currentPage", defaultValue = "1") Integer cp,
                                           @RequestParam(value = "pageSize", defaultValue = "8") Integer ps) {
        account = "".equals(account.trim()) ? null : account.trim();
        phone = "".equals(phone.trim()) ? null : phone.trim();
        email = "".equals(email.trim()) ? null : email.trim();

        PageBean<UserLogin> pageBean = new PageBean<>();

        try {
            pageBean.setCurrentPageNum(cp);
            pageBean.setPageSize(ps);
            int totalDataNum = userLoginService.findByIndex(account, phone, email, null, null).size();
            pageBean.setTotalDataNum(totalDataNum);
            pageBean.setTotalPageNum(pageBean.getTotalPageNum());

            Integer off = (pageBean.getCurrentPageNum() - 1) * pageBean.getPageSize();

            List<UserLogin> list = userLoginService.findByIndex(account, phone, email, off, pageBean.getPageSize());
            pageBean.setDateList(list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pageBean;
    }

    @PostMapping("/UserLogin")
    public String userLogin(HttpServletRequest request, @RequestParam("name") String name, @RequestParam("pwd") String pwd, @RequestParam("yzm") String yzm, HttpSession session) {
        String msg = "";
        try {
            String sessionYzm = (String) session.getAttribute("rand");
            if (sessionYzm.equals(yzm)) {
                UserLogin user = userLoginService.findUserByAccountAndPwd(name, pwd);
                if (user == null) {
                    msg = "账号或者密码不正确!";
                    // 用转发把失败信息带回登录界面
                    request.setAttribute("msg", msg);
                    return "/CpmsHTML/sign-in.jsp";
                } else {
                    session.setAttribute("userLogin", user);
                }
            } else {
                msg = "验证码错误!";
                request.setAttribute("msg", msg);
                return "/CpmsHTML/sign-in.jsp";
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/CpmsHTML/UserPage/UserIndex.jsp";
    }

    @PostMapping("/register")
    public String register(UserLogin userLogin, Model model) {
        String msg = "";
        String phone = userLogin.getPhone();
        String account = userLogin.getAccount();
        try {
            if (userLoginService.findUserLoginByAccount(account) != null) {
                msg = "账号已存在!";
            } else if (userLoginService.findUserLoginByPhone(phone) != null) {
                msg = "手机号码已被注册!";
            } else {
                userLoginService.addUserLogin(userLogin);
                msg = "注册成功!";
                model.addAttribute("msg", msg);
                return "/CpmsHTML/register.jsp";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("msg", msg);
        return "/CpmsHTML/register.jsp";
    }

    @GetMapping("/exit")
    public String exit(HttpServletRequest request) {
        UserLogin userLogin = (UserLogin) request.getSession(true).getAttribute("userLogin");
        if (userLogin != null) {
            request.getSession().removeAttribute("userLogin");
        }
        return "redirect:/CpmsHTML/sign-in.jsp";
    }

    @PostMapping("/updUserInfo")
    public String updUserInfo(UserLogin userLogin, HttpServletRequest request, Model model) {
        String msg = "";
        UserLogin login = (UserLogin) request.getSession(true).getAttribute("userLogin");
        userLogin.setId(login.getId());
        try {
            int num = userLoginService.updateUserLogin(userLogin);
            if (num > 0) {
                request.getSession().setAttribute("userLogin", userLogin);
                msg = "修改成功!";
            } else {
                msg = "修改失败!";
            }
            model.addAttribute("msg", msg);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/CpmsHTML/UserPage/UserInfoUpd.jsp";

    }

    @GetMapping("/findUserByUid")
    @ResponseBody
    public UserLogin findUserByUid(@RequestParam("uid") Integer uid) {
        UserLogin userLogin = null;

        try {
            userLogin = userLoginService.findUserLoginById(uid);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return userLogin;

    }

}
