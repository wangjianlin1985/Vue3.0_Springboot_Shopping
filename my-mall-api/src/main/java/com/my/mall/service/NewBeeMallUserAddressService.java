
package com.my.mall.service;

import com.my.mall.api.mall.vo.UserAddressVO;
import com.my.mall.entity.MallUserAddress;

import java.util.List;

public interface NewBeeMallUserAddressService {

    /**
     * 获取我的收货地址
     *
     * @param userId
     * @return
     */
    List<UserAddressVO> getMyAddresses(Long userId);

    /**
     * 保存收货地址
     *
     * @param mallUserAddress
     * @return
     */
    Boolean saveUserAddress(MallUserAddress mallUserAddress);

    /**
     * 修改收货地址
     *
     * @param mallUserAddress
     * @return
     */
    Boolean updateMallUserAddress(MallUserAddress mallUserAddress);

    /**
     * 获取收货地址详情
     *
     * @param addressId
     * @return
     */
    MallUserAddress getMallUserAddressById(Long addressId);

    /**
     * 获取我的默认收货地址
     *
     * @param userId
     * @return
     */
    MallUserAddress getMyDefaultAddressByUserId(Long userId);

    /**
     * 删除收货地址
     *
     * @param addressId
     * @return
     */
    Boolean deleteById(Long addressId);
}
