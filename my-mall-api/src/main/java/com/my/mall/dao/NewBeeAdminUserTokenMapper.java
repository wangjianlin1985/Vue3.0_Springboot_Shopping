
package com.my.mall.dao;

import com.my.mall.entity.AdminUserToken;

public interface NewBeeAdminUserTokenMapper {
    int deleteByPrimaryKey(Long userId);

    int insert(AdminUserToken record);

    int insertSelective(AdminUserToken record);

    AdminUserToken selectByPrimaryKey(Long userId);

    AdminUserToken selectByToken(String token);

    int updateByPrimaryKeySelective(AdminUserToken record);

    int updateByPrimaryKey(AdminUserToken record);
}
