package com.wangzl.bean;

import com.wangzl.utils.EncryptUtils;

import javax.validation.constraints.Email;
import javax.validation.constraints.Pattern;

public class Teacher {
    private Integer teacherId;

    @Pattern(regexp = "(^[\\u2E80-\\u9FFF]{2,6}$)|(^[a-zA-Z0-9_-]{6,16})",message = "教师名必须是2-6个汉字或是6-16位英文或数字的组合！")
    private String teacherName;

    private String teacherGender;

    //@Email
    @Pattern(regexp = "^[a-z\\d]+(\\.[a-z\\d]+)*@([\\da-z](-[\\da-z])?)+(\\.{1,2}[a-z]+)+$",message = "邮箱格式不正确")
    private String teacherEmail;

    //@Pattern(regexp = "^[a-zA-Z0-9_-]{6,18}$",message = "密码请在6-18位字母或数字的组合")
    private String teacherPassword;

    private String teacherPosition;

    private String teacherDepartment;

    private String teacherOther;

    public void aesDecryptAll(Teacher teacher) throws Exception {
        teacher.setTeacherName(EncryptUtils.aesDecrypt(teacher.getTeacherName(),EncryptUtils.KEY));
        teacher.setTeacherGender(EncryptUtils.aesDecrypt(teacher.getTeacherGender(),EncryptUtils.KEY));
        teacher.setTeacherEmail(EncryptUtils.aesDecrypt(teacher.getTeacherEmail(),EncryptUtils.KEY));
        teacher.setTeacherPosition(EncryptUtils.aesDecrypt(teacher.getTeacherPosition(),EncryptUtils.KEY));
        teacher.setTeacherDepartment(EncryptUtils.aesDecrypt(teacher.getTeacherDepartment(),EncryptUtils.KEY));
        teacher.setTeacherPassword(EncryptUtils.aesDecrypt(teacher.getTeacherPassword(),EncryptUtils.KEY));
    }

    public Integer getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(Integer teacherId) {
        this.teacherId = teacherId;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName == null ? null : teacherName.trim();
    }

    public String getTeacherGender() {
        return teacherGender;
    }

    public void setTeacherGender(String teacherGender) {
        this.teacherGender = teacherGender == null ? null : teacherGender.trim();
    }

    public String getTeacherEmail() {
        return teacherEmail;
    }

    public void setTeacherEmail(String teacherEmail) {
        this.teacherEmail = teacherEmail == null ? null : teacherEmail.trim();
    }

    public String getTeacherPassword() {
        return teacherPassword;
    }

    public void setTeacherPassword(String teacherPassword) {
        this.teacherPassword = teacherPassword == null ? null : teacherPassword.trim();
    }

    public String getTeacherPosition() {
        return teacherPosition;
    }

    public void setTeacherPosition(String teacherPosition) {
        this.teacherPosition = teacherPosition == null ? null : teacherPosition.trim();
    }

    public String getTeacherDepartment() {
        return teacherDepartment;
    }

    public void setTeacherDepartment(String teacherDepartment) {
        this.teacherDepartment = teacherDepartment == null ? null : teacherDepartment.trim();
    }

    public String getTeacherOther() {
        return teacherOther;
    }

    public void setTeacherOther(String teacherOther) {
        this.teacherOther = teacherOther == null ? null : teacherOther.trim();
    }
}