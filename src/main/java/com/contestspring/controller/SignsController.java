package com.contestspring.controller;


import cn.hutool.core.map.MapUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.contestspring.common.dto.ApplyDto;
import com.contestspring.common.dto.AwardDto;
import com.contestspring.common.lang.Result;
import com.contestspring.entity.*;
import com.contestspring.entity.excel.SignQuery;
import com.contestspring.mapper.SignsMapper;
import com.contestspring.service.*;
import com.contestspring.shiro.AccountProfile;
import com.contestspring.util.JwtUtils;
import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.support.HttpRequestHandlerServlet;
import sun.security.krb5.internal.ccache.CredentialsCache;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author Author
 * @since 2021-04-04
 */
@CrossOrigin
@RestController
public class SignsController {
    @Autowired
    SignsService signsService;
    @Autowired
    ContestinfoService contestinfoService;
    @Autowired
    StudentService studentService;
    @Autowired
    TeacherService teacherService;
    @Autowired
    JwtUtils jwtUtils;
    @Autowired
    SignsMapper signsMapper;
    @Autowired
    UserService userService;
    @PostMapping("/signs/addorupdate")
    public Result addorupdateSign(@RequestBody @Valid Signs signs){
        signs.setSignTime(LocalDateTime.now());
//        QueryWrapper<Signs> queryWrapper = new QueryWrapper<>();
//        queryWrapper.eq("sign_teammumber1",signs.getSignTeammumber1());
//
//        List<Signs> signsList =  signsService.list(queryWrapper);
        System.out.println(signs.getId());
        if(signs.getSignTeammumber1() == null){
            System.out.println("学号为空");
            return Result.fail("请输入学号进行报名");
        }else {
            try{
                signsService.saveOrUpdate(signs);
            }catch (Exception e){
                System.out.println("输入格式错误");
                return Result.fail("输入学号格式错误");
            }
            return Result.succ("");
        }
//        System.out.println(signs);
//        return Result.succ("成功");
    }
    @PostMapping("/signs/{size}/{page}")
    public Result allSignsPage(@PathVariable("size") int size, @PathVariable("page") int page, @RequestBody(required = false) SignQuery signQuery, HttpServletRequest request) {
        String uid = jwtUtils.getClaimByToken(request.getHeader("Authorization")).getSubject();
        User user = userService.getById(uid);
        Page<Signs> signsPage = new Page<>(page, size);
        QueryWrapper<Signs> queryWrapper = new QueryWrapper<>();
        if(user.getUsertype().equals("教师")){
            Teacher teacher = teacherService.getOne(new QueryWrapper<Teacher>().eq("teacher_no", user.getUsername()));
            queryWrapper.eq("guide_teacher",teacher.getTeacherName());
        }
        if(signQuery != null){
            Integer cid = signQuery.getCid();
            LocalDateTime signTime = signQuery.getSignTime();
            Integer signState = signQuery.getSignState();
            String guideTeacher = signQuery.getGuideTeacher();
            String signTeammumber1 = signQuery.getSignTeammumber1();
            if(!StringUtils.isEmpty(cid)){
                queryWrapper.eq("cid",cid);
            }
            if(!StringUtils.isEmpty(signTime)){
                queryWrapper.ge("sign_time",signTime);
            }
            if(!StringUtils.isEmpty(signState)){
                queryWrapper.eq("sign_state",signState);
            }
            if(!StringUtils.isEmpty(guideTeacher)){
                queryWrapper.like("guide_teacher",guideTeacher);
            }
            if(!StringUtils.isEmpty(signTeammumber1)){
                queryWrapper.eq("sign_teammumber1",signTeammumber1);
            }
        }
        queryWrapper.orderByDesc("sign_time");
        return Result.succ(signsService.page(signsPage,queryWrapper));
    }
    @GetMapping("/admin/signs/pass/{size}/{page}")
    public Result passSignsPage(@PathVariable("size") int size, @PathVariable("page") int page) {
        Page<Signs> signsPage = new Page<>(page, size);
        QueryWrapper<Signs> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("sign_state",2);
        queryWrapper.orderByDesc("sign_time");
        return Result.succ(signsService.page(signsPage,queryWrapper));
    }
    @GetMapping("/admin/signs/passed/{size}/{page}")
    public Result passSignsPageWithCidAndStd(@PathVariable("size") int size, @PathVariable("page") int page) {
        Page<Signs> signsPage = new Page<>(page, size);
        QueryWrapper<Signs> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("sign_state",2);
        queryWrapper.orderByDesc("sign_time");
        IPage<Signs> signsIPage = signsService.page(signsPage,queryWrapper);
        signsIPage.getRecords().forEach(signs -> {
            if (signs.getCid()==null){
                return;
            }
            signs.setContest(contestinfoService.getById(signs.getCid()));

            Collection<String> snoCollection = new ArrayList<>();
            if (signs.getSignTeammumber1()!=null){
                snoCollection.add(signs.getSignTeammumber1());
            }
            if (signs.getSignTeammumber2()!=null){
                snoCollection.add(signs.getSignTeammumber2());
            }
            if (signs.getSignTeammumber3()!=null){
                snoCollection.add(signs.getSignTeammumber3());
            }
            if (signs.getSignTeammumber4()!=null){
                snoCollection.add(signs.getSignTeammumber4());
            }
            if (signs.getSignTeammumber5()!=null){
                snoCollection.add(signs.getSignTeammumber5());
            }
            if (signs.getSignTeammumber6()!=null){
                snoCollection.add(signs.getSignTeammumber6());
            }
            if (signs.getSignTeammumber7()!=null){
                snoCollection.add(signs.getSignTeammumber7());
            }
            if (signs.getSignTeammumber8()!=null){
                snoCollection.add(signs.getSignTeammumber9());
            }
            if (signs.getSignTeammumber9()!=null){
                snoCollection.add(signs.getSignTeammumber9());
            }
            if (signs.getSignTeammumber10()!=null){
                snoCollection.add(signs.getSignTeammumber10());
            }
            if(snoCollection==null){
                return;
            }
            QueryWrapper<Student> studentQueryWrapper = new QueryWrapper<>();
            studentQueryWrapper.in("student_no",snoCollection);
            List<Student> students = studentService.list(studentQueryWrapper);
            signs.setStudents(students);

        });
        return Result.succ(signsIPage);
    }
    @GetMapping("/signs/{sno}")
    public Result GetSigninfobysno(@PathVariable String sno){
        QueryWrapper<Signs> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("sign_teammumber1",sno);
        List<Signs> signsList =  signsService.list(queryWrapper);
        return Result.succ(signsList);
    }
    @DeleteMapping("/signs/remove/{id}")
    public Result deleteSigns(@PathVariable("id") Long id) {
        signsService.removeById(id);
        return Result.succ("删除成功");
    }
    @PutMapping("/signs/state")
    public Result updateSignsStatus(@RequestBody @Valid Signs signs) {
        UpdateWrapper<Signs> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("id",signs.getId()).set("sign_state", signs.getSignState());
        signsService.update(updateWrapper);
        return Result.succ("报名状态更新成功");
    }

    @GetMapping("/admin/signs/analyse")
    public Result analyseSigns(@RequestParam(value = "startDate", required = false, defaultValue = "") String startDate,
                               @RequestParam(value = "endDate", required = false, defaultValue = "") String endDate,
                               @RequestParam(value = "guideTeacher", required = false, defaultValue = "") String guideTeacher) {
        if(startDate.equals("")) {
            startDate = "1999-01-01 00:00:00";
        }
        if(endDate.equals("")) {
            endDate = "2999-01-01 00:00:00";
        }
        if (guideTeacher.equals("")){
            guideTeacher=null;
        }
        DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDateTime startDateTime = null;
        LocalDateTime endDateTime = null;
        List<ApplyDto> list = null;
        try {
            startDateTime = LocalDateTime.parse(startDate,df);
            endDateTime = LocalDateTime.parse(endDate,df);
            list = signsMapper.queryPassedSigns(startDateTime,endDateTime,guideTeacher);
        }catch (ParseException e) {
            e.printStackTrace();
        }
        assert list != null;
        if (list.size()==0){
            return Result.fail("查询失败，无数据");
        }
        return Result.succ(list);
    }
}
