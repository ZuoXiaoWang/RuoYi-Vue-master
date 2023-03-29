package com.ruoyi.app.controller;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.model.AppLoginBody;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/app")
public class LoginController {

    @PostMapping("/login")
    public AjaxResult login(@RequestBody AppLoginBody apploginBody) {
        AjaxResult ajax = AjaxResult.success();

        //生成令牌

        return null;
    }
}
