package com.dao;

import com.entity.GongyingshangEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.view.GongyingshangView;

/**
 * 供应商 Dao 接口
 *
 * @author 
 * @since 2021-04-10
 */
public interface GongyingshangDao extends BaseMapper<GongyingshangEntity> {

   List<GongyingshangView> selectListView(Pagination page,@Param("params")Map<String,Object> params);

}
