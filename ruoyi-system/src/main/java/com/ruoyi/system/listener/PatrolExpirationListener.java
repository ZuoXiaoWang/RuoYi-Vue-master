package com.ruoyi.system.listener;

import org.springframework.data.redis.connection.Message;
import org.springframework.data.redis.listener.KeyExpirationEventMessageListener;
import org.springframework.data.redis.listener.RedisMessageListenerContainer;
import org.springframework.stereotype.Component;

import java.util.Arrays;

@Component
public class PatrolExpirationListener extends KeyExpirationEventMessageListener {

    public PatrolExpirationListener(RedisMessageListenerContainer listenerContainer) {
        super(listenerContainer);
    }

    @Override
    public void doHandleMessage(Message message){
        System.out.println(Arrays.toString(message.getBody()));
    }
}
