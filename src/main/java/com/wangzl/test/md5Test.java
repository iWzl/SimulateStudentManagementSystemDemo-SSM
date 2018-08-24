package com.wangzl.test;

import com.wangzl.utils.MD5;
import org.junit.Test;

public class md5Test {

    @Test
    public void md5encrypt(){
        String text="Master";
        String key = "Wangzhili";
        String key1 = "3f75e309a1c4eafe6e237ab8316c14f5";
        System.out.println(MD5.keyMd5(key));
        System.out.println(MD5.md5(text,key));
        System.out.println(MD5.verify(text,key,MD5.md5(text,key)));
    }
}
