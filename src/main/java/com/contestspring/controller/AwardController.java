package com.contestspring.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.contestspring.common.dto.ApplyDto;
import com.contestspring.common.dto.AwardDto;
import com.contestspring.common.dto.StudentDto;
import com.contestspring.common.lang.Result;
import com.contestspring.entity.*;
import com.contestspring.entity.excel.AwardQuery;
import com.contestspring.mapper.AwardMapper;
import com.contestspring.service.AwardService;
import com.contestspring.service.ContestinfoService;
import com.contestspring.service.TeacherService;
import com.contestspring.service.UserService;
import com.contestspring.util.ExcelUtil;
import com.contestspring.util.JwtUtils;
import com.excel.poi.ExcelBoot;
import com.excel.poi.entity.ErrorEntity;
import com.excel.poi.function.ImportFunction;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author Author
 * @since 2021-04-11
 */
@RestController
public class AwardController {
    @Value("${myfile.road}")
    String road;
    @Value("${file.location}")
    String location;
    @Autowired
    AwardService awardService;
    @Autowired
    AwardMapper awardMapper;
    @Autowired
    JwtUtils jwtUtils;
    @Autowired
    UserService userService;
    @Autowired
    TeacherService teacherService;
    @Autowired
    ContestinfoService contestinfoService;
    @PostMapping("/getaward/{size}/{page}")
    public Result getAwardPage(@PathVariable("size") int size, @PathVariable("page") int page, @RequestBody(required = false) AwardQuery awardQuery, HttpServletRequest request) {
//        String uid = jwtUtils.getClaimByToken(request.getHeader("Authorization")).getSubject();
//        User user = userService.getById(uid);
        Page<Award> awardPage = new Page<>(page, size);
        QueryWrapper<Award> queryWrapper = new QueryWrapper<>();
//        if(user.getUsertype().equals("教师")){
//            Teacher teacher = teacherService.getOne(new QueryWrapper<Teacher>().eq("teacher_no", user.getUsername()));
//            queryWrapper.eq("award_teacher",teacher.getTeacherName());
//        }
        if(awardQuery != null){
            String awardStudent = awardQuery.getAwardStudent();
            String awardCid = awardQuery.getAwardCid();
            String awardName = awardQuery.getAwardName();
            String awardTeacher = awardQuery.getAwardTeacher();
            Integer awardState = awardQuery.getAwardState();
            LocalDateTime awardTime = awardQuery.getAwardTime();
            if(!StringUtils.isEmpty(awardStudent)){
                queryWrapper.eq("award_student",awardStudent);
            }
            if(!StringUtils.isEmpty(awardCid)){
                queryWrapper.eq("award_cid",awardCid);
            }
            if(!StringUtils.isEmpty(awardName)){
                queryWrapper.eq("award_name",awardName);
            }
            if(!StringUtils.isEmpty(awardTeacher)){
                queryWrapper.like("award_teacher",awardTeacher);
            }
            if(!StringUtils.isEmpty(awardState)){
                queryWrapper.eq("award_state",awardState);
            }
            if(!StringUtils.isEmpty(awardTime)){
                queryWrapper.ge("award_time",awardTime);
            }
        }
        queryWrapper.orderByDesc("award_time");
        return Result.succ(awardService.page(awardPage,queryWrapper));
    }

    @GetMapping("/admin/award/pass/{size}/{page}")
    public Result getPassAwardPage(@PathVariable("size") int size, @PathVariable("page") int page) {
        Page<Award> awardPage = new Page<>(page, size);
        QueryWrapper<Award> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("award_state",2);
        queryWrapper.orderByDesc("award_time");
        return Result.succ(awardService.page(awardPage,queryWrapper));
    }
    @GetMapping("/award/{sno}")
    public Result getAwardByStudent(@PathVariable String sno){
        QueryWrapper<Award> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("award_student",sno);
        List<Award> awardList =  awardService.list(queryWrapper);
        return Result.succ(awardList);
    }
    @DeleteMapping("/award/remove/{id}")
    public Result deleteArticle(@PathVariable("id") Long id) {
        awardService.removeById(id);
        return Result.succ("删除成功");
    }
    @PutMapping("/award/state")
    public Result updateSignsStatus(@RequestBody @Valid Award award) {
        UpdateWrapper<Award> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("id",award.getId()).set("award_state", award.getAwardState());
        awardService.update(updateWrapper);
        return Result.succ("奖项申报状态更新成功");
    }
    @PostMapping("/award/addorupdate")
    public Result addorupdateaward(@RequestBody @Valid Award award){
        award.setAwardTime(LocalDateTime.now());
        awardService.saveOrUpdate(award);
        return Result.succ("成功");
    }
    @PostMapping("/award/certificate")
    public Result awardCertificateUpload(@RequestParam("awardfile") MultipartFile awardfile) {
        if (awardfile.isEmpty()){
            Result.fail("上传失败");
        }
        String fileName = System.currentTimeMillis()+awardfile.getOriginalFilename();
//        String filePath = System.getProperty("user.dir") + System.getProperty("file.separator")+"award"
//                +System.getProperty("file.separator")+"certificate";
        String filePath = location+"award/certificate/";
        File imageFolder = new File(filePath);
        if(!imageFolder.exists()){
            imageFolder.mkdir();
        }
        File dest = new File(filePath+System.getProperty("file.separator")+fileName);
        String storeAvatorPath = road+"/files/award/certificate/"+fileName;
        try {
            awardfile.transferTo(dest);
            return Result.succ(storeAvatorPath);
        } catch (IOException e) {
            e.printStackTrace();
            return Result.fail("");
        }
    }
    @PostMapping("/award/workupload")
    public Result awardWorkUpload(@RequestParam("awardfile") MultipartFile awardfile) {
        if (awardfile.isEmpty()){
            Result.fail("上传失败");
        }
        String fileName = System.currentTimeMillis()+awardfile.getOriginalFilename();
//        String filePath = System.getProperty("user.dir") + System.getProperty("file.separator")+"award"
//                +System.getProperty("file.separator")+"work";
        String filePath = location+"award/work/";
        File imageFolder = new File(filePath);
        if(!imageFolder.exists()){
            imageFolder.mkdir();
        }
        File dest = new File(filePath+System.getProperty("file.separator")+fileName);
        String storeAvatorPath = road+"/files/award/work/"+fileName;
        try {
            awardfile.transferTo(dest);
            return Result.succ(storeAvatorPath);
        } catch (IOException e) {
            e.printStackTrace();
            return Result.fail("");
        }
    }

    @PostMapping("/award/acceptanceUpload")
    public Result acceptanceUpload(@RequestParam("awardfile") MultipartFile awardfile) {
        if (awardfile.isEmpty()){
            Result.fail("上传失败");
        }
        String fileName = System.currentTimeMillis()+awardfile.getOriginalFilename();
//        String filePath = System.getProperty("user.dir") + System.getProperty("file.separator")+"award"
//                +System.getProperty("file.separator")+"work";
        String filePath = location+"award/acceptance/";
        File imageFolder = new File(filePath);
        if(!imageFolder.exists()){
            imageFolder.mkdirs();
        }
        File dest = new File(filePath+System.getProperty("file.separator")+fileName);
        String storeAvatorPath = road+"/files/award/acceptance/"+fileName;
        try {
            awardfile.transferTo(dest);
            return Result.succ(storeAvatorPath);
        } catch (IOException e) {
            e.printStackTrace();
            return Result.fail("");
        }
    }

    @GetMapping("/admin/award/analyse")
    public Result analyseSigns(@RequestParam(value = "startDate", required = false, defaultValue = "") String startDate,
                               @RequestParam(value = "endDate", required = false, defaultValue = "") String endDate,
                               @RequestParam(value = "awardTeacher", required = false, defaultValue = "") String awardTeacher,
                               @RequestParam(value = "awardName", required = false, defaultValue = "") String awardName,
                               @RequestParam(value = "awardType", required = false, defaultValue = "") String awardType,
                               @RequestParam(value = "college", required = false, defaultValue = "") String college) {
        if(startDate.equals("")) {
            startDate = "1999-01-01 00:00:00";
        }
        if(endDate.equals("")) {
            endDate = "2999-01-01 00:00:00";
        }
        if (awardTeacher.equals("")){
            awardTeacher=null;
        }
        if (awardName.equals("")){
            awardName=null;
        }
        if (awardType.equals("")){
            awardType=null;
        }
        if (college.equals("")){
            college=null;
        }
        DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDateTime startDateTime = null;
        LocalDateTime endDateTime = null;
        List<AwardDto> list = null;
        try {
            startDateTime = LocalDateTime.parse(startDate,df);
            endDateTime = LocalDateTime.parse(endDate,df);
            list = awardMapper.queryAll(startDateTime,endDateTime,awardTeacher,awardName,awardType,college);
            for(int i=0;i < list.size();i++){
                System.out.println(list.get(i));
            }
        }catch (ParseException e) {
            e.printStackTrace();
        }
        if (list.size()==0){
            return Result.fail("查询失败，无数据");
        }
        return Result.succ(list);
    }

    @RequestMapping("/admin/award/importExcel")
    public void importExcel() throws IOException {
        ExcelBoot.ImportBuilder(new FileInputStream(new File("C:\\Users\\导入Excel文件.xlsx")),  AwardDto.class)
                .importExcel(new ImportFunction<AwardDto>() {
                    /**
                     * @param sheetIndex 当前执行的Sheet的索引, 从1开始
                     * @param rowIndex 当前执行的行数, 从1开始
                     * @param userEntity Excel行数据的实体
                     */
                    @Override
                    public void onProcess(int sheetIndex,  int rowIndex,  AwardDto userEntity) {
                        //对每条数据自定义校验以及操作
                        //分页插入：当读取行数到达用户自定义条数执行插入数据库操作
                    }

                    /**
                     * @param errorEntity 错误信息实体
                     */
                    @Override
                    public void onError(ErrorEntity errorEntity) {
                        //操作每条数据非空和正则校验后的错误信息
                    }
                });
    }

    //惠州学院学科竞赛统计表
    @RequestMapping("exportSchoolExcel")
    public void exportSchoolExcel( HttpServletResponse response,String beginTime,String endTime,Integer cid){
        List<String> titleList = Arrays.asList("序号","院别", "级别", "学科竞赛名称", "获奖作品名称","参赛队员","指导教师",
                "奖项等级","比赛时间","备注1（教研分）","备注2（等级）");
        List<List<String>> dataList = awardService.exportExcel(beginTime,endTime,cid);
        Contestinfo a = contestinfoService.getById(cid);
        ExcelUtil.uploadExcelAboutUser(response,a.getCname()+"惠州学院学科竞赛统计表.xlsx",titleList,dataList);
    }

    //学生学科竞赛获奖情况登记表
    @RequestMapping("exportCollegeExcel")
    public void exportCollegeExcel( HttpServletResponse response,String college,String beginTime,String endTime,Integer cid){
        List<String> titleList = Arrays.asList("序号","奖项名称", "姓名1", "班级1", "姓名2", "班级2", "姓名3", "班级3", "姓名4", "班级4",
                "姓名5", "班级5", "学院", "指导老师","获奖等级","主办（授奖）单位","获奖时间");
        List<List<String>> dataList = awardService.exportCollegeExcel(college,beginTime,endTime,cid);
        Contestinfo a = contestinfoService.getById(cid);
        ExcelUtil.uploadExcelAboutUser(response,college+a.getCname()+"学生学科竞赛获奖情况登记表.xlsx",titleList,dataList);
    }

    //惠州学院奖助基金发放汇总表
    //http://localhost:8088/exportSchoolExcel?beginTime=2021-04-01&endTime=2021-04-21&cid=3
    @RequestMapping("exportMoney")
    public void exportMoney( HttpServletResponse response,String beginTime,String endTime,Integer cid){
        List<String> titleList = Arrays.asList("序号","学号", "姓名", "身份证号码", "金额（元）", "本人建行卡号", "联系电话", "签名", "备注");
        List<List<String>> dataList = awardService.exportMoney(beginTime,endTime,cid);
        Contestinfo a = contestinfoService.getById(cid);
        ExcelUtil.uploadExcelAboutUser(response,a.getCname()+"惠州学院奖助基金发放汇总表.xlsx",titleList,dataList);
    }
}
