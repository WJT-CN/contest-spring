package com.contestspring.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 学生表模板
 * </p>
 *
 * @author Author
 * @since 2021-04-04
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Student implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 学生学号，要唯一，不能重复
     */
    private String studentNo;

    /**
     * 学生姓名
     */
    private String studentName;

    /**
     * 学生性别，如：男/女/未知
     */
    private String studentSex;

    /**
     * 学院
     */
    private String studentCollege;

    /**
     * 专业
     */
    private String studentMajor;

    /**
     * 班级
     */
    private String studentClasses;

    /**
     * 邮箱
     */
    private String studentEmail;

    /**
     * 手机号
     */
    private String studentPhone;

    //身份证号
    private String studentCard;

    //银行卡
    private String studentBank;


}
