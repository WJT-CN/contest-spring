package com.contestspring.service;

import com.contestspring.entity.Award;
import com.baomidou.mybatisplus.extension.service.IService;

import java.time.LocalDateTime;
import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Author
 * @since 2021-04-19
 */
public interface AwardService extends IService<Award> {

    List<List<String>> exportExcel(String beginTime, String endTime,Integer cid);

    List<List<String>> exportCollegeExcel(String college, String beginTime, String endTime,Integer cid);

    List<List<String>> exportMoney(String beginTime, String endTime,Integer cid);
}
