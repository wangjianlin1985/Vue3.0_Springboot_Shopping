
package com.my.mall.api.mall.param;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

/**
 * 添加购物项param
 */
@Data
public class SaveCartItemParam implements Serializable {

    @ApiModelProperty("商品数量")
    private Integer goodsCount;

    @ApiModelProperty("商品id")
    private Long goodsId;
}
