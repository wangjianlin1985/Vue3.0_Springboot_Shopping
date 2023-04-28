
package com.my.mall.api.mall.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * 订单列表页面VO
 */
@Data
public class OrderListVO implements Serializable {

    private Long orderId;

    @ApiModelProperty("订单号")
    private String orderNo;

    @ApiModelProperty("订单价格")
    private Integer totalPrice;

    @ApiModelProperty("订单支付方式")
    private Byte payType;

    @ApiModelProperty("订单状态码")
    private Byte orderStatus;

    @ApiModelProperty("订单状态")
    private String orderStatusString;

    @ApiModelProperty("创建时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;

    @ApiModelProperty("订单项列表")
    private List<OrderItemVO> newBeeMallOrderItemVOS;
}
