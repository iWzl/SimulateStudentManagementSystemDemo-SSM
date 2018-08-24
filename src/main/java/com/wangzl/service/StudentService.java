package com.wangzl.service;

import com.wangzl.bean.Student;
import com.wangzl.bean.StudentExample;
import com.wangzl.bean.Teacher;
import com.wangzl.dao.StudentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentService {
    @Autowired
    StudentMapper studentMapper;

    public int getClassNumberByClassId(int classId) {
        StudentExample studentExample = new StudentExample();
        StudentExample.Criteria criteria = studentExample.createCriteria();
        criteria.andStudentClassIdEqualTo(classId);
        long studentNumbers =studentMapper.countByExample(studentExample);
        return (int) studentNumbers;
    }

    public List<Student> getAllStuByClassId(int classId) {
        StudentExample studentExample = new StudentExample();
        StudentExample.Criteria criteria = studentExample.createCriteria();
        criteria.andStudentClassIdEqualTo(classId);
        return studentMapper.selectByExample(studentExample);
    }

    public void deleteStudentByStudentId(int studentId) {
        studentMapper.deleteByPrimaryKey(studentId);
    }

    public boolean hasStudent(Student student) {
        StudentExample studentExample = new StudentExample();
        StudentExample.Criteria criteria = studentExample.createCriteria();
        criteria.andStudentAddressEqualTo(student.getStudentAddress())
                .andStudentEnrollmentTimeEqualTo(student.getStudentEnrollmentTime())
                .andStudentGenderEqualTo(student.getStudentGender())
                .andStudentNameEqualTo(student.getStudentName())
                .andStudentNationalEqualTo(student.getStudentNational());
        long count = studentMapper.countByExample(studentExample);
        return 0!=count;

    }

    public void saveStudent(Student student) {
        studentMapper.insertSelective(student);
    }

    public Student getStudentByStudentId(int studentId) {
       return studentMapper.selectByPrimaryKey(studentId);
    }

    public void editStudent(Student student) {
        studentMapper.updateByPrimaryKeySelective(student);
    }
}
