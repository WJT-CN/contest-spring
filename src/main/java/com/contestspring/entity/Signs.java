package com.contestspring.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 *
 * </p>
 *
 * @author Author
 * @since 2021-04-11
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Signs implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 报名编号
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 竞赛id
     */
    private Integer cid;

    /**
     * 报名日期
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime signTime;

    /**
     * 审核情况（0失败，1正在审核，2成功）
     */
    private Integer signState;

    /**
     * 指导老师
     */
    private String guideTeacher;

    /**
     * 报名人学号1，队长
     */
    private String signTeammumber1;

    /**
     * 报名人学号2
     */
    private String signTeammumber2;

    /**
     * 报名人学号3
     */
    private String signTeammumber3;

    /**
     * 报名人学号4
     */
    private String signTeammumber4;

    /**
     * 报名人学号5
     */
    private String signTeammumber5;

    /**
     * 报名人学号6
     */
    private String signTeammumber6;

    /**
     * 报名人学号7
     */
    private String signTeammumber7;

    /**
     * 报名人学号8
     */
    private String signTeammumber8;

    /**
     * 报名人学号9
     */
    private String signTeammumber9;

    /**
     * 报名人学号10
     */
    private String signTeammumber10;

    private String node;


    @TableField(exist = false)
    private List<Student> students;

    @TableField(exist = false)
    private Contestinfo contest;
}
