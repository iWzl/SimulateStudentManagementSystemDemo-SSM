package com.wangzl.test;

import com.wangzl.dao.*;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import java.util.UUID;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {

    /*
     * 测试dao层的工作
     * */

    @Autowired
    TeacherMapper teacherMapper;
    @Autowired
    ClassMapper classMapper;
    @Autowired
    StudentMapper studentMapper;
    @Autowired
    TeachMapper teachMapper;
    @Autowired
    SqlSession sqlSession ;
    @Test
    public void testCRUD() {
        System.out.println(teacherMapper+"  "+teachMapper+" "+classMapper+" "+studentMapper);
        StudentMapper mapperS=sqlSession.getMapper(StudentMapper.class);
        for (int i = 0; i <240 ; i++) {
            String uid=UUID.randomUUID().toString().substring(0,5)+i;
        }
    }

}
