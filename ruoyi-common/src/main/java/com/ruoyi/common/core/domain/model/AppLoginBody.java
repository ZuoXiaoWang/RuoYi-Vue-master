package com.ruoyi.common.core.domain.model;

import lombok.Data;

@Data
public class AppLoginBody {
    private String personnelLoginName;
    private String personnelPassword;

    private String code;


}
