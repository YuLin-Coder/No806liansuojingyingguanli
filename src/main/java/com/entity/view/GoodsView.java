package com.entity.view;

import com.entity.GoodsEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
import java.util.Date;

/**
 * 总库物资
 * 后端返回视图实体辅助类
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email
 * @date 2021-04-10
 */
@TableName("goods")
public class GoodsView extends GoodsEntity implements Serializable {
    private static final long serialVersionUID = 1L;
		/**
		* 物品种类的值
		*/
		private String goodsValue;



	public GoodsView() {

	}

	public GoodsView(GoodsEntity goodsEntity) {
		try {
			BeanUtils.copyProperties(this, goodsEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}



			/**
			* 获取： 物品种类的值
			*/
			public String getGoodsValue() {
				return goodsValue;
			}
			/**
			* 设置： 物品种类的值
			*/
			public void setGoodsValue(String goodsValue) {
				this.goodsValue = goodsValue;
			}














}
