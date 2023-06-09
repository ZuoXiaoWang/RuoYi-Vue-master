package com.ruoyi.framework.app.service;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.ruoyi.framework.app.domain.TemplateData;
import com.ruoyi.framework.app.domain.WxMssVo;
import com.ruoyi.framework.config.properties.WeixinMpConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;

@Service
public class AsyncService{


    @Autowired
    private WeixinMpConfig weixinMpConfig;
    @Async
    public void sendSubscribeMsg(String openId,String thing1,String thing2) {
        RestTemplate restTemplate = new RestTemplate();
        //这里简单起见我们每次都获取最新的access_token（时间开发中，应该在access_token快过期时再重新获取）
        String url = "https://api.weixin.qq.com/cgi-bin/message/subscribe/send?access_token=" + getAccessToken();
        //拼接推送的模版
        WxMssVo wxMssVo = new WxMssVo();
        wxMssVo.setTouser(openId);//用户的openid（要发送给那个用户，通常这里应该动态传进来的）
        wxMssVo.setTemplate_id("x8Cy-QOnkmomH4kSYElBcetSxkDFo4eX6hrKFhU2C58");//订阅消息模板id
        wxMssVo.setPage("pages/repair/repair");
        Map<String, TemplateData> m = new HashMap<>(3);
        m.put("thing1", new TemplateData(thing1));
        m.put("thing4", new TemplateData(thing2));
        wxMssVo.setData(m);
        ResponseEntity<String> responseEntity =
                restTemplate.postForEntity(url, wxMssVo, String.class);
    }

    public String getAccessToken() {
        RestTemplate restTemplate = new RestTemplate();
        Map<String, String> params = new HashMap<>();
        params.put("APPID", weixinMpConfig.getAppId());  //
        params.put("APPSECRET", weixinMpConfig.getSecret());  //
        ResponseEntity<String> responseEntity = restTemplate.getForEntity(
                "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid={APPID}&secret={APPSECRET}", String.class, params);
        String body = responseEntity.getBody();
        JSONObject object = JSON.parseObject(body);
        String Access_Token = object.getString("access_token");
        String expires_in = object.getString("expires_in");
        System.out.println("有效时长expires_in：" + expires_in);
        return Access_Token;
    }
}
