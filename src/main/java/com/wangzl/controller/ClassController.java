package com.wangzl.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wangzl.bean.Class;
import com.wangzl.bean.Student;
import com.wangzl.bean.Teach;
import com.wangzl.service.ClassService;
import com.wangzl.service.StudentService;
import com.wangzl.service.TeacherService;
import com.wangzl.utils.EncryptUtils;
import com.wangzl.utils.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Objects;


/**
 * @author Wangzhili
 */
@Controller
public class ClassController {
    @Autowired
    ClassService classService;
    @Autowired
    StudentService studentService;
    @Autowired
    TeacherService teacherService;


    @RequestMapping(value = "/classPage", method = RequestMethod.POST)
    public String getTeacher(@RequestParam(value="requestCode",defaultValue = "ooo00o0OOO00O0O")String reqestCode) {
        if(reqestCode.equals("ooo00o0OOO00O0O")){
            return "classPage";
        }
        return null;
    }

    @ResponseBody
    @RequestMapping(value = "/classattr",method = RequestMethod.POST)
    public Msg getClassAttribute(String classCode) throws Exception {
        classCode = classCode.replaceAll(" ","+").trim();
        int classId =Integer.parseInt(Objects.requireNonNull(EncryptUtils.aesDecrypt(classCode, EncryptUtils.KEY)));
        int classNum=studentService.getClassNumberByClassId(classId);
        String teachersName = teacherService.getTeachersNameByClassId(classId);
        return Msg.success().add("classNums",classNum).add("teachersName",teachersName);
    }

    @ResponseBody
    @RequestMapping(value = "/deleteclass",method = RequestMethod.POST)
    public Msg deleteClass(String classCode) throws Exception {
        classCode = classCode.replaceAll(" ","+").trim();
        int classId =Integer.parseInt(Objects.requireNonNull(EncryptUtils.aesDecrypt(classCode, EncryptUtils.KEY)));
        classService.deleteClassByClassId(classId);
        return Msg.success();
    }


    @ResponseBody
    @RequestMapping(value = "/addclass",method = RequestMethod.POST)
    public Msg addClass(Class addClassForm){
        if(classService.hasClassByClassForm(addClassForm)){
            classService.addClass(addClassForm);
            return Msg.success();
        }
        else {
            return Msg.fail().add("msg","班级存在");
        }
    }

    @ResponseBody
    @RequestMapping(value = "/manageclass",method = RequestMethod.POST)
    public Msg manageClass(String ClassCode,int TeacherId){
        int classId = Integer.parseInt(ClassCode,16)-65536;
        if(classService.hasClass(classId)){
            return Msg.fail().add("msg","班级不存在！");
        }
        Teach teach = new Teach(TeacherId,classId);
        if(classService.hasTeach(teach)){
            //删除
            classService.outClass(teach);
            return Msg.success().add("msg","操作成功，退出该班级！");
        }else {
            //添加
            classService.joinClass(teach);
            return Msg.success().add("msg","操作成功，加入该班级！");
        }
    }


    @ResponseBody
    @RequestMapping(value = "/setclass", method = RequestMethod.POST)
    public Msg setClass(Class classFrom,@RequestParam(value="requestCode")String requestCode) throws Exception {
        requestCode = requestCode.replaceAll(" ","+").trim();
        int classId =Integer.parseInt(EncryptUtils.aesDecrypt(requestCode,EncryptUtils.KEY));
        classFrom.setClassId(classId);
        if(classId!=-1){
            classService.setClass(classFrom);
           return Msg.success();
        }
        else{
            return Msg.fail();
        }
    }


    @ResponseBody
    @RequestMapping(value ="/classlists",method = RequestMethod.POST)
    public Msg getAllClass(@RequestParam(value = "requestCode") String requestCode) throws Exception {
        requestCode = requestCode.replaceAll(" ","+").trim();
        int pageNum = Integer.parseInt(Objects.requireNonNull(EncryptUtils.aesDecrypt(requestCode, EncryptUtils.KEY)));
            //每页的大小，和当前的页码
            PageHelper.startPage(pageNum,10);
            List<Class> classes= classService.getAllClass();
            //使用pageInfo包装查询结果
            //需要连续显示的页码数
            PageInfo pageInfo = new PageInfo(classes,5);
            return Msg.success().add("pageInfo",pageInfo);
    }


    @ResponseBody
    @RequestMapping(value ="/classlist",method = RequestMethod.POST)
    public Msg getClassByTeacherId(@RequestParam(value = "requestCode") String requestCode) throws Exception {
            requestCode = requestCode.replaceAll(" ","+").trim();
            int teacherId =Integer.parseInt(EncryptUtils.aesDecrypt(requestCode,EncryptUtils.KEY));
            //每页的大小，和当前的页码
            PageHelper.startPage(1,9999);
            List<Class> classes= classService.getAllClassByTeacherId(teacherId);
            //使用pageInfo包装查询结果
            //需要连续显示的页码数
            PageInfo pageInfo = new PageInfo(classes,1);
            return Msg.success().add("pageInfo",pageInfo);
    }


    @ResponseBody
    @RequestMapping(value ="/getclass",method = RequestMethod.POST)
    public Msg getClassByClassId(@RequestParam(value = "requestCode") String requestCode) throws Exception {
        requestCode = requestCode.replaceAll(" ","+").trim();
        int classId = Integer.parseInt(EncryptUtils.aesDecrypt(requestCode,EncryptUtils.KEY));
        Class classs = classService.getClassById(classId);
        return Msg.success().add("class",classs);
    }

    @ResponseBody
    @RequestMapping(value ="/outclass",method = RequestMethod.POST)
    public Msg outClass(@RequestParam(value = "requestCodeC") String requestCodeC,@RequestParam(value = "requestCodeT") String requestCodeT) throws Exception{
        requestCodeC = requestCodeC.replaceAll(" ","+").trim();
        requestCodeT = requestCodeT.replaceAll(" ","+").trim();
        int classId = Integer.parseInt(Objects.requireNonNull(EncryptUtils.aesDecrypt(requestCodeC, EncryptUtils.KEY)));
        int teacherId = Integer.parseInt(Objects.requireNonNull(EncryptUtils.aesDecrypt(requestCodeT, EncryptUtils.KEY)));
        Teach teach = new Teach(teacherId,classId);
        classService.outClass(teach);
        return Msg.success();
    }

    @ResponseBody
    @RequestMapping(value ="/joinclass",method = RequestMethod.POST)
    public Msg joinClass(String joinClassCode,@RequestParam(value = "requestCode") String requestCode) throws Exception {
        requestCode = requestCode.replaceAll(" ","+").trim();
        int classId = Integer.parseInt(joinClassCode,16)-65536;
        int teacherId = Integer.parseInt(Objects.requireNonNull(EncryptUtils.aesDecrypt(requestCode, EncryptUtils.KEY)));
        Teach teach = new Teach(teacherId,classId);
        if(classService.hasClass(classId)){
            return Msg.fail().add("msg","班级不存在，请联系管理核实！");
        }
        else if(classService.hasTeach(teach)){
            return Msg.fail().add("msg","该班级已添加，请勿重复添加！");
        }else {
            classService.joinClass(teach);
            return Msg.success();
        }
    }
}