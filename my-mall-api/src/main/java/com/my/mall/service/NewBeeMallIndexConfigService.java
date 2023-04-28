
package com.my.mall.service;

import com.my.mall.api.mall.vo.IndexConfigGoodsVO;
import com.my.mall.entity.IndexConfig;
import com.my.mall.util.PageQueryUtil;
import com.my.mall.util.PageResult;

import java.util.List;

public interface NewBeeMallIndexConfigService {

    /**
     * 返回固定数量的首页配置商品对象(首页调用)
     *
     * @param number
     * @return
     */
    List<IndexConfigGoodsVO> getConfigGoodsesForIndex(int configType, int number);

    /**
     * 后台分页
     *
     * @param pageUtil
     * @return
     */
    PageResult getConfigsPage(PageQueryUtil pageUtil);

    String saveIndexConfig(IndexConfig indexConfig);

    String updateIndexConfig(IndexConfig indexConfig);

    IndexConfig getIndexConfigById(Long id);

    Boolean deleteBatch(Long[] ids);
}
