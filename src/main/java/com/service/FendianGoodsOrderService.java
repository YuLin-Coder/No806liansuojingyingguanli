package com.service;

import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.FendianGoodsOrderEntity;
import java.util.Map;

/**
 * 购买订单 服务类
 * @author 
 * @since 2021-04-10
 */
public interface FendianGoodsOrderService extends IService<FendianGoodsOrderEntity> {

    /**
    * @param params 查询参数
    * @return 带分页的查询出来的数据
    */
     PageUtils queryPage(Map<String, Object> params);
}