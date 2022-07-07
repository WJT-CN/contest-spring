package com.contestspring.entity.excel;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.time.LocalDateTime;

@Data
public class SignQuery {

    private Integer cid;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime signTime;

    private Integer signState;

    private String guideTeacher;

    private String signTeammumber1;
}
