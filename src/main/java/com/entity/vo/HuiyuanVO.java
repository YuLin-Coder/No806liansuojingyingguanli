package com.entity.vo;

import com.entity.HuiyuanEntity;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;

/**
 * 会员
 * 手机端接口返回实体辅助类
 * （主要作用去除一些不必要的字段）
 * @author 
 * @email
 * @date 2021-04-10
 */
@TableName("huiyuan")
public class HuiyuanVO implements Serializable {
    private static final long serialVersionUID = 1L;


    /**
     * 主键
     */

    @TableField(value = "id")
    private Integer id;


    /**
     * 会员姓名
     */

    @TableField(value = "huiyuan_name")
    private String huiyuanName;


    /**
     * 会员性别
     */

    @TableField(value = "sex_types")
    private Integer sexTypes;


    /**
     * 会员身份证号
     */

    @TableField(value = "huiyuan_id_number")
    private String huiyuanIdNumber;


    /**
     * 会员手机号
     */

    @TableField(value = "huiyuan_phone")
    private String huiyuanPhone;


    /**
     * 积分
     */

    @TableField(value = "jifen")
    private Integer jifen;


    /**
     * 会员等级
     */

    @TableField(value = "jifen_types")
    private Integer jifenTypes;


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
	 * 设置：会员姓名
	 */
    public String getHuiyuanName() {
        return huiyuanName;
    }


    /**
	 * 获取：会员姓名
	 */

    public void setHuiyuanName(String huiyuanName) {
        this.huiyuanName = huiyuanName;
    }
    /**
	 * 设置：会员性别
	 */
    public Integer getSexTypes() {
        return sexTypes;
    }


    /**
	 * 获取：会员性别
	 */

    public void setSexTypes(Integer sexTypes) {
        this.sexTypes = sexTypes;
    }
    /**
	 * 设置：会员身份证号
	 */
    public String getHuiyuanIdNumber() {
        return huiyuanIdNumber;
    }


    /**
	 * 获取：会员身份证号
	 */

    public void setHuiyuanIdNumber(String huiyuanIdNumber) {
        this.huiyuanIdNumber = huiyuanIdNumber;
    }
    /**
	 * 设置：会员手机号
	 */
    public String getHuiyuanPhone() {
        return huiyuanPhone;
    }


    /**
	 * 获取：会员手机号
	 */

    public void setHuiyuanPhone(String huiyuanPhone) {
        this.huiyuanPhone = huiyuanPhone;
    }
    /**
	 * 设置：积分
	 */
    public Integer getJifen() {
        return jifen;
    }


    /**
	 * 获取：积分
	 */

    public void setJifen(Integer jifen) {
        this.jifen = jifen;
    }
    /**
	 * 设置：会员等级
	 */
    public Integer getJifenTypes() {
        return jifenTypes;
    }


    /**
	 * 获取：会员等级
	 */

    public void setJifenTypes(Integer jifenTypes) {
        this.jifenTypes = jifenTypes;
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
