
package com.my.mall.api.mall;

import com.my.mall.common.Constants;
import com.my.mall.common.IndexConfigTypeEnum;
import com.my.mall.util.Result;
import com.my.mall.util.ResultGenerator;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import com.my.mall.api.mall.vo.IndexInfoVO;
import com.my.mall.api.mall.vo.IndexCarouselVO;
import com.my.mall.api.mall.vo.IndexConfigGoodsVO;
import com.my.mall.service.NewBeeMallCarouselService;
import com.my.mall.service.NewBeeMallIndexConfigService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@Api(value = "v1", tags = "1.新蜂商城首页接口")
@RequestMapping("/api/v1")
public class NewBeeMallIndexAPI {

    @Resource
    private NewBeeMallCarouselService newBeeMallCarouselService;

    @Resource
    private NewBeeMallIndexConfigService newBeeMallIndexConfigService;

    @GetMapping("/index-infos")
    @ApiOperation(value = "获取首页数据", notes = "轮播图、新品、推荐等")
    public Result<IndexInfoVO> indexInfo() {
        IndexInfoVO indexInfoVO = new IndexInfoVO();
        List<IndexCarouselVO> carousels = newBeeMallCarouselService.getCarouselsForIndex(Constants.INDEX_CAROUSEL_NUMBER);
        List<IndexConfigGoodsVO> hotGoodses = newBeeMallIndexConfigService.getConfigGoodsesForIndex(IndexConfigTypeEnum.INDEX_GOODS_HOT.getType(), Constants.INDEX_GOODS_HOT_NUMBER);
        List<IndexConfigGoodsVO> newGoodses = newBeeMallIndexConfigService.getConfigGoodsesForIndex(IndexConfigTypeEnum.INDEX_GOODS_NEW.getType(), Constants.INDEX_GOODS_NEW_NUMBER);
        List<IndexConfigGoodsVO> recommendGoodses = newBeeMallIndexConfigService.getConfigGoodsesForIndex(IndexConfigTypeEnum.INDEX_GOODS_RECOMMOND.getType(), Constants.INDEX_GOODS_RECOMMOND_NUMBER);
        indexInfoVO.setCarousels(carousels);
        indexInfoVO.setHotGoodses(hotGoodses);
        indexInfoVO.setNewGoodses(newGoodses);
        indexInfoVO.setRecommendGoodses(recommendGoodses);
        return ResultGenerator.genSuccessResult(indexInfoVO);
    }
}
