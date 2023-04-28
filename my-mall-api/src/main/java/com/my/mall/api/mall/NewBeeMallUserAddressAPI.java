
package com.my.mall.api.mall;

import com.my.mall.api.mall.param.SaveMallUserAddressParam;
import com.my.mall.api.mall.param.UpdateMallUserAddressParam;
import com.my.mall.common.ServiceResultEnum;
import com.my.mall.config.annotation.TokenToMallUser;
import com.my.mall.entity.MallUser;
import com.my.mall.entity.MallUserAddress;
import com.my.mall.util.BeanUtil;
import com.my.mall.util.Result;
import com.my.mall.util.ResultGenerator;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import com.my.mall.api.mall.vo.UserAddressVO;
import com.my.mall.service.NewBeeMallUserAddressService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@Api(value = "v1", tags = "6.新蜂商城个人地址相关接口")
@RequestMapping("/api/v1")
public class NewBeeMallUserAddressAPI {

    @Resource
    private NewBeeMallUserAddressService mallUserAddressService;

    @GetMapping("/address")
    @ApiOperation(value = "我的收货地址列表", notes = "")
    public Result<List<UserAddressVO>> addressList(@TokenToMallUser MallUser loginMallUser) {
        return ResultGenerator.genSuccessResult(mallUserAddressService.getMyAddresses(loginMallUser.getUserId()));
    }

    @PostMapping("/address")
    @ApiOperation(value = "添加地址", notes = "")
    public Result<Boolean> saveUserAddress(@RequestBody SaveMallUserAddressParam saveMallUserAddressParam,
                                           @TokenToMallUser MallUser loginMallUser) {
        MallUserAddress userAddress = new MallUserAddress();
        BeanUtil.copyProperties(saveMallUserAddressParam, userAddress);
        userAddress.setUserId(loginMallUser.getUserId());
        Boolean saveResult = mallUserAddressService.saveUserAddress(userAddress);
        //添加成功
        if (saveResult) {
            return ResultGenerator.genSuccessResult();
        }
        //添加失败
        return ResultGenerator.genFailResult("添加失败");
    }

    @PutMapping("/address")
    @ApiOperation(value = "修改地址", notes = "")
    public Result<Boolean> updateMallUserAddress(@RequestBody UpdateMallUserAddressParam updateMallUserAddressParam,
                                                 @TokenToMallUser MallUser loginMallUser) {
        MallUserAddress mallUserAddressById = mallUserAddressService.getMallUserAddressById(updateMallUserAddressParam.getAddressId());
        if (!loginMallUser.getUserId().equals(mallUserAddressById.getUserId())) {
            return ResultGenerator.genFailResult(ServiceResultEnum.REQUEST_FORBIDEN_ERROR.getResult());
        }
        MallUserAddress userAddress = new MallUserAddress();
        BeanUtil.copyProperties(updateMallUserAddressParam, userAddress);
        userAddress.setUserId(loginMallUser.getUserId());
        Boolean updateResult = mallUserAddressService.updateMallUserAddress(userAddress);
        //修改成功
        if (updateResult) {
            return ResultGenerator.genSuccessResult();
        }
        //修改失败
        return ResultGenerator.genFailResult("修改失败");
    }

    @GetMapping("/address/{addressId}")
    @ApiOperation(value = "获取收货地址详情", notes = "传参为地址id")
    public Result<UserAddressVO> getMallUserAddress(@PathVariable("addressId") Long addressId,
                                                    @TokenToMallUser MallUser loginMallUser) {
        MallUserAddress mallUserAddressById = mallUserAddressService.getMallUserAddressById(addressId);
        UserAddressVO newBeeMallUserAddressVO = new UserAddressVO();
        BeanUtil.copyProperties(mallUserAddressById, newBeeMallUserAddressVO);
        if (!loginMallUser.getUserId().equals(mallUserAddressById.getUserId())) {
            return ResultGenerator.genFailResult(ServiceResultEnum.REQUEST_FORBIDEN_ERROR.getResult());
        }
        return ResultGenerator.genSuccessResult(newBeeMallUserAddressVO);
    }

    @GetMapping("/address/default")
    @ApiOperation(value = "获取默认收货地址", notes = "无传参")
    public Result getDefaultMallUserAddress(@TokenToMallUser MallUser loginMallUser) {
        MallUserAddress mallUserAddressById = mallUserAddressService.getMyDefaultAddressByUserId(loginMallUser.getUserId());
        return ResultGenerator.genSuccessResult(mallUserAddressById);
    }

    @DeleteMapping("/address/{addressId}")
    @ApiOperation(value = "删除收货地址", notes = "传参为地址id")
    public Result deleteAddress(@PathVariable("addressId") Long addressId,
                                @TokenToMallUser MallUser loginMallUser) {
        MallUserAddress mallUserAddressById = mallUserAddressService.getMallUserAddressById(addressId);
        if (!loginMallUser.getUserId().equals(mallUserAddressById.getUserId())) {
            return ResultGenerator.genFailResult(ServiceResultEnum.REQUEST_FORBIDEN_ERROR.getResult());
        }
        Boolean deleteResult = mallUserAddressService.deleteById(addressId);
        //删除成功
        if (deleteResult) {
            return ResultGenerator.genSuccessResult();
        }
        //删除失败
        return ResultGenerator.genFailResult(ServiceResultEnum.OPERATE_ERROR.getResult());
    }
}
