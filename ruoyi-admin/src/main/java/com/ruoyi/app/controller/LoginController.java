package com.ruoyi.app.controller;

import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.core.controller.AppBaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysPersonnel;
import com.ruoyi.common.core.domain.model.AppLoginBody;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.framework.app.service.AppLoginService;
import com.ruoyi.system.service.ISysPersonnelService;
import com.ruoyi.system.service.ISysPostService;
import com.ruoyi.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/app")
public class LoginController extends AppBaseController {

    @Autowired
    private AppLoginService appLoginService;

    @Autowired
    private ISysPersonnelService sysPersonnelService;

    @Autowired
    private ISysPostService postService;



    @PostMapping("/login")
    public AjaxResult login(@RequestBody AppLoginBody apploginBody) {

        AjaxResult ajax = AjaxResult.success();
        // 生成令牌
        String token = appLoginService.appLogin(apploginBody.getPersonnelLoginName(), apploginBody.getPersonnelPassword());
        ajax.put(Constants.TOKEN, token);
        return ajax;
    }

    /**
     * 获取员工管理详细信息
     */
    @GetMapping("/info")
    public AjaxResult getInfo() {
        Long appUserId = getAppUserId();
        AjaxResult ajax = AjaxResult.success();
        ajax.put("posts", postService.selectPostAll());
        if (StringUtils.isNotNull(appUserId)) {
            SysPersonnel sysPersonnel = sysPersonnelService.selectSysPersonnelByPersonnelId(appUserId);
            ajax.put(AjaxResult.DATA_TAG, sysPersonnel);
            ajax.put("postIds", postService.selectPostListByPersonnelId(appUserId));
        }
        return ajax;
    }


}
