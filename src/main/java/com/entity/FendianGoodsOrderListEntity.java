package com.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.beanutils.BeanUtils;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.enums.IdType;

/**
 * 购买订单详情
 *
 * @author 
 * @email
 * @date 2021-04-10
 */
@TableName("fendian_goods_order_list")
public class FendianGoodsOrderListEntity<T> implements Serializable {
    private static final long serialVersionUID = 1L;


	public FendianGoodsOrderListEntity() {

	}

	public FendianGoodsOrderListEntity(T t) {
		try {
			BeanUtils.copyProperties(this, t);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


    /**
     * 主键
     */
    @TableId(type = IdType.AUTO)
    @TableField(value = "id")

    private Integer id;


    /**
     * 购买订单
     */
    @TableField(value = "fendian_goods_order_id")

    private Integer fendianGoodsOrderId;


    /**
     * 分店物资
     */
    @TableField(value = "fendian_goods_id")

    private Integer fendianGoodsId;


    /**
     * 数量
     */
    @TableField(value = "fendian_goods_order_list_number")

    private Integer fendianGoodsOrderListNumber;


    /**
     * 创建时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    @TableField(value = "create_time",fill = FieldFill.INSERT)

    private Date createTime;


    /**
	 * 设置：主键
	 */
    public Integer getId() {
        return id;
    }


    /**
	 * 获取：主键
	 */

    public void setId(Integer id) {
        this.id = id;
    }
    /**
	 * 设置：购买订单
	 */
    public Integer getFendianGoodsOrderId() {
        return fendianGoodsOrderId;
    }


    /**
	 * 获取：购买订单
	 */

    public void setFendianGoodsOrderId(Integer fendianGoodsOrderId) {
        this.fendianGoodsOrderId = fendianGoodsOrderId;
    }
    /**
	 * 设置：分店物资
	 */
    public Integer getFendianGoodsId() {
        return fendianGoodsId;
    }


    /**
	 * 获取：分店物资
	 */

    public void setFendianGoodsId(Integer fendianGoodsId) {
        this.fendianGoodsId = fendianGoodsId;
    }
    /**
	 * 设置：数量
	 */
    public Integer getFendianGoodsOrderListNumber() {
        return fendianGoodsOrderListNumber;
    }


    /**
	 * 获取：数量
	 */

    public void setFendianGoodsOrderListNumber(Integer fendianGoodsOrderListNumber) {
        this.fendianGoodsOrderListNumber = fendianGoodsOrderListNumber;
    }
    /**
	 * 设置：创建时间
	 */
    public Date getCreateTime() {
        return createTime;
    }


    /**
	 * 获取：创建时间
	 */

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "FendianGoodsOrderList{" +
            "id=" + id +
            ", fendianGoodsOrderId=" + fendianGoodsOrderId +
            ", fendianGoodsId=" + fendianGoodsId +
            ", fendianGoodsOrderListNumber=" + fendianGoodsOrderListNumber +
            ", createTime=" + createTime +
        "}";
    }
}
