
package com.my.mall.service;

import com.my.mall.api.mall.vo.IndexCarouselVO;
import com.my.mall.entity.Carousel;
import com.my.mall.util.PageQueryUtil;
import com.my.mall.util.PageResult;

import java.util.List;

public interface NewBeeMallCarouselService {

    /**
     * 返回固定数量的轮播图对象(首页调用)
     *
     * @param number
     * @return
     */
    List<IndexCarouselVO> getCarouselsForIndex(int number);

    /**
     * 后台分页
     *
     * @param pageUtil
     * @return
     */
    PageResult getCarouselPage(PageQueryUtil pageUtil);

    String saveCarousel(Carousel carousel);

    String updateCarousel(Carousel carousel);

    Carousel getCarouselById(Integer id);

    Boolean deleteBatch(Long[] ids);
}
