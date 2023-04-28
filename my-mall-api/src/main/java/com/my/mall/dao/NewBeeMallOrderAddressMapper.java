
package com.my.mall.dao;

import com.my.mall.entity.NewBeeMallOrderAddress;

public interface NewBeeMallOrderAddressMapper {
    int deleteByPrimaryKey(Long orderId);

    int insert(NewBeeMallOrderAddress record);

    int insertSelective(NewBeeMallOrderAddress record);

    NewBeeMallOrderAddress selectByPrimaryKey(Long orderId);

    int updateByPrimaryKeySelective(NewBeeMallOrderAddress record);

    int updateByPrimaryKey(NewBeeMallOrderAddress record);
}
