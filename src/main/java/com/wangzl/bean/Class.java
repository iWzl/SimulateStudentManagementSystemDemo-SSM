package com.wangzl.bean;

public class Class {
    private Integer classId;

    private String classDepartment;

    private String classDomain;

    private String className;

    private String classOther;

    @Override
    public String toString() {
        return "Class{" +
                "classId=" + classId +
                ", classDepartment='" + classDepartment + '\'' +
                ", classDomain='" + classDomain + '\'' +
                ", className='" + className + '\'' +
                ", classOther='" + classOther + '\'' +
                '}';
    }

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    public String getClassDepartment() {
        return classDepartment;
    }

    public void setClassDepartment(String classDepartment) {
        this.classDepartment = classDepartment == null ? null : classDepartment.trim();
    }

    public String getClassDomain() {
        return classDomain;
    }

    public void setClassDomain(String classDomain) {
        this.classDomain = classDomain == null ? null : classDomain.trim();
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className == null ? null : className.trim();
    }

    public String getClassOther() {
        return classOther;
    }

    public void setClassOther(String classOther) {
        this.classOther = classOther == null ? null : classOther.trim();
    }
}