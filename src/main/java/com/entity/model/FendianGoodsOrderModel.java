package com.entity.model;

import com.entity.FendianGoodsOrderEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import java.io.Serializable;


/**
 * 购买订单
 * 接收传参的实体类
 *（实际开发中配合移动端接口开发手动去掉些没用的字段， 后端一般用entity就够用了）
 * 取自ModelAndView 的model名称
 * @author 
 * @email
 * @date 2021-04-10
 */
public class FendianGoodsOrderModel implements Serializable {
    private static final long serialVersionUID = 1L;




    /**
     * 主键
     */
    private Integer id;


    /**
     * 操作人姓名
     */
    private String caozuoName;


    /**
     * 操作人所在表名
     */
    private String caozuoTable;


    /**
     * 会员
     */
    private Integer huiyuanId;


    /**
     * 原总价
     */
    private Double originalMoney;


    /**
     * 折后价
     */
    private Double discountMoney;


    /**
     * 订单添加时间
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
	 * 获取：会员
	 */
    public Integer getHuiyuanId() {
        return huiyuanId;
    }


    /**
	 * 设置：会员
	 */
    public void setHuiyuanId(Integer huiyuanId) {
        this.huiyuanId = huiyuanId;
    }
    /**
	 * 获取：原总价
	 */
    public Double getOriginalMoney() {
        return originalMoney;
    }


    /**
	 * 设置：原总价
	 */
    public void setOriginalMoney(Double originalMoney) {
        this.originalMoney = originalMoney;
    }
    /**
	 * 获取：折后价
	 */
    public Double getDiscountMoney() {
        return discountMoney;
    }


    /**
	 * 设置：折后价
	 */
    public void setDiscountMoney(Double discountMoney) {
        this.discountMoney = discountMoney;
    }
    /**
	 * 获取：订单添加时间
	 */
    public Date getInsertTime() {
        return insertTime;
    }


    /**
	 * 设置：订单添加时间
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
