
package com.my.mall.api.admin;

import com.my.mall.api.admin.param.BatchIdParam;
import com.my.mall.config.annotation.TokenToAdminUser;
import com.my.mall.entity.AdminUserToken;
import com.my.mall.util.PageQueryUtil;
import com.my.mall.util.Result;
import com.my.mall.util.ResultGenerator;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import com.my.mall.service.NewBeeMallUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;


@RestController
@Api(value = "v1", tags = "8-6.后台管理系统注册用户模块接口")
@RequestMapping("/manage-api/v1")
public class AdminRegisteUserAPI {

    private static final Logger logger = LoggerFactory.getLogger(AdminRegisteUserAPI.class);

    @Resource
    private NewBeeMallUserService newBeeMallUserService;

    /**
     * 列表
     */
    @RequestMapping(value = "/users", method = RequestMethod.GET)
    @ApiOperation(value = "商城注册用户列表", notes = "商城注册用户列表")
    public Result list(@RequestParam(required = false) @ApiParam(value = "页码") Integer pageNumber,
                       @RequestParam(required = false) @ApiParam(value = "每页条数") Integer pageSize,
                       @RequestParam(required = false) @ApiParam(value = "用户状态") Integer lockStatus, @TokenToAdminUser AdminUserToken adminUser) {
        logger.info("adminUser:{}", adminUser.toString());
        if (pageNumber == null || pageNumber < 1 || pageSize == null || pageSize < 10) {
            return ResultGenerator.genFailResult("参数异常！");
        }
        Map params = new HashMap(8);
        params.put("page", pageNumber);
        params.put("limit", pageSize);
        if (lockStatus != null) {
            params.put("orderStatus", lockStatus);
        }
        PageQueryUtil pageUtil = new PageQueryUtil(params);
        return ResultGenerator.genSuccessResult(newBeeMallUserService.getNewBeeMallUsersPage(pageUtil));
    }

    /**
     * 用户禁用与解除禁用(0-未锁定 1-已锁定)
     */
    @RequestMapping(value = "/users/{lockStatus}", method = RequestMethod.PUT)
    @ApiOperation(value = "修改用户状态", notes = "批量修改，用户禁用与解除禁用(0-未锁定 1-已锁定)")
    public Result lockUser(@RequestBody BatchIdParam batchIdParam, @PathVariable int lockStatus, @TokenToAdminUser AdminUserToken adminUser) {
        logger.info("adminUser:{}", adminUser.toString());
        if (batchIdParam==null||batchIdParam.getIds().length < 1) {
            return ResultGenerator.genFailResult("参数异常！");
        }
        if (lockStatus != 0 && lockStatus != 1) {
            return ResultGenerator.genFailResult("操作非法！");
        }
        if (newBeeMallUserService.lockUsers(batchIdParam.getIds(), lockStatus)) {
            return ResultGenerator.genSuccessResult();
        } else {
            return ResultGenerator.genFailResult("禁用失败");
        }
    }
}
