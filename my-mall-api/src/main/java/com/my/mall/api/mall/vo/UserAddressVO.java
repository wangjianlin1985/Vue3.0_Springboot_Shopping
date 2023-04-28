
package com.my.mall.api.mall.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 收货地址VO
 */
@Data
public class UserAddressVO {

    @ApiModelProperty("地址id")
    private Long addressId;

    @ApiModelProperty("用户id")
    private Long userId;

    @ApiModelProperty("收件人名称")
    private String userName;

    @ApiModelProperty("收件人联系方式")
    private String userPhone;

    @ApiModelProperty("是否默认地址 0-不是 1-是")
    private Byte defaultFlag;

    @ApiModelProperty("省")
    private String provinceName;

    @ApiModelProperty("市")
    private String cityName;

    @ApiModelProperty("区/县")
    private String regionName;

    @ApiModelProperty("详细地址")
    private String detailAddress;
}
