package com.entity.model;

import com.entity.GoodsOrderListEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import java.io.Serializable;


/**
 * 采购调度详情表
 * 接收传参的实体类
 *（实际开发中配合移动端接口开发手动去掉些没用的字段， 后端一般用entity就够用了）
 * 取自ModelAndView 的model名称
 * @author 
 * @email
 * @date 2021-04-10
 */
public class GoodsOrderListModel implements Serializable {
    private static final long serialVersionUID = 1L;




    /**
     * 主键
     */
    private Integer id;


    /**
     * 采购调度
     */
    private Integer goodsOrderId;


    /**
     * 物资表
     */
    private Integer goodsId;


    /**
     * 数量
     */
    private Integer goodsOrderListNumber;


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
	 * 获取：采购调度
	 */
    public Integer getGoodsOrderId() {
        return goodsOrderId;
    }


    /**
	 * 设置：采购调度
	 */
    public void setGoodsOrderId(Integer goodsOrderId) {
        this.goodsOrderId = goodsOrderId;
    }
    /**
	 * 获取：物资表
	 */
    public Integer getGoodsId() {
        return goodsId;
    }


    /**
	 * 设置：物资表
	 */
    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }
    /**
	 * 获取：数量
	 */
    public Integer getGoodsOrderListNumber() {
        return goodsOrderListNumber;
    }


    /**
	 * 设置：数量
	 */
    public void setGoodsOrderListNumber(Integer goodsOrderListNumber) {
        this.goodsOrderListNumber = goodsOrderListNumber;
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
