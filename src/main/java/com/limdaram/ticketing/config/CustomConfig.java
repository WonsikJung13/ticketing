package com.limdaram.ticketing.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan(value = "com.limdaram.ticketing.mapper")

public class CustomConfig {
}
