package com.ruoyi.app.controller;

import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.core.controller.AppBaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysPersonnel;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.AppLoginBody;
import com.ruoyi.common.core.domain.model.AppRegisterBody;
import com.ruoyi.common.core.domain.model.RegisterBody;
import com.ruoyi.common.utils.MessageUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.framework.app.service.AppLoginService;
import com.ruoyi.framework.manager.AsyncManager;
import com.ruoyi.framework.manager.factory.AsyncFactory;
import com.ruoyi.framework.web.service.SysRegisterService;
import com.ruoyi.system.service.ISysConfigService;
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


    @Autowired
    private SysRegisterService registerService;

    @Autowired
    private ISysConfigService configService;

    @Autowired
    private ISysUserService userService;

    @PostMapping("/register")
    public AjaxResult register(@RequestBody AppRegisterBody user) {
        String msg = appRegister(user);
        return StringUtils.isEmpty(msg) ? success() : error(msg);
    }

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


    //是否维修人员
    @GetMapping("/isRepair")
    public AjaxResult isRepair(){
        Long appUserId = getAppUserId();
        AjaxResult ajax = AjaxResult.success();
        if (StringUtils.isNotNull(appUserId)) {
            ajax.put("isRepair", false);
            SysPersonnel sysPersonnel = sysPersonnelService.selectSysRepairPersonnelByPersonnelId(appUserId);
            if (sysPersonnel != null){
                ajax.put("isRepair", true);
            }
        }
        return ajax;
    }

    public String appRegister(AppRegisterBody registerBody){
        String msg = "", username = registerBody.getUsername(), phoneNumber = registerBody.getPhoneNumber(), password = registerBody.getPassword();
        SysPersonnel sysPersonnel = new SysPersonnel();
        sysPersonnel.setPersonnelLoginName(username);
        if (StringUtils.isEmpty(username)) {
            msg = "用户名不能为空";
        }
        //添加手机号校验
        if (StringUtils.isEmpty(phoneNumber)) {
            msg = "手机号码不能为空";
        } else if (StringUtils.isEmpty(password)) {
            msg = "用户密码不能为空";
        } else if (username.length() < UserConstants.USERNAME_MIN_LENGTH
                || username.length() > UserConstants.USERNAME_MAX_LENGTH) {
            msg = "账户长度必须在2到20个字符之间";
        } else if (password.length() < UserConstants.PASSWORD_MIN_LENGTH
                || password.length() > UserConstants.PASSWORD_MAX_LENGTH) {
            msg = "密码长度必须在5到20个字符之间";
        }  else if (!userService.checkUserNameUniqueByPersonnelLoginName(sysPersonnel)) {
            msg = "注册'" + sysPersonnel.getPersonnelLoginName() + "'失败，登录账号已存在";
        } else if (!sysPersonnelService.checkPersonnelLoginNameUnique(sysPersonnel)) {
            msg = "注册'" + sysPersonnel.getPersonnelLoginName() + "'失败,登录账号已存在";
        } else {
            sysPersonnel.setPersonnelName(username);
            //添加手机号
            sysPersonnel.setPersonnelPhone(phoneNumber);
            sysPersonnel.setPersonnelPassword(SecurityUtils.encryptPassword(password));
            sysPersonnel.setPostId(1L);
            int row = sysPersonnelService.insertSysPersonnel(sysPersonnel);
            boolean regFlag = row > 0;
            if (!regFlag) {
                msg = "注册失败,请联系系统管理人员";
            } else {
                AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.REGISTER, MessageUtils.message("user.register.success")));
            }
        }
        return msg;
    }


}
