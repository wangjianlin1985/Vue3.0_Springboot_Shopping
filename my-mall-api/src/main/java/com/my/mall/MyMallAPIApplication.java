package com.my.mall;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan("com.my.mall.dao")
@SpringBootApplication
public class MyMallAPIApplication {

    public static void main(String[] args) {
        SpringApplication.run(MyMallAPIApplication.class, args);
    }

}
