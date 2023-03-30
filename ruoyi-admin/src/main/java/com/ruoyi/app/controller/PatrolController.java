package com.ruoyi.app.controller;

import com.ruoyi.common.core.controller.AppBaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Objects;

@RestController
@RequestMapping("/patrol")
public class PatrolController extends AppBaseController {
    @GetMapping("/pointList")
    public AjaxResult getPatrolList(){
        return Objects.requireNonNull(AjaxResult.success().put(AjaxResult.MSG_TAG, "yes")).put(AjaxResult.DATA_TAG,getAppUserId());
    }
}
