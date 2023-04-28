
package com.my.mall.service.impl;

import com.my.mall.common.NewBeeMallException;
import com.my.mall.common.ServiceResultEnum;
import com.my.mall.dao.MallUserAddressMapper;
import com.my.mall.entity.MallUserAddress;
import com.my.mall.util.BeanUtil;
import com.my.mall.api.mall.vo.UserAddressVO;
import com.my.mall.service.NewBeeMallUserAddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class NewBeeMallUserAddressServiceImpl implements NewBeeMallUserAddressService {

    @Autowired
    private MallUserAddressMapper userAddressMapper;

    @Override
    public List<UserAddressVO> getMyAddresses(Long userId) {
        List<MallUserAddress> myAddressList = userAddressMapper.findMyAddressList(userId);
        List<UserAddressVO> newBeeMallUserAddressVOS = BeanUtil.copyList(myAddressList, UserAddressVO.class);
        return newBeeMallUserAddressVOS;
    }

    @Override
    @Transactional
    public Boolean saveUserAddress(MallUserAddress mallUserAddress) {
        Date now = new Date();
        if (mallUserAddress.getDefaultFlag().intValue() == 1) {
            //添加默认地址，需要将原有的默认地址修改掉
            MallUserAddress defaultAddress = userAddressMapper.getMyDefaultAddress(mallUserAddress.getUserId());
            if (defaultAddress != null) {
                defaultAddress.setDefaultFlag((byte) 0);
                defaultAddress.setUpdateTime(now);
                int updateResult = userAddressMapper.updateByPrimaryKeySelective(defaultAddress);
                if (updateResult < 1) {
                    //未更新成功
                    NewBeeMallException.fail(ServiceResultEnum.DB_ERROR.getResult());
                }
            }
        }
        return userAddressMapper.insertSelective(mallUserAddress) > 0;
    }

    @Override
    public Boolean updateMallUserAddress(MallUserAddress mallUserAddress) {
        MallUserAddress tempAddress = getMallUserAddressById(mallUserAddress.getAddressId());
        Date now = new Date();
        if (mallUserAddress.getDefaultFlag().intValue() == 1) {
            //修改为默认地址，需要将原有的默认地址修改掉
            MallUserAddress defaultAddress = userAddressMapper.getMyDefaultAddress(mallUserAddress.getUserId());
            if (defaultAddress != null && !defaultAddress.getAddressId().equals(tempAddress)) {
                //存在默认地址且默认地址并不是当前修改的地址
                defaultAddress.setDefaultFlag((byte) 0);
                defaultAddress.setUpdateTime(now);
                int updateResult = userAddressMapper.updateByPrimaryKeySelective(defaultAddress);
                if (updateResult < 1) {
                    //未更新成功
                    NewBeeMallException.fail(ServiceResultEnum.DB_ERROR.getResult());
                }
            }
        }
        mallUserAddress.setUpdateTime(now);
        return userAddressMapper.updateByPrimaryKeySelective(mallUserAddress) > 0;
    }

    @Override
    public MallUserAddress getMallUserAddressById(Long addressId) {
        MallUserAddress mallUserAddress = userAddressMapper.selectByPrimaryKey(addressId);
        if (mallUserAddress == null) {
            NewBeeMallException.fail(ServiceResultEnum.DATA_NOT_EXIST.getResult());
        }
        return mallUserAddress;
    }

    @Override
    public MallUserAddress getMyDefaultAddressByUserId(Long userId) {
        return userAddressMapper.getMyDefaultAddress(userId);
    }

    @Override
    public Boolean deleteById(Long addressId) {
        return userAddressMapper.deleteByPrimaryKey(addressId) > 0;
    }
}
