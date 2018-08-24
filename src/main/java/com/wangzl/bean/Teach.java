package com.wangzl.bean;

public class Teach {
    private Integer teachId;

    private Integer teachTeacherId;

    private Integer teachClassId;

    public Teach(Integer teachTeacherId, Integer teachClassId) {
        this.teachTeacherId = teachTeacherId;
        this.teachClassId = teachClassId;
    }

    public Teach() {
    }

    public Integer getTeachId() {
        return teachId;
    }

    public void setTeachId(Integer teachId) {
        this.teachId = teachId;
    }

    public Integer getTeachTeacherId() {
        return teachTeacherId;
    }

    public void setTeachTeacherId(Integer teachTeacherId) {
        this.teachTeacherId = teachTeacherId;
    }

    public Integer getTeachClassId() {
        return teachClassId;
    }

    public void setTeachClassId(Integer teachClassId) {
        this.teachClassId = teachClassId;
    }
}