package com.wangzl.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wangzl.bean.Class;
import com.wangzl.bean.Student;
import com.wangzl.bean.Teacher;
import com.wangzl.service.StudentService;
import com.wangzl.utils.EncryptUtils;
import com.wangzl.utils.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Controller
public class StudentController {
    @Autowired
    StudentService studentService;

    @RequestMapping(value = "/tostudentpage",method = RequestMethod.POST)
    public String toPage(String toPageClassCode,Model model) throws Exception {
        toPageClassCode = toPageClassCode.replaceAll(" ","+").trim();
        int classId =Integer.parseInt(Objects.requireNonNull(EncryptUtils.aesDecrypt(toPageClassCode, EncryptUtils.KEY)));
        model.addAttribute("classId",classId);
        return "studentPage";
    }

    @ResponseBody
    @RequestMapping(value = "/getstudent",method = RequestMethod.POST)
    public Msg getStudentByStudentId(String studentCode) throws Exception {
        studentCode = studentCode.replaceAll(" ","+").trim();
        int studentId = Integer.parseInt(Objects.requireNonNull(EncryptUtils.aesDecrypt(studentCode, EncryptUtils.KEY)));
        Student student = studentService.getStudentByStudentId(studentId);
        if(student.getStudentGender().equals("男")){
            student.setStudentGender("M");
        }else if(student.getStudentGender().equals("女")){
            student.setStudentGender("F");
        }
        return Msg.success().add("student",student);
    }





    @ResponseBody
    @RequestMapping(value = "/getallstudent",method = RequestMethod.POST)
    public Msg getAllStudentByClassId(String requestCode,String requestId) throws Exception {
        requestCode = requestCode.replaceAll(" ","+").trim();
        requestId = requestId.replaceAll(" ","+").trim();
        int pageNum = Integer.parseInt(Objects.requireNonNull(EncryptUtils.aesDecrypt(requestCode, EncryptUtils.KEY)));
        int classId = Integer.parseInt(Objects.requireNonNull(EncryptUtils.aesDecrypt(requestId, EncryptUtils.KEY)));
        PageHelper.startPage(pageNum,20);
        List<Student> students= studentService.getAllStuByClassId(classId);
        //使用pageInfo包装查询结果
        //需要连续显示的页码数
        PageInfo pageInfo = new PageInfo(students,5);
        return Msg.success().add("pageInfo",pageInfo);
    }

    @ResponseBody
    @RequestMapping(value = "/deletestudent",method = RequestMethod.POST)
    public Msg deleteStudentById(String studentCode) throws Exception {
        studentCode = studentCode.replaceAll(" ","+").trim();
        String studentIds = EncryptUtils.aesDecrypt(studentCode, EncryptUtils.KEY);
        if(studentIds.contains("~")){
            String[] str_ids=studentIds.split("~");
            for (String id:str_ids) {
                studentService.deleteStudentByStudentId(Integer.parseInt(id));
            }
            return Msg.success();
        }
        else {
            studentService.deleteStudentByStudentId(Integer.parseInt(studentIds));
            return Msg.success();
        }
    }

    @ResponseBody
    @RequestMapping(value = "/savastudent",method = RequestMethod.POST)
    public Msg savaStudent(Student student){
        if(student.getStudentGender().equals("M")){
           student.setStudentGender("男");
        }else if(student.getStudentGender().equals("F")){
            student.setStudentGender("女");
        }
        if(studentService.hasStudent(student)){
            return Msg.fail();
        }else {
            studentService.saveStudent(student);
            return Msg.success();
        }
    }

    @ResponseBody
    @RequestMapping(value = "/editstudent",method = RequestMethod.POST)
    public Msg editStudent(Student student,String studentCode) throws Exception {
        if(student.getStudentGender().equals("M")){
            student.setStudentGender("男");
        }else if(student.getStudentGender().equals("F")){
            student.setStudentGender("女");
        }
        studentCode = studentCode.replaceAll(" ","+").trim();
        int studentId = Integer.parseInt(Objects.requireNonNull(EncryptUtils.aesDecrypt(studentCode, EncryptUtils.KEY)));
        student.setStudentId(studentId);
        studentService.editStudent(student);
        return Msg.success();
    }


}
