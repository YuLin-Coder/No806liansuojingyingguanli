package com.entity.view;

import com.entity.FendianGoodsOrderEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
import java.util.Date;

/**
 * 购买订单
 * 后端返回视图实体辅助类
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email
 * @date 2021-04-10
 */
@TableName("fendian_goods_order")
public class FendianGoodsOrderView extends FendianGoodsOrderEntity implements Serializable {
    private static final long serialVersionUID = 1L;



		//级联表 huiyuan
			/**
			* 会员姓名
			*/
			private String huiyuanName;
			/**
			* 会员性别
			*/
			private Integer sexTypes;
				/**
				* 会员性别的值
				*/
				private String sexValue;
			/**
			* 会员身份证号
			*/
			private String huiyuanIdNumber;
			/**
			* 会员手机号
			*/
			private String huiyuanPhone;
			/**
			* 积分
			*/
			private Integer jifen;
			/**
			* 会员等级
			*/
			private Integer jifenTypes;
				/**
				* 会员等级的值
				*/
				private String jifenValue;

	public FendianGoodsOrderView() {

	}

	public FendianGoodsOrderView(FendianGoodsOrderEntity fendianGoodsOrderEntity) {
		try {
			BeanUtils.copyProperties(this, fendianGoodsOrderEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

























				//级联表的get和set huiyuan
					/**
					* 获取： 会员姓名
					*/
					public String getHuiyuanName() {
						return huiyuanName;
					}
					/**
					* 设置： 会员姓名
					*/
					public void setHuiyuanName(String huiyuanName) {
						this.huiyuanName = huiyuanName;
					}
					/**
					* 获取： 会员性别
					*/
					public Integer getSexTypes() {
						return sexTypes;
					}
					/**
					* 设置： 会员性别
					*/
					public void setSexTypes(Integer sexTypes) {
						this.sexTypes = sexTypes;
					}


						/**
						* 获取： 会员性别的值
						*/
						public String getSexValue() {
							return sexValue;
						}
						/**
						* 设置： 会员性别的值
						*/
						public void setSexValue(String sexValue) {
							this.sexValue = sexValue;
						}
					/**
					* 获取： 会员身份证号
					*/
					public String getHuiyuanIdNumber() {
						return huiyuanIdNumber;
					}
					/**
					* 设置： 会员身份证号
					*/
					public void setHuiyuanIdNumber(String huiyuanIdNumber) {
						this.huiyuanIdNumber = huiyuanIdNumber;
					}
					/**
					* 获取： 会员手机号
					*/
					public String getHuiyuanPhone() {
						return huiyuanPhone;
					}
					/**
					* 设置： 会员手机号
					*/
					public void setHuiyuanPhone(String huiyuanPhone) {
						this.huiyuanPhone = huiyuanPhone;
					}
					/**
					* 获取： 积分
					*/
					public Integer getJifen() {
						return jifen;
					}
					/**
					* 设置： 积分
					*/
					public void setJifen(Integer jifen) {
						this.jifen = jifen;
					}
					/**
					* 获取： 会员等级
					*/
					public Integer getJifenTypes() {
						return jifenTypes;
					}
					/**
					* 设置： 会员等级
					*/
					public void setJifenTypes(Integer jifenTypes) {
						this.jifenTypes = jifenTypes;
					}


						/**
						* 获取： 会员等级的值
						*/
						public String getJifenValue() {
							return jifenValue;
						}
						/**
						* 设置： 会员等级的值
						*/
						public void setJifenValue(String jifenValue) {
							this.jifenValue = jifenValue;
						}




}
