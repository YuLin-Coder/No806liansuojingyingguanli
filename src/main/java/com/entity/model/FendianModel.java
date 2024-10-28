package com.entity.model;

import com.entity.FendianEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import java.io.Serializable;


/**
 * 连锁店
 * 接收传参的实体类
 *（实际开发中配合移动端接口开发手动去掉些没用的字段， 后端一般用entity就够用了）
 * 取自ModelAndView 的model名称
 * @author 
 * @email
 * @date 2021-04-10
 */
public class FendianModel implements Serializable {
    private static final long serialVersionUID = 1L;




    /**
     * 主键
     */
    private Integer id;


    /**
     * 分店名
     */
    private String fendianName;


    /**
     * 分店等级
     */
    private Integer fendianTypes;


    /**
     * 分店地址
     */
    private String fendianAddress;


    /**
     * 分店详情
     */
    private String fendianContent;


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
	 * 获取：分店名
	 */
    public String getFendianName() {
        return fendianName;
    }


    /**
	 * 设置：分店名
	 */
    public void setFendianName(String fendianName) {
        this.fendianName = fendianName;
    }
    /**
	 * 获取：分店等级
	 */
    public Integer getFendianTypes() {
        return fendianTypes;
    }


    /**
	 * 设置：分店等级
	 */
    public void setFendianTypes(Integer fendianTypes) {
        this.fendianTypes = fendianTypes;
    }
    /**
	 * 获取：分店地址
	 */
    public String getFendianAddress() {
        return fendianAddress;
    }


    /**
	 * 设置：分店地址
	 */
    public void setFendianAddress(String fendianAddress) {
        this.fendianAddress = fendianAddress;
    }
    /**
	 * 获取：分店详情
	 */
    public String getFendianContent() {
        return fendianContent;
    }


    /**
	 * 设置：分店详情
	 */
    public void setFendianContent(String fendianContent) {
        this.fendianContent = fendianContent;
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
