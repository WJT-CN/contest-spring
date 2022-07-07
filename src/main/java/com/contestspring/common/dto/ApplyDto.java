package com.contestspring.common.dto;

import lombok.Data;

import java.io.Serializable;

@Data
public class ApplyDto implements Serializable {
    private static final long serialVersionUID = 1L;
    private String cname;
    private String guideTeacher;
    private Integer count;
}
