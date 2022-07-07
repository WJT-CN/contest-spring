package com.contestspring.entity.excel;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.time.LocalDateTime;

@Data
public class AwardQuery {
    private String awardStudent;

    private String awardCid;

    private String awardName;

    private String awardTeacher;

    private Integer awardState;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime awardTime;
}
