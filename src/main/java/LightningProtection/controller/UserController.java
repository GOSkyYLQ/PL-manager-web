package LightningProtection.controller;

import LightningProtection.pojo.ta_auth_user;
import LightningProtection.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    /*@RequestMapping(value = "userRegister",method = RequestMethod.GET)
    public String userRegister(ta_auth_user adduser, HttpServletRequest request, HttpServletResponse response) throws Exception{
        String username = request.getParameter("username");
        String realname = request.getParameter("realname");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        adduser.setUser_name(new  String(username.getBytes("iso-8859-1"),"UTF-8"));
        adduser.setReal_name(new String(realname.getBytes("iso-8859-1"),"UTF-8"));
        adduser.setPassword(new String(password.getBytes("iso-8859-1"),"UTF-8"));
        adduser.setMobile(new String(mobile.getBytes("iso-8859-1"),"UTF-8"));
        adduser.setEmail(new String(email.getBytes("iso-8859-1"),"UTF-8"));
        int flag = userService.userRegister(adduser);
        if (flag <= 0){
            ResponseUtil.write(response,"error");
            return "login";
        }else{
            return "login";
        }
    }*/

    @RequestMapping(value = "/",method = RequestMethod.POST)
    public String userLogin(HttpServletRequest request,HttpServletResponse response) throws Exception{
        String name = request.getParameter("username");
        String pass = request.getParameter("password");
        name = new String(name.getBytes("iso-8859-1"),"UTF-8");
        pass = new String(pass.getBytes("iso-8859-1"),"UTF-8");
        if (userService.userLogin(name,pass)){
            /*ResponseUtil.write(response,"登录成功");*/
            return "main";
        }else{
            ResponseUtil.write(response,"用户名或密码错误!");
            return "login";
        }
    }
}
