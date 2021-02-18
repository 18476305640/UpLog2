package com.zjazn.utils;

import com.mchange.v2.lang.StringUtils;

import java.util.*;

public class PFT {
//    public static String[]Generate(String user,String password){
//        int userLength = user.length();
//        int passwordLength = password.length();
//
//
//
//    }
    private static String Mysplit(String target){
        int length = target.length();
        String block1 ="";
        String centerblock ="";
        String block2 ="";
        if(length%2==0){
            int splitPoint=length/2;
            block1 = target.substring(0, splitPoint);
            block2 = target.substring(splitPoint,length);
        }else{
            int splitPoint=(length-1)/2;
            block1 = target.substring(0, splitPoint);
            centerblock=target.charAt(splitPoint)+"";
            block2 = target.substring(splitPoint+1,length);
        }

        return myRever(block1)+centerblock+myRever(block2);
    }
    public static String listToString(List<String> list){
        String newStr="";
        for (String str:list){
            newStr+=str;
        }
        return newStr;
    }
    public static String myRever(String str){
        String[] split = str.split("");
        List<String> strings = Arrays.asList(split);
        Collections.reverse(strings);
        return listToString(strings);

    }
    public static void main(String[] args) {
        String mysplit = Mysplit("321654");


        System.out.println(mysplit);
    }
}
