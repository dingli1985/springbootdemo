package org.lykj.tomcat.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class CtxUtil implements ApplicationContextAware {

    private ApplicationContext applicationContext;

    public void show (){
        log.info("ctx ["+applicationContext.getClass().toString()+"]");
    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        this.applicationContext = applicationContext;
    }
}