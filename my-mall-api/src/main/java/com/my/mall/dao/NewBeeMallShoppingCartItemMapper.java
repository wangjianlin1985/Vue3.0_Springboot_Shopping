
package com.my.mall.dao;

import com.my.mall.entity.NewBeeMallShoppingCartItem;
import com.my.mall.util.PageQueryUtil;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface NewBeeMallShoppingCartItemMapper {
    int deleteByPrimaryKey(Long cartItemId);

    int insert(NewBeeMallShoppingCartItem record);

    int insertSelective(NewBeeMallShoppingCartItem record);

    NewBeeMallShoppingCartItem selectByPrimaryKey(Long cartItemId);

    NewBeeMallShoppingCartItem selectByUserIdAndGoodsId(@Param("newBeeMallUserId") Long newBeeMallUserId, @Param("goodsId") Long goodsId);

    List<NewBeeMallShoppingCartItem> selectByUserId(@Param("newBeeMallUserId") Long newBeeMallUserId, @Param("number") int number);

    List<NewBeeMallShoppingCartItem> selectByUserIdAndCartItemIds(@Param("newBeeMallUserId") Long newBeeMallUserId, @Param("cartItemIds") List<Long> cartItemIds);

    int selectCountByUserId(Long newBeeMallUserId);

    int updateByPrimaryKeySelective(NewBeeMallShoppingCartItem record);

    int updateByPrimaryKey(NewBeeMallShoppingCartItem record);

    int deleteBatch(List<Long> ids);

    List<NewBeeMallShoppingCartItem> findMyNewBeeMallCartItems(PageQueryUtil pageUtil);

    int getTotalMyNewBeeMallCartItems(PageQueryUtil pageUtil);
}
