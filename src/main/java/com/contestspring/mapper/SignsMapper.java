package com.contestspring.mapper;

import com.contestspring.common.dto.ApplyDto;
import com.contestspring.entity.Signs;
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
 * @since 2021-04-11
 */
public interface SignsMapper extends BaseMapper<Signs> {

    @Results({
            @Result(property = "cname",column = "cname"),
            @Result(property = "count",column = "count"),
            @Result(property = "guideTeacher",column = "award_teacher")
    })
    @SelectProvider(type = SignsSqlProvider.class,method = "queryPassedSigns")
    List<ApplyDto> queryPassedSigns(@Param("startDate") LocalDateTime startDate,
                                    @Param("endDate") LocalDateTime endDate,
                                    @Param("guideTeacher") String guideTeacher);


    public class SignsSqlProvider{
        public String queryPassedSigns(Map<String,Object> param){
            return new SQL(){
                {
                    if(param.get("guideTeacher")!=null) {
                        SELECT("guide_teacher");
                    }
                    SELECT("contestinfo.cname,count(*) as count");
                    FROM("signs");
                    LEFT_OUTER_JOIN("contestinfo on contestinfo.cid=signs.cid");
                    WHERE("sign_state=2");
                    if(param.get("startDate")!=null) {
                        WHERE("sign_time>=#{startDate}" );
                    }
                    if(param.get("endDate")!=null) {
                        WHERE("sign_time<=#{endDate}" );
                    }
                    if(param.get("guideTeacher")!=null) {
                        WHERE("guide_teacher=#{guideTeacher}" );
                    }
                    GROUP_BY("contestinfo.cname");
                }
            }.toString();
        }
    }
}
