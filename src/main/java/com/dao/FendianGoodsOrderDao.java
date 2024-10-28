package com.dao;

import com.entity.FendianGoodsOrderEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.view.FendianGoodsOrderView;

/**
 * 购买订单 Dao 接口
 *
 * @author 
 * @since 2021-04-10
 */
public interface FendianGoodsOrderDao extends BaseMapper<FendianGoodsOrderEntity> {

   List<FendianGoodsOrderView> selectListView(Pagination page,@Param("params")Map<String,Object> params);

}
