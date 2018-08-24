package com.wangzl.utils;

import java.util.HashMap;
import java.util.Map;

public class Msg {
    private int code;

    private String msg;

    private Map<String,Object> extend = new HashMap<String,Object>();



    public static Msg success(){
        Msg result = new Msg();
        result.setCode(666);
        result.setMsg("处理成功！");
        return result;
    }

    public static Msg fail(){
        Msg result = new Msg();
        result.setCode(555);
        result.setMsg("处理失败！");
        return result;
    }

    public static Msg warning(){
        Msg result = new Msg();
        result.setCode(909);
        result.setMsg("处理警告！");
        return result;
    }

    public Msg add(String key,Object value){
        this.getExtend().put(key,value);
        return this;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }
}
