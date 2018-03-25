package com.suniceman.po.result;

import com.suniceman.po.JsonResultType;

public class JsonResult {
    private int code;
    private String msg;
    private Object data;
    
    public int getCode() {
        return code;
    }
    
    public void setCode(JsonResultType code) {
        // ö��ת��Ϊint����
        this.code = code.ordinal();
    }
    
    public String getMsg() {
        return msg;
    }
    
    public void setMsg(String msg) {
        this.msg = msg;
    }
    
    public Object getData() {
        return data;
    }
    
    public void setData(Object data) {
        this.data = data;
    }
    
}
