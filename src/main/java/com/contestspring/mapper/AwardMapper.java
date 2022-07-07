package com.contestspring.mapper;

import com.contestspring.common.dto.AwardDto;
import com.contestspring.entity.Award;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.jdbc.SQL;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author Author
 * @since 2021-04-19
 */
public interface AwardMapper extends BaseMapper<Award> {
    @Results({
            @Result(property = "cname",column = "cname"),
            @Result(property = "count",column = "count"),
            @Result(property = "awardName",column = "award_name"),
            @Result(property = "awardTeacher",column = "award_teacher"),
            @Result(property = "awardType",column = "award_type"),
            @Result(property = "college",column = "student_college")
    })
    @SelectProvider(type = AwardSqlProvider.class,method = "queryAll")
    List<AwardDto> queryAll(@Param("startDate") LocalDateTime startDate,
                            @Param("endDate") LocalDateTime endDate,
                            @Param("awardTeacher") String awardTeacher,
                            @Param("awardName") String awardName,
                            @Param("awardType") String awardType,
                            @Param("college") String college
    );
    public class AwardSqlProvider {
        public String queryAll(Map<String, Object> param) {
            return new SQL() {
                {
                    if(param.get("awardTeacher")!=null) {
                        SELECT("award_teacher");
                    }
                    if(param.get("awardName")!=null) {
                        SELECT("award_name");
                    }
                    if(param.get("awardType")!=null) {
                        SELECT("award_type");
                    }
                    if(param.get("college")!=null) {
                        SELECT("student.student_college");
                    }
                    SELECT("contestinfo.cname,count(award_student) as count");
                    FROM("award");
                    LEFT_OUTER_JOIN("contestinfo on contestinfo.cid=award.award_cid ");
                    LEFT_OUTER_JOIN("student on student.student_no=award.award_student");
                    WHERE("award_state=2");
                    if(param.get("startDate")!=null) {
                        WHERE("award_time>=#{startDate}" );
                    }
                    if(param.get("endDate")!=null) {
                        WHERE("award_time<=#{endDate}" );
                    }
                    if(param.get("awardTeacher")!=null) {
                        WHERE("award_teacher=#{awardTeacher}" );
                    }
                    if(param.get("awardName")!=null) {
                        WHERE("award_name=#{awardName}" );
                    }
                    if(param.get("awardType")!=null) {
                        WHERE("award_type=#{awardType}" );
                    }
                    if(param.get("college")!=null) {
                        WHERE("student.student_college=#{college}" );
                    }
                    GROUP_BY("contestinfo.cname");
                }
            }.toString();
        }
    }
}
