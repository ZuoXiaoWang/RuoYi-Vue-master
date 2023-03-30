package com.ruoyi.app.controller;

import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.model.AppLoginBody;
import com.ruoyi.framework.app.service.AppLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/app")
public class LoginController {

    @Autowired
    private AppLoginService appLoginService;

    @PostMapping("/login")
    public AjaxResult login(@RequestBody AppLoginBody apploginBody) {

        AjaxResult ajax = AjaxResult.success();
        // 生成令牌
        String token = appLoginService.appLogin(apploginBody.getPersonnelLoginName(), apploginBody.getPersonnelPassword());
        ajax.put(Constants.TOKEN, token);
        return ajax;
    }
}
