package com.ruoyi.common.core.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ruoyi.common.constant.HttpStatus;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysPersonnel;
import com.ruoyi.common.core.domain.model.AppLoginUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.core.page.PageDomain;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.page.TableSupport;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.PageUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.sql.SqlUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import java.beans.PropertyEditorSupport;
import java.util.Date;
import java.util.List;

public class AppBaseController extends BaseController {
    public AppLoginUser getAppLoginUser() {
        return SecurityUtils.getAppLoginUser();
    }


    public Long getAppUserId() {
        return getAppLoginUser().getUserId();
    }

    public SysPersonnel getUser() {
        return getAppLoginUser().getUser();
    }


    public Long getAppDeptId() {
        return getAppLoginUser().getDeptId();
    }


    public String getAppUsername() {
        return getAppLoginUser().getUsername();
    }
}
