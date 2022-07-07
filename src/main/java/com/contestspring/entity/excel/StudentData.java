package com.contestspring.entity.excel;


import com.alibaba.excel.annotation.ExcelProperty;
import lombok.Data;

@Data
public class StudentData {
    @ExcelProperty(index = 0)
    private String studentNo;
    @ExcelProperty(index = 1)
    private String studentName;
    @ExcelProperty(index = 2)
    private String studentSex;
    @ExcelProperty(index = 3)
    private String studentCollege;
    @ExcelProperty(index = 4)
    private String studentMajor;
    @ExcelProperty(index = 5)
    private String studentClasses;
    @ExcelProperty(index = 6)
    private String studentEmail;
    @ExcelProperty(index = 7)
    private String studentPhone;
    @ExcelProperty(index = 8)
    private String studentCard;
    @ExcelProperty(index = 9)
    private String studentBank;
}
