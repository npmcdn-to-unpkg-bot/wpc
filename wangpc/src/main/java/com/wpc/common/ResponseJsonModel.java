package com.wpc.common;

/**
 * 前台返回为Json时使用的模型类
 */
public class ResponseJsonModel {
    private String msg;//默认返回消息
    private String code = HttpConstant.SUCCESS_CODE;//默认返回消息码
    private Object result; //返回的集合数据

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Object getResult() {
        return result;
    }

    public void setResult(Object result) {
        this.result = result;
    }

    @Override
    public String toString() {
        return "ResponseJsonModel{" +
                "msg='" + msg + '\'' +
                ", code='" + code + '\'' +
                ", result=" + result +
                '}';
    }
}