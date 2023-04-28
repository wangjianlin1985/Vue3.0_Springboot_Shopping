
package com.my.mall.service;

import com.my.mall.api.mall.vo.IndexCategoryVO;
import com.my.mall.entity.GoodsCategory;
import com.my.mall.util.PageQueryUtil;
import com.my.mall.util.PageResult;

import java.util.List;

public interface NewBeeMallCategoryService {

    String saveCategory(GoodsCategory goodsCategory);

    String updateGoodsCategory(GoodsCategory goodsCategory);

    GoodsCategory getGoodsCategoryById(Long id);

    Boolean deleteBatch(Long[] ids);

    /**
     * 返回分类数据(首页调用)
     *
     * @return
     */
    List<IndexCategoryVO> getCategoriesForIndex();

    /**
     * 后台分页
     *
     * @param pageUtil
     * @return
     */
    PageResult getCategorisPage(PageQueryUtil pageUtil);

    /**
     * 根据parentId和level获取分类列表
     *
     * @param parentIds
     * @param categoryLevel
     * @return
     */
    List<GoodsCategory> selectByLevelAndParentIdsAndNumber(List<Long> parentIds, int categoryLevel);
}
