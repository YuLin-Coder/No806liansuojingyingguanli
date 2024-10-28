package com.dao;

import com.entity.FendianEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.view.FendianView;

/**
 * 连锁店 Dao 接口
 *
 * @author 
 * @since 2021-04-10
 */
public interface FendianDao extends BaseMapper<FendianEntity> {

   List<FendianView> selectListView(Pagination page,@Param("params")Map<String,Object> params);

}
