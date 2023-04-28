
package com.my.mall.common;


public enum NewBeeMallOrderStatusEnum {

    DEFAULT(-9, "ERROR"),
    ORDER_PRE_PAY(0, "待支付"),
    ORDER_PAID(1, "已支付"),
    ORDER_PACKAGED(2, "配货完成"),
    ORDER_EXPRESS(3, "出库成功"),
    ORDER_SUCCESS(4, "交易成功"),
    ORDER_CLOSED_BY_MALLUSER(-1, "手动关闭"),
    ORDER_CLOSED_BY_EXPIRED(-2, "超时关闭"),
    ORDER_CLOSED_BY_JUDGE(-3, "商家关闭");

    private int orderStatus;

    private String name;

    NewBeeMallOrderStatusEnum(int orderStatus, String name) {
        this.orderStatus = orderStatus;
        this.name = name;
    }

    public static NewBeeMallOrderStatusEnum getNewBeeMallOrderStatusEnumByStatus(int orderStatus) {
        for (NewBeeMallOrderStatusEnum newBeeMallOrderStatusEnum : NewBeeMallOrderStatusEnum.values()) {
            if (newBeeMallOrderStatusEnum.getOrderStatus() == orderStatus) {
                return newBeeMallOrderStatusEnum;
            }
        }
        return DEFAULT;
    }

    public int getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(int orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
