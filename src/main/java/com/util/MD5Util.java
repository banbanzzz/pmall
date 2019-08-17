package com.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Util {
    public static String passToMD5(String passWord){
        StringBuilder sb = new StringBuilder();
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("MD5");
            byte[] digest = messageDigest.digest(passWord.getBytes());
            for(int  i = 0; i < digest.length; i++){
                int result = digest[i] & 0xff;
                String hexString = Integer.toHexString(result);
                if(hexString.length() < 2){
                    sb.append("0");
                }
                sb.append(hexString);
            }
        }catch (NoSuchAlgorithmException e){
            e.printStackTrace();
        }
        return sb.toString();
    }
}
