
package com.my.mall.dao;

import com.my.mall.entity.AdminUser;
import org.apache.ibatis.annotations.Param;

public interface AdminUserMapper {
    int insert(AdminUser record);

    int insertSelective(AdminUser record);

    /**
     * 登陆方法
     *
     * @param userName
     * @param password
     * @return
     */
    AdminUser login(@Param("userName") String userName, @Param("password") String password);

    AdminUser selectByPrimaryKey(Long adminUserId);

    int updateByPrimaryKeySelective(AdminUser record);

    int updateByPrimaryKey(AdminUser record);
}
