package com.contestspring.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 教师表
 * </p>
 *
 * @author Author
 * @since 2021-04-28
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Teacher implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 教师工号，要唯一，不能重复
     */
    private String teacherNo;

    /**
     * 教师姓名
     */
    private String teacherName;

    /**
     * 教师性别，如：男/女/未知
     */
    private String teacherSex;

    /**
     * 教师所属学院
     */
    private String teacherCollege;

    /**
     * 教师学历
     */
    private String teacherEducation;

    /**
     * 教师邮箱
     */
    private String teacherEmail;

    /**
     * 教师电话
     */
    private String teacherPhone;

    /**
     * 教师研究方向
     */
    private String teacherSkill;


}
