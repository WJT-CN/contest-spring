package com.contestspring.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.contestspring.common.lang.Result;
import com.contestspring.entity.Cam;
import com.contestspring.service.CamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author Author
 * @since 2021-03-26
 */
@RestController
public class CamController {
    @Autowired
    CamService camService;
    @GetMapping("CAMS")
    public Result GetCAM(){
        List<Cam> cams = camService.list();
        return Result.succ(cams);
    }
    @RequestMapping("/colleges")
    public Result GetCollegeList(){
        List<Cam> cams = camService.list();
        List<String> collegeList = cams.stream().map(Cam::getCollege).collect(Collectors.toList());// 取出其中一列
        collegeList=collegeList.stream()
                .distinct()
                .collect(Collectors.toList());
        return Result.succ(collegeList);
    }
    @RequestMapping("/major")
    public Result GetMajorByCollege(String college){
        System.out.println(college);
        System.out.println(college.getClass().toString());
        QueryWrapper<Cam> wrapper = new QueryWrapper<>();
        List<Cam> cams = camService.list(wrapper.eq("college", college));
        cams.forEach(System.out::println);
        return Result.succ(cams);
    }

    @RequestMapping("/majors")
    public Result Getmajors(){
        List<Cam> cams = camService.list();
        List<String> collegeList = cams.stream().map(Cam::getMajor).collect(Collectors.toList());// 取出其中一列
/*        collegeList=collegeList.stream()
                .distinct()
                .collect(Collectors.toList());*/
        return Result.succ(collegeList);
    }
}
