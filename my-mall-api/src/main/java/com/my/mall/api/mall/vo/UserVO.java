
package com.my.mall.api.mall.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

@Data
public class UserVO implements Serializable {

    @ApiModelProperty("用户昵称")
    private String nickName;

    @ApiModelProperty("用户登录名")
    private String loginName;

    @ApiModelProperty("个性签名")
    private String introduceSign;
}
