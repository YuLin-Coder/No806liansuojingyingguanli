package com.entity.view;

import com.entity.HuiyuanEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
import java.util.Date;

/**
 * 会员
 * 后端返回视图实体辅助类
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email
 * @date 2021-04-10
 */
@TableName("huiyuan")
public class HuiyuanView extends HuiyuanEntity implements Serializable {
    private static final long serialVersionUID = 1L;
		/**
		* 会员性别的值
		*/
		private String sexValue;
		/**
		* 会员等级的值
		*/
		private String jifenValue;



	public HuiyuanView() {

	}

	public HuiyuanView(HuiyuanEntity huiyuanEntity) {
		try {
			BeanUtils.copyProperties(this, huiyuanEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
