package com.entity.model;

import com.entity.GoodsOrderEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import java.io.Serializable;


/**
 * 采购调度表
 * 接收传参的实体类
 *（实际开发中配合移动端接口开发手动去掉些没用的字段， 后端一般用entity就够用了）
 * 取自ModelAndView 的model名称
 * @author 
 * @email
 * @date 2021-04-10
 */
public class GoodsOrderModel implements Serializable {
    private static final long serialVersionUID = 1L;




    /**
     * 主键
     */
    private Integer id;


    /**
     * 订单名
     */
    private String goodsOrderName;


    /**
     * 操作人姓名
     */
    private String caozuoName;


    /**
     * 操作人所在表名
     */
    private String caozuoTable;


    /**
     * 类型
     */
    private Integer goodsOrderTypes;


    /**
     * 供应商
     */
    private Integer gongyingshangId;


    /**
     * 分店
     */
    private Integer fendianId;


    /**
     * 采购调度时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    private Date insertTime;


    /**
     * 创建时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    private Date createTime;


    /**
	 * 获取：主键
	 */
    public Integer getId() {
        return id;
    }


    /**
	 * 设置：主键
	 */
    public void setId(Integer id) {
        this.id = id;
    }
    /**
	 * 获取：订单名
	 */
    public String getGoodsOrderName() {
        return goodsOrderName;
    }


    /**
	 * 设置：订单名
	 */
    public void setGoodsOrderName(String goodsOrderName) {
        this.goodsOrderName = goodsOrderName;
    }
    /**
	 * 获取：操作人姓名
	 */
    public String getCaozuoName() {
        return caozuoName;
    }


    /**
	 * 设置：操作人姓名
	 */
    public void setCaozuoName(String caozuoName) {
        this.caozuoName = caozuoName;
    }
    /**
	 * 获取：操作人所在表名
	 */
    public String getCaozuoTable() {
        return caozuoTable;
    }


    /**
	 * 设置：操作人所在表名
	 */
    public void setCaozuoTable(String caozuoTable) {
        this.caozuoTable = caozuoTable;
    }
    /**
	 * 获取：类型
	 */
    public Integer getGoodsOrderTypes() {
        return goodsOrderTypes;
    }


    /**
	 * 设置：类型
	 */
    public void setGoodsOrderTypes(Integer goodsOrderTypes) {
        this.goodsOrderTypes = goodsOrderTypes;
    }
    /**
	 * 获取：供应商
	 */
    public Integer getGongyingshangId() {
        return gongyingshangId;
    }


    /**
	 * 设置：供应商
	 */
    public void setGongyingshangId(Integer gongyingshangId) {
        this.gongyingshangId = gongyingshangId;
    }
    /**
	 * 获取：分店
	 */
    public Integer getFendianId() {
        return fendianId;
    }


    /**
	 * 设置：分店
	 */
    public void setFendianId(Integer fendianId) {
        this.fendianId = fendianId;
    }
    /**
	 * 获取：采购调度时间
	 */
    public Date getInsertTime() {
        return insertTime;
    }


    /**
	 * 设置：采购调度时间
	 */
    public void setInsertTime(Date insertTime) {
        this.insertTime = insertTime;
    }
    /**
	 * 获取：创建时间
	 */
    public Date getCreateTime() {
        return createTime;
    }


    /**
	 * 设置：创建时间
	 */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    }
