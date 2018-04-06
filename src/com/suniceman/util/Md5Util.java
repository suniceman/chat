package com.suniceman.util;

import java.math.BigInteger;
import java.security.MessageDigest;

public class Md5Util {
    public static final String KEY_MD5 = "MD5";

    // public static final String KEY_SHA1 = "SHA-1";

    public static String getMd5(String inputStr) {
        BigInteger bigInteger = null;

        try {
            MessageDigest md = MessageDigest.getInstance(KEY_MD5);
            byte[] inputData = inputStr.getBytes();
            md.update(inputData);
            bigInteger = new BigInteger(md.digest());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bigInteger.toString(16);
    }

}
