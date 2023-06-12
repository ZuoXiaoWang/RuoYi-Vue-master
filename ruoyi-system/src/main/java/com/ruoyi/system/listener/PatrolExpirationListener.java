package com.ruoyi.system.listener;

import com.ruoyi.system.domain.SysPatrol;
import com.ruoyi.system.mapper.SysPatrolMapper;
import com.ruoyi.system.service.ISysPatrolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.connection.Message;
import org.springframework.data.redis.listener.KeyExpirationEventMessageListener;
import org.springframework.data.redis.listener.RedisMessageListenerContainer;
import org.springframework.stereotype.Component;

import java.util.Arrays;

@Component
public class PatrolExpirationListener extends KeyExpirationEventMessageListener {
    @Autowired
    private ISysPatrolService sysPatrolService;

    public PatrolExpirationListener(RedisMessageListenerContainer listenerContainer) {
        super(listenerContainer);
    }

    @Override
    public void doHandleMessage(Message message){
        final String expiredKey = message.toString();
        String[] split = expiredKey.split("/");
        if (split[0].equals("patrolOverdueTime")){
            long patrolId = Long.parseLong(split[1]);
            SysPatrol sysPatrol = sysPatrolService.selectSysPatrolByPatrolId(patrolId);
            if (!sysPatrol.getPatrolStatus().equals("2")){
                sysPatrol.setPatrolStatus("3");
                sysPatrolService.updateSysPatrolWithStatus(sysPatrol);
            }
        }
    }
}
