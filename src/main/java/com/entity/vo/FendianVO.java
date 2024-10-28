package com.entity.vo;

import com.entity.FendianEntity;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;

/**
 * 连锁店
 * 手机端接口返回实体辅助类
 * （主要作用去除一些不必要的字段）
 * @author 
 * @email
 * @date 2021-04-10
 */
@TableName("fendian")
public class FendianVO implements Serializable {
    private static final long serialVersionUID = 1L;


    /**
     * 主键
     */

    @TableField(value = "id")
    private Integer id;


    /**
     * 分店名
     */

    @TableField(value = "fendian_name")
    private String fendianName;


    /**
     * 分店等级
     */

    @TableField(value = "fendian_types")
    private Integer fendianTypes;


    /**
     * 分店地址
     */

    @TableField(value = "fendian_address")
    private String fendianAddress;


    /**
     * 分店详情
     */

    @TableField(value = "fendian_content")
    private String fendianContent;


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
	 * 设置：分店名
	 */
    public String getFendianName() {
        return fendianName;
    }


    /**
	 * 获取：分店名
	 */

    public void setFendianName(String fendianName) {
        this.fendianName = fendianName;
    }
    /**
	 * 设置：分店等级
	 */
    public Integer getFendianTypes() {
        return fendianTypes;
    }


    /**
	 * 获取：分店等级
	 */

    public void setFendianTypes(Integer fendianTypes) {
        this.fendianTypes = fendianTypes;
    }
    /**
	 * 设置：分店地址
	 */
    public String getFendianAddress() {
        return fendianAddress;
    }


    /**
	 * 获取：分店地址
	 */

    public void setFendianAddress(String fendianAddress) {
        this.fendianAddress = fendianAddress;
    }
    /**
	 * 设置：分店详情
	 */
    public String getFendianContent() {
        return fendianContent;
    }


    /**
	 * 获取：分店详情
	 */

    public void setFendianContent(String fendianContent) {
        this.fendianContent = fendianContent;
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
