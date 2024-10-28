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
 * 供应商
 *
 * @author 
 * @email
 * @date 2021-04-10
 */
@TableName("gongyingshang")
public class GongyingshangEntity<T> implements Serializable {
    private static final long serialVersionUID = 1L;


	public GongyingshangEntity() {

	}

	public GongyingshangEntity(T t) {
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
     * 供应商姓名
     */
    @TableField(value = "gongyingshang_name")

    private String gongyingshangName;


    /**
     * 供应商详情
     */
    @TableField(value = "gongyingshang_content")

    private String gongyingshangContent;


    /**
     * 供应商等级
     */
    @TableField(value = "gongyingshang_types")

    private Integer gongyingshangTypes;


    /**
     * 供应商信用等级
     */
    @TableField(value = "gongyingshang_xinyong_types")

    private Integer gongyingshangXinyongTypes;


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
	 * 设置：供应商姓名
	 */
    public String getGongyingshangName() {
        return gongyingshangName;
    }


    /**
	 * 获取：供应商姓名
	 */

    public void setGongyingshangName(String gongyingshangName) {
        this.gongyingshangName = gongyingshangName;
    }
    /**
	 * 设置：供应商详情
	 */
    public String getGongyingshangContent() {
        return gongyingshangContent;
    }


    /**
	 * 获取：供应商详情
	 */

    public void setGongyingshangContent(String gongyingshangContent) {
        this.gongyingshangContent = gongyingshangContent;
    }
    /**
	 * 设置：供应商等级
	 */
    public Integer getGongyingshangTypes() {
        return gongyingshangTypes;
    }


    /**
	 * 获取：供应商等级
	 */

    public void setGongyingshangTypes(Integer gongyingshangTypes) {
        this.gongyingshangTypes = gongyingshangTypes;
    }
    /**
	 * 设置：供应商信用等级
	 */
    public Integer getGongyingshangXinyongTypes() {
        return gongyingshangXinyongTypes;
    }


    /**
	 * 获取：供应商信用等级
	 */

    public void setGongyingshangXinyongTypes(Integer gongyingshangXinyongTypes) {
        this.gongyingshangXinyongTypes = gongyingshangXinyongTypes;
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
        return "Gongyingshang{" +
            "id=" + id +
            ", gongyingshangName=" + gongyingshangName +
            ", gongyingshangContent=" + gongyingshangContent +
            ", gongyingshangTypes=" + gongyingshangTypes +
            ", gongyingshangXinyongTypes=" + gongyingshangXinyongTypes +
            ", createTime=" + createTime +
        "}";
    }
}
