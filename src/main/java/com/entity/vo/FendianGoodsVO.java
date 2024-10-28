package com.entity.vo;

import com.entity.FendianGoodsEntity;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;

/**
 * 分店物资
 * 手机端接口返回实体辅助类
 * （主要作用去除一些不必要的字段）
 * @author 
 * @email
 * @date 2021-04-10
 */
@TableName("fendian_goods")
public class FendianGoodsVO implements Serializable {
    private static final long serialVersionUID = 1L;


    /**
     * 主键
     */

    @TableField(value = "id")
    private Integer id;


    /**
     * 分店
     */

    @TableField(value = "fendian_id")
    private Integer fendianId;


    /**
     * 分店
     */

    @TableField(value = "goods_only")
    private Integer goodsOnly;


    /**
     * 分店物品名字
     */

    @TableField(value = "goods_name")
    private String goodsName;


    /**
     * 物品种类
     */

    @TableField(value = "goods_types")
    private Integer goodsTypes;


    /**
     * 分店物资数量
     */

    @TableField(value = "fendian_goods_number")
    private Integer fendianGoodsNumber;


    /**
     * 分店物品图片
     */

    @TableField(value = "goods_photo")
    private String goodsPhoto;


    /**
     * 单位
     */

    @TableField(value = "danwei")
    private String danwei;


    /**
     * 单价
     */

    @TableField(value = "danjia")
    private Double danjia;


    /**
     * 物资详情
     */

    @TableField(value = "goods_content")
    private String goodsContent;


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
	 * 设置：分店
	 */
    public Integer getGoodsOnly() {
        return goodsOnly;
    }


    /**
	 * 获取：分店
	 */

    public void setGoodsOnly(Integer goodsOnly) {
        this.goodsOnly = goodsOnly;
    }
    /**
	 * 设置：分店物品名字
	 */
    public String getGoodsName() {
        return goodsName;
    }


    /**
	 * 获取：分店物品名字
	 */

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }
    /**
	 * 设置：物品种类
	 */
    public Integer getGoodsTypes() {
        return goodsTypes;
    }


    /**
	 * 获取：物品种类
	 */

    public void setGoodsTypes(Integer goodsTypes) {
        this.goodsTypes = goodsTypes;
    }
    /**
	 * 设置：分店物资数量
	 */
    public Integer getFendianGoodsNumber() {
        return fendianGoodsNumber;
    }


    /**
	 * 获取：分店物资数量
	 */

    public void setFendianGoodsNumber(Integer fendianGoodsNumber) {
        this.fendianGoodsNumber = fendianGoodsNumber;
    }
    /**
	 * 设置：分店物品图片
	 */
    public String getGoodsPhoto() {
        return goodsPhoto;
    }


    /**
	 * 获取：分店物品图片
	 */

    public void setGoodsPhoto(String goodsPhoto) {
        this.goodsPhoto = goodsPhoto;
    }
    /**
	 * 设置：单位
	 */
    public String getDanwei() {
        return danwei;
    }


    /**
	 * 获取：单位
	 */

    public void setDanwei(String danwei) {
        this.danwei = danwei;
    }
    /**
	 * 设置：单价
	 */
    public Double getDanjia() {
        return danjia;
    }


    /**
	 * 获取：单价
	 */

    public void setDanjia(Double danjia) {
        this.danjia = danjia;
    }
    /**
	 * 设置：物资详情
	 */
    public String getGoodsContent() {
        return goodsContent;
    }


    /**
	 * 获取：物资详情
	 */

    public void setGoodsContent(String goodsContent) {
        this.goodsContent = goodsContent;
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
