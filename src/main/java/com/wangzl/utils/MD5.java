package com.wangzl.utils;


import org.springframework.util.DigestUtils;

public class MD5 {

    public static  String keyMd5(){
        final String key = "Wangzhili";
        return DigestUtils.md5DigestAsHex(key.getBytes());
    }

    public static  String keyMd5(String key){
        return DigestUtils.md5DigestAsHex(key.getBytes());
    }

    public static String md5(String text){
        final String key = "Wangzhili";
        String md5Str = text+key;
        String encodeStr=DigestUtils.md5DigestAsHex(md5Str.getBytes());
        return encodeStr;
    }

    public  static boolean verify(String text,String md5){
        final String key = keyMd5();
        String md5Str = text+key;
        String md5Text =md5(text,key);
        if(md5Text.equalsIgnoreCase(md5)){
            return true;
        }
        else
            return false;
    }



    public static String md5(String text,String key){
        String md5Str = text+key;
        String encodeStr=DigestUtils.md5DigestAsHex(md5Str.getBytes());
        return encodeStr;
    }
    public  static boolean verify(String text,String key,String md5){
        String md5Str = text+key;
        String md5Text =md5(text,key);
        if(md5Text.equalsIgnoreCase(md5)){
            return true;
        }
        else
            return false;
    }

}
