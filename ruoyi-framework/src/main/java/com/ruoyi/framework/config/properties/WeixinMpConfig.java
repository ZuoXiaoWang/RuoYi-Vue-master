package com.ruoyi.framework.config.properties;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@Configuration(proxyBeanMethods = false)
@ConfigurationProperties(prefix = "weixin.mp")
@Data
@EqualsAndHashCode
public class WeixinMpConfig {

    private String appId;

    private String secret;


}

