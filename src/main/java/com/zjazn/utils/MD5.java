package com.zjazn.utils;

import java.security.MessageDigest;  
import java.security.NoSuchAlgorithmException;  
  

public class MD5 {  
      
    /* 
     * 1.һ�����û������ʵ�� 
     * MessageDigest ����ʼ����ʼ�����ö���ͨ��ʹ�� update �����������ݡ� 
     * �κ�ʱ�򶼿��Ե��� reset ��������ժҪ�� 
     * һ��������Ҫ���µ����ݶ��Ѿ��������ˣ�Ӧ�õ��� digest ����֮һ��ɹ�ϣ���㡣 
     * ���ڸ��������ĸ������ݣ�digest ����ֻ�ܱ�����һ�Ρ� 
     * �ڵ��� digest ֮��MessageDigest �����������ó����ʼ״̬��  
     */  
    public static String encrypByMd5(String context) {  
        try {  
            MessageDigest md = MessageDigest.getInstance("MD5");  
            md.update(context.getBytes());//update����  
            byte [] encryContext = md.digest();//���ø÷�����ɼ���  
  
            int i;  
            StringBuffer buf = new StringBuffer("");  
            for (int offset = 0; offset < encryContext.length; offset++) {//����Ӧ��ת����ʮ�����ƣ�  
                i = encryContext[offset];  
                if (i < 0) i += 256;  
                if (i < 16) buf.append("0");  
                buf.append(Integer.toHexString(i));  
           }  
           String code32=buf.toString();// 32λ�ļ���  
           return code32;
        } catch (NoSuchAlgorithmException e) {  
            // TODO Auto-generated catch block  
            e.printStackTrace();  
        }
        return null;
    }  
      
    /* 
     * ��������ʹ�ã�ֻ��MD5.getDepthCode(String),���ɷ���һ��32λ˫�����+substring(2,12)��ȡ��ֵ
     *  
     */   
    public static String getDepthCode(String code) {
    	String eet=encrypByMd5(encrypByMd5(code)).substring(2,12);
    	return  eet;
    
    }
    /*����ʹ��*/
    public static void main(String[] args) {  
        MD5 md5 = new MD5();
        String jcode="zjazn";
        String tt=MD5.encrypByMd5(jcode);


    }  
}  