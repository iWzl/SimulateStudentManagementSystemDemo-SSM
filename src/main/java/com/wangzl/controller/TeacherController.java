package com.wangzl.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wangzl.utils.EncryptUtils;
import com.wangzl.utils.Msg;
import com.wangzl.bean.Teacher;
import com.wangzl.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class TeacherController {

    @Autowired
    TeacherService teacherService;

    @ResponseBody
    @RequestMapping(value = "/getteachername",method = RequestMethod.POST)
    public Msg getTeacherNameById(int teacherId){
        String name = teacherService.getTeacherNameById(teacherId);
        if(name.equals("管理员")){
            return Msg.fail().add("msg","教师不存在!");
        }
        return Msg.success().add("msg",name);

    }


    @ResponseBody
    @RequestMapping(value ="/deleteteacher",method = RequestMethod.POST)
    public Msg deleteTeacher(@RequestParam("teacherId")String teacherIds){
        if(teacherIds.contains("~")){
            List<Integer> del_ids = new ArrayList<>();
            String[] str_ids=teacherIds.split("~");
            for (String id:str_ids) {
                if(id.equals("0")){
                    continue;
                }else{
                    del_ids.add(Integer.parseInt(id));
                }

            }
            teacherService.deleteTeacherBatch(del_ids);
        }else {
            if (teacherIds.equals("0")){
                return Msg.fail();
            }
            teacherService.deleteTeacher(Integer.parseInt(teacherIds));
        }
        return Msg.success();
    }

    @ResponseBody
    @RequestMapping(value ="/getteacher",method = RequestMethod.POST)
    public Msg getTeacher(@RequestParam("teacherId") Integer teacherId){
        Teacher teacher= teacherService.getTeacher(teacherId);
        if(teacher.getTeacherGender().equals("男")){
            teacher.setTeacherGender("M");
        }else if(teacher.getTeacherGender().equals("女")){
            teacher.setTeacherGender("F");
        }
        return Msg.success().add("teacher",teacher);
    }

    @ResponseBody
    @RequestMapping(value ="/updateteacher",method = RequestMethod.POST)
    public Msg updateTeacher(@Valid Teacher teacher,BindingResult result) throws Exception {
        teacher.setTeacherPassword(EncryptUtils.aesDecrypt(teacher.getTeacherPassword(),EncryptUtils.KEY));
        if(result.hasErrors()){
            //校验失败.返回消息给模态框
            Map<String,Object> map = new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError fieldError:errors){
                map.put(fieldError.getField(),fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorFields",map);
        }else {
            if(teacher.getTeacherGender().equals("M")){
                teacher.setTeacherGender("男");
            }else if(teacher.getTeacherGender().equals("F")){
                teacher.setTeacherGender("女");
            }
            teacherService.updateTeacher(teacher);
            return Msg.success();
        }
    }

    @ResponseBody
    @RequestMapping(value ="/saveteacher",method = RequestMethod.POST)
    public Msg saveTeacher(Teacher teacher, BindingResult result) throws Exception {
        teacher.setTeacherPassword(EncryptUtils.aesDecrypt(teacher.getTeacherPassword(),EncryptUtils.KEY));
       if(result.hasErrors()){
           //校验失败.返回消息给模态框
           Map<String,Object> map = new HashMap<>();
           List<FieldError> errors = result.getFieldErrors();
           for (FieldError fieldError:errors){
               map.put(fieldError.getField(),fieldError.getDefaultMessage());
           }
           return Msg.fail().add("errorFields",map);
        }else {
           if(teacher.getTeacherGender().equals("M")){
               teacher.setTeacherGender("男");
           }else if(teacher.getTeacherGender().equals("F")){
               teacher.setTeacherGender("女");
           }
           teacherService.saveTeacher(teacher);
           return Msg.success();
       }
    }

    @ResponseBody
    @RequestMapping(value ="/teacherlist",method = RequestMethod.POST)
    public Msg getAllTeacher(@RequestParam(value = "requestCode") String requestCode) throws Exception {
        requestCode = requestCode.replaceAll(" ","+").trim();
        int pageNum =Integer.parseInt(EncryptUtils.aesDecrypt(requestCode,EncryptUtils.KEY));
          //每页的大小，和当前的页码
            PageHelper.startPage(pageNum,10);
            List<Teacher> teachers= teacherService.getAll();
            //使用pageInfo包装查询结果
            //需要连续显示的页码数
            PageInfo pageInfo = new PageInfo(teachers,5);
            return Msg.success().add("pageInfo",pageInfo);
    }


    @ResponseBody
    @RequestMapping(value ="/checkemail",method = RequestMethod.POST)
    public Msg hasTeacherEmail(@RequestParam(value = "teacherEmail") String teacherEmail){
        if(teacherService.hasTeacherEmail(teacherEmail)){
            return Msg.success();
        }else {
            return Msg.fail();
        }
    }

    @ResponseBody
    @RequestMapping(value ="/checkName",method = RequestMethod.POST)
    public Msg hasTeacherName(@RequestParam(value = "teacherName") String teacherName){
        if(teacherService.hasTeacherName(teacherName)){
            return Msg.success();
        }else {
            return Msg.warning();
        }
    }


}
