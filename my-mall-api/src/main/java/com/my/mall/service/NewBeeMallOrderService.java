
package com.my.mall.service;

import com.my.mall.api.mall.vo.OrderDetailVO;
import com.my.mall.entity.MallUser;
import com.my.mall.entity.MallUserAddress;
import com.my.mall.entity.NewBeeMallOrder;
import com.my.mall.util.PageQueryUtil;
import com.my.mall.util.PageResult;
import com.my.mall.api.mall.vo.OrderItemVO;
import com.my.mall.api.mall.vo.ShoppingCartItemVO;

import java.util.List;

public interface NewBeeMallOrderService {
    /**
     * 获取订单详情
     *
     * @param orderId
     * @return
     */
    OrderDetailVO getOrderDetailByOrderId(Long orderId);

    /**
     * 获取订单详情
     *
     * @param orderNo
     * @param userId
     * @return
     */
    OrderDetailVO getOrderDetailByOrderNo(String orderNo, Long userId);

    /**
     * 我的订单列表
     *
     * @param pageUtil
     * @return
     */
    PageResult getMyOrders(PageQueryUtil pageUtil);

    /**
     * 手动取消订单
     *
     * @param orderNo
     * @param userId
     * @return
     */
    String cancelOrder(String orderNo, Long userId);

    /**
     * 确认收货
     *
     * @param orderNo
     * @param userId
     * @return
     */
    String finishOrder(String orderNo, Long userId);

    String paySuccess(String orderNo, int payType);

    String saveOrder(MallUser loginMallUser, MallUserAddress address, List<ShoppingCartItemVO> itemsForSave);

    /**
     * 后台分页
     *
     * @param pageUtil
     * @return
     */
    PageResult getNewBeeMallOrdersPage(PageQueryUtil pageUtil);

    /**
     * 订单信息修改
     *
     * @param newBeeMallOrder
     * @return
     */
    String updateOrderInfo(NewBeeMallOrder newBeeMallOrder);

    /**
     * 配货
     *
     * @param ids
     * @return
     */
    String checkDone(Long[] ids);

    /**
     * 出库
     *
     * @param ids
     * @return
     */
    String checkOut(Long[] ids);

    /**
     * 关闭订单
     *
     * @param ids
     * @return
     */
    String closeOrder(Long[] ids);

    List<OrderItemVO> getOrderItems(Long orderId);
}
