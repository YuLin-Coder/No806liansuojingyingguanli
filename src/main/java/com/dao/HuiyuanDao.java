package com.dao;

import com.entity.HuiyuanEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.view.HuiyuanView;

/**
 * 会员 Dao 接口
 *
 * @author 
 * @since 2021-04-10
 */
public interface HuiyuanDao extends BaseMapper<HuiyuanEntity> {

   List<HuiyuanView> selectListView(Pagination page,@Param("params")Map<String,Object> params);

}
