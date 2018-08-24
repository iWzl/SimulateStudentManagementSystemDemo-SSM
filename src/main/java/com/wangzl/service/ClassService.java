package com.wangzl.service;

import com.wangzl.bean.Class;
import com.wangzl.bean.ClassExample;
import com.wangzl.bean.Teach;
import com.wangzl.bean.TeachExample;
import com.wangzl.dao.ClassMapper;
import com.wangzl.dao.TeachMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Wangzhili
 */
@Service
public class ClassService {
    @Autowired
    ClassMapper classMapper;
    @Autowired
    TeachMapper teachMapper;

    public List<Class> getAllClassByTeacherId(int teacherId){
        List<Class> classes = new ArrayList<>();
        for (Teach teach:getAllTeachByTeacherId(teacherId)) {
            classes.add(classMapper.selectByPrimaryKey(teach.getTeachClassId()));
        }
        return classes;
    }

    public List<Teach>getAllTeachByTeacherId(int teacherId){
        TeachExample teachExample = new TeachExample();
        TeachExample.Criteria criteria = teachExample.createCriteria();
        criteria.andTeachTeacherIdEqualTo(teacherId);
        List<Teach> teachList = teachMapper.selectByExample(teachExample);
        return teachList;
    }

    public List<Class> getAllClass() {
        return classMapper.selectByExample(null);
    }

    public Class getClassById(int id) {
        return classMapper.selectByPrimaryKey(id);
    }

    public void setClass(Class classFrom) {
        classMapper.updateByPrimaryKey(classFrom);
    }

    public void joinClass(Teach teach) {
       teachMapper.insertSelective(teach);
    }

//    ClassExample classExample = new ClassExample();
//    ClassExample.Criteria criteria= classExample.createCriteria();
//    criteria.


    public boolean hasClass(int classId) {
      Class c= classMapper.selectByPrimaryKey(classId);
        return c==null;
    }

    public boolean hasTeach(Teach teach) {
        TeachExample teachExample = new TeachExample();
        TeachExample.Criteria criteria= teachExample.createCriteria();
        criteria.andTeachTeacherIdEqualTo(teach.getTeachTeacherId())
                  .andTeachClassIdEqualTo(teach.getTeachClassId());
        long count = teachMapper.countByExample((teachExample));
        return 0!=count;
    }

    public void outClass(Teach teach) {
        TeachExample teachExample = new TeachExample();
        TeachExample.Criteria criteria= teachExample.createCriteria();
        criteria.andTeachTeacherIdEqualTo(teach.getTeachTeacherId())
                .andTeachClassIdEqualTo(teach.getTeachClassId());
        teachMapper.deleteByExample(teachExample);
    }

    public void addClass(Class addClassForm) {
        classMapper.insertSelective(addClassForm);
    }

    public boolean hasClassByClassForm(Class addClassForm) {
        ClassExample classExample = new ClassExample();
        ClassExample.Criteria criteria= classExample.createCriteria();
        criteria.andClassDepartmentEqualTo(addClassForm.getClassDepartment())
                .andClassDomainEqualTo(addClassForm.getClassDomain())
                .andClassNameEqualTo(addClassForm.getClassName());
        long count = classMapper.countByExample((classExample));
        return 0==count;
    }

    public void deleteClassByClassId(int classId) {
        classMapper.deleteByPrimaryKey(classId);
    }
}
