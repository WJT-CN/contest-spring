package com.contestspring.common.dto;

import com.excel.poi.annotation.ExportField;

import lombok.Data;

import java.io.Serializable;

@Data
public class AwardDto implements Serializable {
    @ExportField(columnName = "ID", defaultCellValue = "1")
    private static final long serialVersionUID = 1L;
    @ExportField(columnName = "学生姓名")
    private String awardStudent;
    @ExportField(columnName = "获奖比赛")
    private String cname;
    @ExportField(columnName = "获奖名称")
    private String awardName;
    @ExportField(columnName = "获奖类别")
    private String awardType;
    @ExportField(columnName = "指导老师")
    private String awardTeacher;
    @ExportField(columnName = "学院")
    private String college;
    @ExportField(columnName = "人数")
    private Integer count;
}
