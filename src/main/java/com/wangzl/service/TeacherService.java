package com.wangzl.service;

import com.wangzl.bean.Teach;
import com.wangzl.bean.TeachExample;
import com.wangzl.bean.Teacher;
import com.wangzl.bean.TeacherExample;
import com.wangzl.dao.TeachMapper;
import com.wangzl.dao.TeacherMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class TeacherService {

    @Autowired
    TeacherMapper teacherMapper;
    @Autowired
    TeachMapper teachMapper;

    public List<Teacher> getAll() {
        return teacherMapper.selectByExample(null);
    }

    public Teacher getPasswordByEmail(String teacherEmail) {
        TeacherExample teacherExample = new TeacherExample();
        TeacherExample.Criteria criteria = teacherExample.createCriteria();
        criteria.andTeacherEmailEqualTo(teacherEmail);
        List<Teacher> teacherList = teacherMapper.selectByExample(teacherExample);
        for (Teacher t:teacherList){
            return t;
        }
        return null;
    }

    public Teacher getTeacher(int teacherId) {
       Teacher teacher= teacherMapper.selectByPrimaryKey(teacherId);
        return teacher;
    }


    public boolean hasTeacherName(String teacherName) {
        TeacherExample teacherExample = new TeacherExample();
        TeacherExample.Criteria criteria = teacherExample.createCriteria();
        criteria.andTeacherNameEqualTo(teacherName);
        long count = teacherMapper.countByExample(teacherExample);
        return count==0;
    }

    public void saveTeacher(Teacher teacher) {teacherMapper.insertSelective(teacher);
    }

    public boolean hasTeacherEmail(String teacherEmail) {
        TeacherExample teacherExample = new TeacherExample();
        TeacherExample.Criteria criteria = teacherExample.createCriteria();
        criteria.andTeacherEmailEqualTo(teacherEmail);
        long count = teacherMapper.countByExample(teacherExample);
        return count==0;
    }


    public void updateTeacher(Teacher teacher) {
        teacherMapper.updateByPrimaryKeySelective(teacher);
    }

    public void deleteTeacher(Integer teacherId) {
        teacherMapper.deleteByPrimaryKey(teacherId);
    }

    public void deleteTeacherBatch(List<Integer> ids) {
        TeacherExample example = new TeacherExample();
        TeacherExample.Criteria criteria= example.createCriteria();
        criteria.andTeacherIdIn(ids);
        teacherMapper.deleteByExample(example);
    }

    public String getTeacherNameById(int teacherId) {
        Teacher teacher = teacherMapper.selectByPrimaryKey(teacherId);
        if(teacher==null){
            return "管理员";
        }
        else {
            return teacher.getTeacherName();
        }

    }

    public String getTeachersNameByClassId(int classId) {
        String teachersName = "";
        List<Teach> teachList = new ArrayList<>();
        TeachExample teachExample = new TeachExample();
        TeachExample.Criteria criteriaTeach = teachExample.createCriteria();
        criteriaTeach.andTeachClassIdEqualTo(classId);
        teachList=teachMapper.selectByExample(teachExample);
        for (Teach teach:teachList) {
            teachersName += teacherMapper.selectByPrimaryKey(teach.getTeachTeacherId()).getTeacherName()+" / ";
        }
        if(teachersName.length()>=3){
            teachersName = teachersName.substring(0,teachersName.length()-3);
        }
        return teachersName;
    }
}
