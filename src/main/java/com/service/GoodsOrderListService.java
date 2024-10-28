package com.service;

import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.GoodsOrderListEntity;
import java.util.Map;

/**
 * 采购调度详情表 服务类
 * @author 
 * @since 2021-04-10
 */
public interface GoodsOrderListService extends IService<GoodsOrderListEntity> {

    /**
    * @param params 查询参数
    * @return 带分页的查询出来的数据
    */
     PageUtils queryPage(Map<String, Object> params);
}