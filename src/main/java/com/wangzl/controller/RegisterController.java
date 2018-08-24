package com.wangzl.controller;


import com.wangzl.utils.EncryptUtils;
import com.wangzl.utils.Msg;
import com.wangzl.bean.Teacher;
import com.wangzl.service.TeacherService;
import com.wangzl.utils.MD5;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class RegisterController {

    @Autowired
    TeacherService teacherService;

    @ResponseBody
    @RequestMapping(value = "/getmd5key", method = RequestMethod.POST)
    public Msg getTeacher(HttpServletRequest request) {
        String jsessionid = request.getRequestedSessionId();
        return Msg.success().add("md5key",MD5.keyMd5(jsessionid));
    }



    @RequestMapping(value = "/register")
    public String registerJudge(HttpServletRequest request,@RequestParam(value = "email",defaultValue = "-1")String email, @RequestParam(value = "password",defaultValue = "-1")String password, Model model) throws Exception {
        String jsessionid = request.getRequestedSessionId();
        if(!email.equals("-1")){
            email = EncryptUtils.aesDecrypt(email,EncryptUtils.KEY);
            Teacher teacherSql = teacherService.getPasswordByEmail(email);
            if(teacherSql==null){
                //用户不存在
                model.addAttribute("prompt","用户不存在，请核实！");
                return "registerPage";
            }
            else if(MD5.verify(teacherSql.getTeacherPassword(),MD5.keyMd5(jsessionid),password)){
                if(email.equals("Master@wzl.com")){
                    return "masterPage";
                }else {
                    model.addAttribute("teacherId",teacherSql.getTeacherId());
                    model.addAttribute("teacherName",teacherSql.getTeacherName());
                    return "teacherPage";
                }
            }
            else{
                model.addAttribute("prompt","密码有误，请核实你的密码！");
                return "registerPage";
            }
        }
        else {
            model.addAttribute("prompt","-1");
            return "registerPage";
        }
    }
}
