package com.entity.model;

import com.entity.FendianGoodsOrderListEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import java.io.Serializable;


/**
 * 购买订单详情
 * 接收传参的实体类
 *（实际开发中配合移动端接口开发手动去掉些没用的字段， 后端一般用entity就够用了）
 * 取自ModelAndView 的model名称
 * @author 
 * @email
 * @date 2021-04-10
 */
public class FendianGoodsOrderListModel implements Serializable {
    private static final long serialVersionUID = 1L;




    /**
     * 主键
     */
    private Integer id;


    /**
     * 购买订单
     */
    private Integer fendianGoodsOrderId;


    /**
     * 分店物资
     */
    private Integer fendianGoodsId;


    /**
     * 数量
     */
    private Integer fendianGoodsOrderListNumber;


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
	 * 获取：购买订单
	 */
    public Integer getFendianGoodsOrderId() {
        return fendianGoodsOrderId;
    }


    /**
	 * 设置：购买订单
	 */
    public void setFendianGoodsOrderId(Integer fendianGoodsOrderId) {
        this.fendianGoodsOrderId = fendianGoodsOrderId;
    }
    /**
	 * 获取：分店物资
	 */
    public Integer getFendianGoodsId() {
        return fendianGoodsId;
    }


    /**
	 * 设置：分店物资
	 */
    public void setFendianGoodsId(Integer fendianGoodsId) {
        this.fendianGoodsId = fendianGoodsId;
    }
    /**
	 * 获取：数量
	 */
    public Integer getFendianGoodsOrderListNumber() {
        return fendianGoodsOrderListNumber;
    }


    /**
	 * 设置：数量
	 */
    public void setFendianGoodsOrderListNumber(Integer fendianGoodsOrderListNumber) {
        this.fendianGoodsOrderListNumber = fendianGoodsOrderListNumber;
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
