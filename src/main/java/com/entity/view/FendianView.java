package com.entity.view;

import com.entity.FendianEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
import java.util.Date;

/**
 * 连锁店
 * 后端返回视图实体辅助类
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email
 * @date 2021-04-10
 */
@TableName("fendian")
public class FendianView extends FendianEntity implements Serializable {
    private static final long serialVersionUID = 1L;
		/**
		* 分店等级的值
		*/
		private String fendianValue;



	public FendianView() {

	}

	public FendianView(FendianEntity fendianEntity) {
		try {
			BeanUtils.copyProperties(this, fendianEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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














}
