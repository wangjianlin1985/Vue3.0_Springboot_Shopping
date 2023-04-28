
package com.my.mall.api.mall.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

/**
 * 订单详情页页面订单项VO
 */
@Data
public class OrderItemVO implements Serializable {

    @ApiModelProperty("商品id")
    private Long goodsId;

    @ApiModelProperty("商品数量")
    private Integer goodsCount;

    @ApiModelProperty("商品名称")
    private String goodsName;

    @ApiModelProperty("商品图片")
    private String goodsCoverImg;

    @ApiModelProperty("商品价格")
    private Integer sellingPrice;
}
