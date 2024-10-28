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
 * 连锁店
 *
 * @author 
 * @email
 * @date 2021-04-10
 */
@TableName("fendian")
public class FendianEntity<T> implements Serializable {
    private static final long serialVersionUID = 1L;


	public FendianEntity() {

	}

	public FendianEntity(T t) {
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

    @Override
    public String toString() {
        return "Fendian{" +
            "id=" + id +
            ", fendianName=" + fendianName +
            ", fendianTypes=" + fendianTypes +
            ", fendianAddress=" + fendianAddress +
            ", fendianContent=" + fendianContent +
            ", createTime=" + createTime +
        "}";
    }
}
