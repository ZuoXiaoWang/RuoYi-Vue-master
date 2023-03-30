package com.ruoyi.common.core.domain.model;

import com.alibaba.fastjson2.annotation.JSONField;
import com.ruoyi.common.core.domain.entity.SysUser;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import com.ruoyi.common.core.domain.entity.SysPersonnel;

import java.util.Collection;
import java.util.Set;

public class AppLoginUser implements UserDetails {
    /**
     * 用户ID
     */
    private Long userId;

    /**
     * 部门ID
     */
    private Long deptId;

    /**
     * 用户唯一标识
     */
    private String token;

    /**
     * 登录时间
     */
    private Long loginTime;

    /**
     * 过期时间
     */
    private Long expireTime;

    /**
     * 登录IP地址
     */
    private String ipaddr;

    /**
     * 登录地点
     */
    private String loginLocation;

    /**
     * 浏览器类型
     */
    private String browser;

    /**
     * 操作系统
     */
    private String os;


    /**
     * 用户信息
     */
    private SysPersonnel sysPersonnel;

    public Long getUserId()
    {
        return userId;
    }

    public void setUserId(Long userId)
    {
        this.userId = userId;
    }

    public Long getDeptId()
    {
        return deptId;
    }

    public void setDeptId(Long deptId)
    {
        this.deptId = deptId;
    }

    public String getToken()
    {
        return token;
    }

    public void setToken(String token)
    {
        this.token = token;
    }

    public AppLoginUser()
    {
    }

    public AppLoginUser(SysPersonnel user, Set<String> permissions)
    {
        this.sysPersonnel = user;
    }

    public AppLoginUser(Long userId, Long deptId, SysPersonnel user)
    {
        this.userId = userId;
        this.deptId = deptId;
        this.sysPersonnel = user;
    }

    @JSONField(serialize = false)
    @Override
    public String getPassword()
    {
        return sysPersonnel.getPersonnelPassword();
    }

    @Override
    public String getUsername()
    {
        return sysPersonnel.getPersonnelLoginName();
    }

    /**
     * 账户是否未过期,过期无法验证
     */
    @JSONField(serialize = false)
    @Override
    public boolean isAccountNonExpired()
    {
        return true;
    }

    /**
     * 指定用户是否解锁,锁定的用户无法进行身份验证
     *
     * @return
     */
    @JSONField(serialize = false)
    @Override
    public boolean isAccountNonLocked()
    {
        return true;
    }

    /**
     * 指示是否已过期的用户的凭据(密码),过期的凭据防止认证
     *
     * @return
     */
    @JSONField(serialize = false)
    @Override
    public boolean isCredentialsNonExpired()
    {
        return true;
    }

    /**
     * 是否可用 ,禁用的用户不能身份验证
     *
     * @return
     */
    @JSONField(serialize = false)
    @Override
    public boolean isEnabled()
    {
        return true;
    }

    public Long getLoginTime()
    {
        return loginTime;
    }

    public void setLoginTime(Long loginTime)
    {
        this.loginTime = loginTime;
    }

    public String getIpaddr()
    {
        return ipaddr;
    }

    public void setIpaddr(String ipaddr)
    {
        this.ipaddr = ipaddr;
    }

    public String getLoginLocation()
    {
        return loginLocation;
    }

    public void setLoginLocation(String loginLocation)
    {
        this.loginLocation = loginLocation;
    }

    public String getBrowser()
    {
        return browser;
    }

    public void setBrowser(String browser)
    {
        this.browser = browser;
    }

    public String getOs()
    {
        return os;
    }

    public void setOs(String os)
    {
        this.os = os;
    }

    public Long getExpireTime()
    {
        return expireTime;
    }

    public void setExpireTime(Long expireTime)
    {
        this.expireTime = expireTime;
    }


    public SysPersonnel getUser()
    {
        return sysPersonnel;
    }

    public void setUser(SysPersonnel user)
    {
        this.sysPersonnel = user;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities()
    {
        return null;
    }
}
