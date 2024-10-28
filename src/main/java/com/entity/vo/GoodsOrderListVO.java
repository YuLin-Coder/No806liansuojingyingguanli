package com.entity.vo;

import com.entity.GoodsOrderListEntity;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;

/**
 * 采购调度详情表
 * 手机端接口返回实体辅助类
 * （主要作用去除一些不必要的字段）
 * @author 
 * @email
 * @date 2021-04-10
 */
@TableName("goods_order_list")
public class GoodsOrderListVO implements Serializable {
    private static final long serialVersionUID = 1L;


    /**
     * 主键
     */

    @TableField(value = "id")
    private Integer id;


    /**
     * 采购调度
     */

    @TableField(value = "goods_order_id")
    private Integer goodsOrderId;


    /**
     * 物资表
     */

    @TableField(value = "goods_id")
    private Integer goodsId;


    /**
     * 数量
     */

    @TableField(value = "goods_order_list_number")
    private Integer goodsOrderListNumber;


    /**
     * 创建时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat

    @TableField(value = "create_time")
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
	 * 设置：采购调度
	 */
    public Integer getGoodsOrderId() {
        return goodsOrderId;
    }


    /**
	 * 获取：采购调度
	 */

    public void setGoodsOrderId(Integer goodsOrderId) {
        this.goodsOrderId = goodsOrderId;
    }
    /**
	 * 设置：物资表
	 */
    public Integer getGoodsId() {
        return goodsId;
    }


    /**
	 * 获取：物资表
	 */

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }
    /**
	 * 设置：数量
	 */
    public Integer getGoodsOrderListNumber() {
        return goodsOrderListNumber;
    }


    /**
	 * 获取：数量
	 */

    public void setGoodsOrderListNumber(Integer goodsOrderListNumber) {
        this.goodsOrderListNumber = goodsOrderListNumber;
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

}
