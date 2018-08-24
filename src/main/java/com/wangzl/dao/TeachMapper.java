package com.wangzl.dao;

import com.wangzl.bean.Teach;
import com.wangzl.bean.TeachExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TeachMapper {
    long countByExample(TeachExample example);

    int deleteByExample(TeachExample example);

    int deleteByPrimaryKey(Integer teachId);

    int insert(Teach record);

    int insertSelective(Teach record);

    List<Teach> selectByExample(TeachExample example);

    Teach selectByPrimaryKey(Integer teachId);

    int updateByExampleSelective(@Param("record") Teach record, @Param("example") TeachExample example);

    int updateByExample(@Param("record") Teach record, @Param("example") TeachExample example);

    int updateByPrimaryKeySelective(Teach record);

    int updateByPrimaryKey(Teach record);
}