package com.contestspring.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;

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
 * @since 2021-04-04
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Contestinfo implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "cid", type = IdType.AUTO)
    private Integer cid;

    /**
     * 竞赛负责人id
     */
    private String cmanager;

    /**
     * 竞赛名称
     */
    private String cname;

    /**
     * 竞赛地点
     */
    private String cplace;

    /**
     * 竞赛类别
     */
    private String kind;

    /**
     * 竞赛级别
     */
    private String level;

    /**
     * 竞赛开始时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime ctimestart;

    /**
     * 竞赛结束时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime ctimeend;

    /**
     * 竞赛介绍
     */
    private String cintroduce;

    /**
     * 竞赛报名开始时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime stimestart;

    /**
     * 竞赛报名结束时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime stimend;

    /**
     * 竞赛要求
     */
    private String srequest;

    /**
     * 竞赛主办单位
     */
    private String organizer;

    /**
     * 参赛人数
     */
    private String cpeopleno;

    /**
     * 相关通知文件
     */
    @TableField("Doc")
    private String Doc;

    /**
     * 竞赛官网
     */
    private String url;

    /**
     * 获奖申报情况(0代表不能申报；1代表可以申报)
     */
    private Boolean awardsExamine;


}
