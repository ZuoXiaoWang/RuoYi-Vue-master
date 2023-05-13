package com.ruoyi.common.core.domain.model;

import lombok.Data;

@Data
public class AppRegisterBody {
    /**
     * 用户名
     */
    private String username;

    /**
     * 用户密码
     */
    private String password;

    /**
     * 手机号码
     */
    private String phoneNumber;
}
