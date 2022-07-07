package com.contestspring.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.contestspring.common.lang.Result;
import com.contestspring.entity.Contestinfo;
import com.contestspring.entity.Resourcesfile;
import com.contestspring.entity.User;
import com.contestspring.service.ResourcesfileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

/*
*
 * <p>
 *  前端控制器
 * </p>
 *
 * @author Author
 * @since 2021-04-20

*/


@RestController
public class ResourcesfileController {
    @Value("${myfile.road}")
    String road;
    @Value("${file.location}")
    String location;
    @Autowired
    ResourcesfileService resourcesfileService;
    @PostMapping("/file/uploadFile")
    public Result articledocUpload(HttpServletRequest request) {
        MultipartHttpServletRequest params=((MultipartHttpServletRequest) request);
        List<MultipartFile> files = ((MultipartHttpServletRequest) request).getFiles("files");
        String fileType=params.getParameter("fileType");
        Resourcesfile resourcesfile=new Resourcesfile();
        MultipartFile file = null;
        String fileName="";
        String storeAvatorPath="";
        File dest=null;
//        String filePath = System.getProperty("user.dir") + System.getProperty("file.separator")+"file"
//                +System.getProperty("file.separator")+"filedownload";
        String filePath = location+"file/filedownload/";
        File FileFolder = new File(filePath);
        if(!FileFolder.exists()){
            FileFolder.mkdir();
        }
        for (int i = 0; i < files.size(); ++i) {
            file = files.get(i);
            if (!file.isEmpty()) {
                try {
                    fileName = System.currentTimeMillis()+file.getOriginalFilename();
                    System.out.println(fileName);
                    storeAvatorPath = road+"/files/file/filedownload/"+fileName;
                    dest = new File(filePath+System.getProperty("file.separator")+fileName);
                    file.transferTo(dest);
                    resourcesfile.setFileName(fileName);
                    resourcesfile.setFilePath(storeAvatorPath);
                    resourcesfile.setFileType(fileType);
                    resourcesfile.setFileTime(LocalDateTime.now());
                    boolean flag = resourcesfileService.save(resourcesfile);
                    if (flag){
                        System.out.println("存储成功");
                    } else {
                        System.out.println("存储失败");
                    }
                } catch (Exception e) {
                    return Result.succ("You failed to upload " + i + " => "
                            + e.getMessage());
                }
            } else {
                return Result.fail("You failed to upload " + i
                        + " because the file was empty.");
            }
        }
        return Result.succ("upload successful");
    }

    @GetMapping("/file/lists")
    public Result getfileList(){
        resourcesfileService.list();
        return Result.succ(resourcesfileService.list());
    }
    @GetMapping("/file/lists/{type}")
    public Result getfileListBytype(@PathVariable("type") String type){
        QueryWrapper<Resourcesfile> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("file_type",type);
        List<Resourcesfile> resourcesfileList = resourcesfileService.list(queryWrapper);
        return Result.succ(resourcesfileList);
    }
    @GetMapping("/filePage/{size}/{page}")
    public Result allContestinfoPage(@PathVariable("size") int size, @PathVariable("page") int page) {
        Page<Resourcesfile> resourcesfilePage = new Page<>(page, size);
        QueryWrapper<Resourcesfile> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("file_time");
        return Result.succ(resourcesfileService.page(resourcesfilePage,queryWrapper));
    }
    @DeleteMapping("/file/remove/{id}")
    public Result deleteArticle(@PathVariable("id") Long id) {
        resourcesfileService.removeById(id);
        return Result.succ("删除成功");
    }
}
