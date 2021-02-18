package com.zjazn.utils;

public class ShowChineseUtil {
    public static String getShowCharacter(String oriText, Integer length, String afterStr) {
        String afterContent = oriText.replaceAll("[^\u4E00-\u9FA5|，|。|？|！|、]", "");
        if (afterContent.length()>length){
            afterContent=afterContent.substring(0,length)+afterStr;
        }
        return afterContent;
    }

    public static void main(String[] args) {
        System.out.println(getShowCharacter("11212你好jifsdf",20,""));
    }
}
