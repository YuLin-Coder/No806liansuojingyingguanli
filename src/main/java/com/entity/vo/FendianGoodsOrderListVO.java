package com.entity.vo;

import com.entity.FendianGoodsOrderListEntity;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;

/**
 * 购买订单详情
 * 手机端接口返回实体辅助类
 * （主要作用去除一些不必要的字段）
 * @author 
 * @email
 * @date 2021-04-10
 */
@TableName("fendian_goods_order_list")
public class FendianGoodsOrderListVO implements Serializable {
    private static final long serialVersionUID = 1L;


    /**
     * 主键
     */

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

}
