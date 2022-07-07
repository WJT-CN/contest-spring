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
 * @since 2021-04-19
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Award implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 唯一标识
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 申报学生学号
     */
    private String awardStudent;

    /**
     * 获奖比赛编号id
     */
    private String awardCid;

    /**
     * 获得奖项（一等奖，二等奖）
     */
    private String awardName;

    /**
     * 奖状
     */
    private String awardCertificate;

    /**
     * 相关作品文件
     */
    private String awardFile;

    private String awardAcceptance;

    /**
     * 指导老师姓名
     */
    private String awardTeacher;

    /**
     * 获奖类型（个人，团队）
     */
    private String awardType;

    /**
     * 申报情况（0失败，1审核中，2成功）
     */
    private Integer awardState;

    /**
     * 申报时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime awardTime;

}
