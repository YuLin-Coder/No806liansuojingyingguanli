package com.entity.view;

import com.entity.GoodsOrderEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
import java.util.Date;

/**
 * 采购调度表
 * 后端返回视图实体辅助类
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email
 * @date 2021-04-10
 */
@TableName("goods_order")
public class GoodsOrderView extends GoodsOrderEntity implements Serializable {
    private static final long serialVersionUID = 1L;
		/**
		* 类型的值
		*/
		private String goodsOrderValue;



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

		//级联表 gongyingshang
			/**
			* 供应商姓名
			*/
			private String gongyingshangName;
			/**
			* 供应商详情
			*/
			private String gongyingshangContent;
			/**
			* 供应商等级
			*/
			private Integer gongyingshangTypes;
				/**
				* 供应商等级的值
				*/
				private String gongyingshangValue;
			/**
			* 供应商信用等级
			*/
			private Integer gongyingshangXinyongTypes;
				/**
				* 供应商信用等级的值
				*/
				private String gongyingshangXinyongValue;

	public GoodsOrderView() {

	}

	public GoodsOrderView(GoodsOrderEntity goodsOrderEntity) {
		try {
			BeanUtils.copyProperties(this, goodsOrderEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}



			/**
			* 获取： 类型的值
			*/
			public String getGoodsOrderValue() {
				return goodsOrderValue;
			}
			/**
			* 设置： 类型的值
			*/
			public void setGoodsOrderValue(String goodsOrderValue) {
				this.goodsOrderValue = goodsOrderValue;
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











				//级联表的get和set gongyingshang
					/**
					* 获取： 供应商姓名
					*/
					public String getGongyingshangName() {
						return gongyingshangName;
					}
					/**
					* 设置： 供应商姓名
					*/
					public void setGongyingshangName(String gongyingshangName) {
						this.gongyingshangName = gongyingshangName;
					}
					/**
					* 获取： 供应商详情
					*/
					public String getGongyingshangContent() {
						return gongyingshangContent;
					}
					/**
					* 设置： 供应商详情
					*/
					public void setGongyingshangContent(String gongyingshangContent) {
						this.gongyingshangContent = gongyingshangContent;
					}
					/**
					* 获取： 供应商等级
					*/
					public Integer getGongyingshangTypes() {
						return gongyingshangTypes;
					}
					/**
					* 设置： 供应商等级
					*/
					public void setGongyingshangTypes(Integer gongyingshangTypes) {
						this.gongyingshangTypes = gongyingshangTypes;
					}


						/**
						* 获取： 供应商等级的值
						*/
						public String getGongyingshangValue() {
							return gongyingshangValue;
						}
						/**
						* 设置： 供应商等级的值
						*/
						public void setGongyingshangValue(String gongyingshangValue) {
							this.gongyingshangValue = gongyingshangValue;
						}
					/**
					* 获取： 供应商信用等级
					*/
					public Integer getGongyingshangXinyongTypes() {
						return gongyingshangXinyongTypes;
					}
					/**
					* 设置： 供应商信用等级
					*/
					public void setGongyingshangXinyongTypes(Integer gongyingshangXinyongTypes) {
						this.gongyingshangXinyongTypes = gongyingshangXinyongTypes;
					}


						/**
						* 获取： 供应商信用等级的值
						*/
						public String getGongyingshangXinyongValue() {
							return gongyingshangXinyongValue;
						}
						/**
						* 设置： 供应商信用等级的值
						*/
						public void setGongyingshangXinyongValue(String gongyingshangXinyongValue) {
							this.gongyingshangXinyongValue = gongyingshangXinyongValue;
						}



















}
