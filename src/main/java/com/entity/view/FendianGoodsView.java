package com.entity.view;

import com.entity.FendianGoodsEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
import java.util.Date;

/**
 * 分店物资
 * 后端返回视图实体辅助类
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email
 * @date 2021-04-10
 */
@TableName("fendian_goods")
public class FendianGoodsView extends FendianGoodsEntity implements Serializable {
    private static final long serialVersionUID = 1L;
		/**
		* 物品种类的值
		*/
		private String goodsValue;



		//级联表 fendian
			/**
			* 分店名
			*/
			private String fendianName;
			/**
			* 分店等级
			*/
			private Integer fendianTypes;
				/**
				* 分店等级的值
				*/
				private String fendianValue;
			/**
			* 分店地址
			*/
			private String fendianAddress;
			/**
			* 分店详情
			*/
			private String fendianContent;

	public FendianGoodsView() {

	}

	public FendianGoodsView(FendianGoodsEntity fendianGoodsEntity) {
		try {
			BeanUtils.copyProperties(this, fendianGoodsEntity);
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






				//级联表的get和set fendian
					/**
					* 获取： 分店名
					*/
					public String getFendianName() {
						return fendianName;
					}
					/**
					* 设置： 分店名
					*/
					public void setFendianName(String fendianName) {
						this.fendianName = fendianName;
					}
					/**
					* 获取： 分店等级
					*/
					public Integer getFendianTypes() {
						return fendianTypes;
					}
					/**
					* 设置： 分店等级
					*/
					public void setFendianTypes(Integer fendianTypes) {
						this.fendianTypes = fendianTypes;
					}


						/**
						* 获取： 分店等级的值
						*/
						public String getFendianValue() {
							return fendianValue;
						}
						/**
						* 设置： 分店等级的值
						*/
						public void setFendianValue(String fendianValue) {
							this.fendianValue = fendianValue;
						}
					/**
					* 获取： 分店地址
					*/
					public String getFendianAddress() {
						return fendianAddress;
					}
					/**
					* 设置： 分店地址
					*/
					public void setFendianAddress(String fendianAddress) {
						this.fendianAddress = fendianAddress;
					}
					/**
					* 获取： 分店详情
					*/
					public String getFendianContent() {
						return fendianContent;
					}
					/**
					* 设置： 分店详情
					*/
					public void setFendianContent(String fendianContent) {
						this.fendianContent = fendianContent;
					}




















}
