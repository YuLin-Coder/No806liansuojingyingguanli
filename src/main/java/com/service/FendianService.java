package com.service;

import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.FendianEntity;
import java.util.Map;

/**
 * 连锁店 服务类
 * @author 
 * @since 2021-04-10
 */
public interface FendianService extends IService<FendianEntity> {

    /**
    * @param params 查询参数
    * @return 带分页的查询出来的数据
    */
     PageUtils queryPage(Map<String, Object> params);
}