package com.contestspring.entity.excel;

import com.alibaba.excel.annotation.ExcelProperty;
import lombok.Data;

@Data
public class TeacherData {
    @ExcelProperty(index = 0)
    private String teacherNo;
    @ExcelProperty(index = 1)
    private String teacherName;
    @ExcelProperty(index = 2)
    private String teacherSex;
    @ExcelProperty(index = 3)
    private String teacherCollege;
    @ExcelProperty(index = 4)
    private String teacherEducation;
    @ExcelProperty(index = 5)
    private String teacherEmail;
    @ExcelProperty(index = 6)
    private String teacherPhone;
    @ExcelProperty(index = 7)
    private String teacherSkill;
}
