package com.contestspring.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.contestspring.common.lang.Result;
import com.contestspring.entity.Contestinfo;
import com.contestspring.service.ContestinfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author Author
 * @since 2021-03-12*/


@CrossOrigin
@RestController
public class ContestinfoController {
    @Value("${myfile.road}")
    String road;
    @Value("${file.location}")
    String location;
    @Autowired
    ContestinfoService contestinfoService ;
    @GetMapping("/{cid}")
    public Result test(@PathVariable("cid") Long cid) {
        Contestinfo contestinfo = contestinfoService.getById(cid);
        return Result.succ(contestinfo);
    }
    @GetMapping("/admin/contestinfo/{cid}")
    public Result GetById(@PathVariable("cid") Long cid){
        Contestinfo contestinfo = contestinfoService.getById(cid);
        return Result.succ(contestinfo);
    }
    @GetMapping("/contestinfo")
    public Result list(){
        List<Contestinfo> contestinfos = contestinfoService.list();
        List<String> nameList = contestinfos.stream().map(Contestinfo::getCname).collect(Collectors.toList());// 取出其中一列
        return Result.succ(contestinfos);
    }
    @GetMapping("/contestinfo/{size}/{page}")
    public Result allContestinfoPage(@PathVariable("size") int size, @PathVariable("page") int page) {
        Page<Contestinfo> pageContestinfo = new Page<>(page, size);
        QueryWrapper<Contestinfo> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("stimend","stimestart");
        return Result.succ(contestinfoService.page(pageContestinfo,queryWrapper));
    }
    @GetMapping("/contestinfo/{kind}/{size}/{page}")
    public Result kindPage(@PathVariable String kind ,@PathVariable("size") int size, @PathVariable("page") int page) {
        Page<Contestinfo> pageContestinfo = new Page<>(page, size);
        QueryWrapper<Contestinfo> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("kind",kind);
        queryWrapper.orderByDesc("stimend","stimestart");
        return Result.succ(contestinfoService.page(pageContestinfo,queryWrapper));
    }
    @GetMapping("/contestinfo/Applying/{size}/{page}")
    public Result ApplyingPage(@PathVariable("size") int size, @PathVariable("page") int page) {
        Page<Contestinfo> pageContestinfo = new Page<>(page, size);
        LocalDateTime nowTime = LocalDateTime.now();
        QueryWrapper<Contestinfo> queryWrapper = new QueryWrapper<>();
        queryWrapper.le("stimestart",nowTime);
        queryWrapper.ge("stimend",nowTime);
        queryWrapper.orderByDesc("stimend","stimestart");
        return Result.succ(contestinfoService.page(pageContestinfo,queryWrapper));
    }
    @PostMapping("/admin/content/contestinfo")
    public Result addorupdateContest(@RequestBody @Valid Contestinfo contestinfo){
        contestinfoService.saveOrUpdate(contestinfo);
        return Result.succ("成功");
    }
    @PutMapping("/admin/content/contestinfo/awardsExamine")
    public Result updateUserStatus(@RequestBody @Valid Contestinfo contestinfo) {
        System.out.println(contestinfo);
        System.out.println(contestinfo.getAwardsExamine());
        System.out.println(contestinfo.getCid());
        UpdateWrapper<Contestinfo> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("cid",contestinfo.getCid()).set("awards_examine", contestinfo.getAwardsExamine());
        contestinfoService.update(updateWrapper);
        return Result.succ("用户状态更新成功");
    }
    @DeleteMapping("/admin/content/contestinfo/{id}")
    public Result deleteArticle(@PathVariable("id") Long id) {
        contestinfoService.removeById(id);
        return Result.succ("删除成功");
    }

    @PostMapping("/admin/content/contestinfo/docUpload")
    public Result awardWorkUpload(@RequestParam("docfile") MultipartFile docfile) {
        if (docfile.isEmpty()){
            Result.fail("上传失败");
        }
        String fileName = System.currentTimeMillis()+docfile.getOriginalFilename();
//        String filePath = System.getProperty("user.dir") + System.getProperty("file.separator")+"file"
//                +System.getProperty("file.separator")+"article"+System.getProperty("file.separator")+"doc";
        String filePath = location+"file/article/doc/";
        File imageFolder = new File(filePath);
        if(!imageFolder.exists()){
            imageFolder.mkdir();
        }
        File dest = new File(filePath+System.getProperty("file.separator")+fileName);
        String storeAvatorPath = road+"/files/file/article/doc/"+fileName;
        try {
            docfile.transferTo(dest);
            return Result.succ(storeAvatorPath);
        } catch (IOException e) {
            e.printStackTrace();
            return Result.fail("失败");
        }
    }
    @InitBinder
    public void initBinder(WebDataBinder binder, WebRequest request) {
        //转换日期 注意这里的转化要和传进来的字符串的格式一直 如2015-9-9 就应该为yyyy-MM-dd
        DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));// CustomDateEditor为自定义日期编辑器
    }
}
