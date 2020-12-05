package org.lykj.tomcat.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan("org.lykj.tomcat.mapper")
public class MybatisPlusConfig {

}
