package com.my.mall.entity;

import lombok.Data;

import java.util.Date;

@Data
public class AdminUserToken {
    private Long adminUserId;

    private String token;

    private Date updateTime;

    private Date expireTime;
}
