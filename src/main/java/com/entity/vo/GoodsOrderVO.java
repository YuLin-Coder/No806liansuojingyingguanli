package com.entity.vo;

import com.entity.GoodsOrderEntity;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;

/**
 * 采购调度表
 * 手机端接口返回实体辅助类
 * （主要作用去除一些不必要的字段）
 * @author 
 * @email
 * @date 2021-04-10
 */
@TableName("goods_order")
public class GoodsOrderVO implements Serializable {
    private static final long serialVersionUID = 1L;


    /**
     * 主键
     */

    @TableField(value = "id")
    private Integer id;


    /**
     * 订单名
     */

    @TableField(value = "goods_order_name")
    private String goodsOrderName;


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
     * 类型
     */

    @TableField(value = "goods_order_types")
    private Integer goodsOrderTypes;


    /**
     * 供应商
     */

    @TableField(value = "gongyingshang_id")
    private Integer gongyingshangId;


    /**
     * 分店
     */

    @TableField(value = "fendian_id")
    private Integer fendianId;


    /**
     * 采购调度时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat

    @TableField(value = "insert_time")
    private Date insertTime;


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
	 * 设置：订单名
	 */
    public String getGoodsOrderName() {
        return goodsOrderName;
    }


    /**
	 * 获取：订单名
	 */

    public void setGoodsOrderName(String goodsOrderName) {
        this.goodsOrderName = goodsOrderName;
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
	 * 设置：类型
	 */
    public Integer getGoodsOrderTypes() {
        return goodsOrderTypes;
    }


    /**
	 * 获取：类型
	 */

    public void setGoodsOrderTypes(Integer goodsOrderTypes) {
        this.goodsOrderTypes = goodsOrderTypes;
    }
    /**
	 * 设置：供应商
	 */
    public Integer getGongyingshangId() {
        return gongyingshangId;
    }


    /**
	 * 获取：供应商
	 */

    public void setGongyingshangId(Integer gongyingshangId) {
        this.gongyingshangId = gongyingshangId;
    }
    /**
	 * 设置：分店
	 */
    public Integer getFendianId() {
        return fendianId;
    }


    /**
	 * 获取：分店
	 */

    public void setFendianId(Integer fendianId) {
        this.fendianId = fendianId;
    }
    /**
	 * 设置：采购调度时间
	 */
    public Date getInsertTime() {
        return insertTime;
    }


    /**
	 * 获取：采购调度时间
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

}
