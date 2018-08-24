package com.wangzl.bean;

import com.wangzl.utils.EncryptUtils;

public class Student {
    private Integer studentId;

    private String studentName;

    private String studentGender;

    private String studentPassword;

    private String studentNational;

    private String studentAddress;

    private String studentEnrollmentTime;

    private String studentOther;

    private Integer studentClassId;

    @Override
    public String toString() {
        return "Student{" +
                "studentId=" + studentId +
                ", studentName='" + studentName + '\'' +
                ", studentGender='" + studentGender + '\'' +
                ", studentPassword='" + studentPassword + '\'' +
                ", studentNational='" + studentNational + '\'' +
                ", studentAddress='" + studentAddress + '\'' +
                ", studentEnrollmentTime='" + studentEnrollmentTime + '\'' +
                ", studentOther='" + studentOther + '\'' +
                ", studentClassId=" + studentClassId +
                '}';
    }

    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName == null ? null : studentName.trim();
    }

    public String getStudentGender() {
        return studentGender;
    }

    public void setStudentGender(String studentGender) {
        this.studentGender = studentGender == null ? null : studentGender.trim();
    }

    public String getStudentPassword() {
        return studentPassword;
    }

    public void setStudentPassword(String studentPassword) {
        this.studentPassword = studentPassword == null ? null : studentPassword.trim();
    }

    public String getStudentNational() {
        return studentNational;
    }

    public void setStudentNational(String studentNational) {
        this.studentNational = studentNational == null ? null : studentNational.trim();
    }

    public String getStudentAddress() {
        return studentAddress;
    }

    public void setStudentAddress(String studentAddress) {
        this.studentAddress = studentAddress == null ? null : studentAddress.trim();
    }

    public String getStudentEnrollmentTime() {
        return studentEnrollmentTime;
    }

    public void setStudentEnrollmentTime(String studentEnrollmentTime) {
        this.studentEnrollmentTime = studentEnrollmentTime == null ? null : studentEnrollmentTime.trim();
    }

    public String getStudentOther() {
        return studentOther;
    }

    public void setStudentOther(String studentOther) {
        this.studentOther = studentOther == null ? null : studentOther.trim();
    }

    public Integer getStudentClassId() {
        return studentClassId;
    }

    public void setStudentClassId(Integer studentClassId) {
        this.studentClassId = studentClassId;
    }
}