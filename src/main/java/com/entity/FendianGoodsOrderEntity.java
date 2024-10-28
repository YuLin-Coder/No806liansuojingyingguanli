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
 * 购买订单
 *
 * @author 
 * @email
 * @date 2021-04-10
 */
@TableName("fendian_goods_order")
public class FendianGoodsOrderEntity<T> implements Serializable {
    private static final long serialVersionUID = 1L;


	public FendianGoodsOrderEntity() {

	}

	public FendianGoodsOrderEntity(T t) {
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
     * 操作人姓名
     */
    @TableField(value = "caozuo_name")

    private String caozuoName;


    /**
     * 操作人所在表名
     */
    @TableField(value = "caozuo_table")

    private String caozuoTable;


    /**
     * 会员
     */
    @TableField(value = "huiyuan_id")

    private Integer huiyuanId;


    /**
     * 原总价
     */
    @TableField(value = "original_money")

    private Double originalMoney;


    /**
     * 折后价
     */
    @TableField(value = "discount_money")

    private Double discountMoney;


    /**
     * 订单添加时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    @TableField(value = "insert_time",fill = FieldFill.INSERT)

    private Date insertTime;


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
	 * 设置：操作人姓名
	 */
    public String getCaozuoName() {
        return caozuoName;
    }


    /**
	 * 获取：操作人姓名
	 */

    public void setCaozuoName(String caozuoName) {
        this.caozuoName = caozuoName;
    }
    /**
	 * 设置：操作人所在表名
	 */
    public String getCaozuoTable() {
        return caozuoTable;
    }


    /**
	 * 获取：操作人所在表名
	 */

    public void setCaozuoTable(String caozuoTable) {
        this.caozuoTable = caozuoTable;
    }
    /**
	 * 设置：会员
	 */
    public Integer getHuiyuanId() {
        return huiyuanId;
    }


    /**
	 * 获取：会员
	 */

    public void setHuiyuanId(Integer huiyuanId) {
        this.huiyuanId = huiyuanId;
    }
    /**
	 * 设置：原总价
	 */
    public Double getOriginalMoney() {
        return originalMoney;
    }


    /**
	 * 获取：原总价
	 */

    public void setOriginalMoney(Double originalMoney) {
        this.originalMoney = originalMoney;
    }
    /**
	 * 设置：折后价
	 */
    public Double getDiscountMoney() {
        return discountMoney;
    }


    /**
	 * 获取：折后价
	 */

    public void setDiscountMoney(Double discountMoney) {
        this.discountMoney = discountMoney;
    }
    /**
	 * 设置：订单添加时间
	 */
    public Date getInsertTime() {
        return insertTime;
    }


    /**
	 * 获取：订单添加时间
	 */

    public void setInsertTime(Date insertTime) {
        this.insertTime = insertTime;
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
        return "FendianGoodsOrder{" +
            "id=" + id +
            ", caozuoName=" + caozuoName +
            ", caozuoTable=" + caozuoTable +
            ", huiyuanId=" + huiyuanId +
            ", originalMoney=" + originalMoney +
            ", discountMoney=" + discountMoney +
            ", insertTime=" + insertTime +
            ", createTime=" + createTime +
        "}";
    }
}
