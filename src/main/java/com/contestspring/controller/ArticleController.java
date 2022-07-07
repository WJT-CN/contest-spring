package com.contestspring.controller;


import cn.hutool.core.map.MapUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.contestspring.common.lang.Result;
import com.contestspring.entity.Article;
import com.contestspring.entity.Contestinfo;
import com.contestspring.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

/*
*
 * <p>
 * 文章 前端控制器
 * </p>
 *
 * @author Author
 * @since 2021-03-16


*/




@CrossOrigin
@RestController
public class ArticleController {
    @Value("${myfile.road}")
    String road;
    @Value("${file.location}")
    String location;
    @Autowired
    ArticleService articleService;
    public Result GetArticleLists(String type, String val){
        QueryWrapper<Article> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq(type,val);
        queryWrapper.orderByDesc("article_date","article_view_times");
        List<Article> articles = articleService.list(queryWrapper);
        return Result.succ(articles);
    }
    @GetMapping("/article/{type}/{size}/{page}")
    public Result typelistArticles(@PathVariable("type") String type,@PathVariable("size") int size, @PathVariable("page") int page) {
        QueryWrapper<Article> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("article_type",type);
        queryWrapper.orderByDesc("article_date");
        Page<Article> pageArticle = new Page<>(page, size);
        return Result.succ(articleService.page(pageArticle,queryWrapper));
    }
    @GetMapping("lists")
    public Result ArticleLists(){
        List<Article> articles = articleService.list();
        return Result.succ(articles);
    }
    @GetMapping("questions")
    public Result QuestionLists(){
        return GetArticleLists("article_type","常见问题");
    }
    @GetMapping("notices")
    public Result NoticeLists(){
        return GetArticleLists("article_type","竞赛公告");
    }
    @GetMapping("results")
    public Result ResultLists(){
        return GetArticleLists("article_type","竞赛成果");
    }
    @GetMapping("news")
    public Result NewLists(){
        return GetArticleLists("article_type","竞赛动态");
    }

    @PostMapping("/admin/content/article")
    public Result addorupdateArticle(@RequestBody @Valid Article article){
        article.setArticleDate(LocalDateTime.now());
        articleService.saveOrUpdate(article);
        return Result.succ("成功");
    }
    @GetMapping("/admin/article/{id}")
    public Result GetById(@PathVariable("id") Long id){

        Article article = articleService.getById(id);
        article.setArticleViewTimes(article.getArticleViewTimes()+1);
        articleService.updateById(article);
        return Result.succ(article);
    }
    @DeleteMapping("/admin/content/article/{id}")
    public Result deleteArticle(@PathVariable("id") Long id) {
        articleService.removeById(id);
        return Result.succ("删除成功");
    }

    @GetMapping("/article/{size}/{page}")
    public Result listArticles(@PathVariable("size") int size, @PathVariable("page") int page) {
        Page<Article> pageArticle = new Page<>(page, size);
        return Result.succ(articleService.page(pageArticle));
    }
    @PostMapping("/article/file/image")
    @ResponseBody
    public Object articleImgUpload(@RequestParam("file") MultipartFile file) {
        if (file.isEmpty()){
            Result.fail("上传失败");
        }
        String fileName = System.currentTimeMillis()+file.getOriginalFilename();
//        String filePath = System.getProperty("user.dir") + System.getProperty("file.separator")+"file"
//                +System.getProperty("file.separator")+"article"+System.getProperty("file.separator")+"img";
        String filePath = location+"file/article/img/";
        File imageFolder = new File(filePath);
        if(!imageFolder.exists()){
            imageFolder.mkdir();
        }
        File dest = new File(filePath+System.getProperty("file.separator")+fileName);
        String storeAvatorPath = road+"/files/file/article/img/"+fileName;
        System.out.println(MapUtil.builder()
                .put("errno", 0)
                .put("data", storeAvatorPath)
                .map());
        try {
            file.transferTo(dest);
            return MapUtil.builder()
                    .put("errno", 0)
                    .put("data", storeAvatorPath)
                    .map();
        } catch (IOException e) {
            e.printStackTrace();
            return MapUtil.builder()
                    .put("errno", 0)
                    .put("data", "error")
                    .map();
        }
    }

    @PostMapping("/article/file/doc")
    public Object articledocUpload(@RequestParam("file") MultipartFile file) {
        if (file.isEmpty()){
            Result.fail("上传失败");
        }
        String fileName = System.currentTimeMillis()+file.getOriginalFilename();
        String filePath = System.getProperty("user.dir") + System.getProperty("file.separator")+"file"
                +System.getProperty("file.separator")+"article"+System.getProperty("file.separator")+"doc";
        File imageFolder = new File(filePath);
        if(!imageFolder.exists()){
            imageFolder.mkdir();
        }
        File dest = new File(filePath+System.getProperty("file.separator")+fileName);
        String storeAvatorPath = road+"/files/file/article/doc/"+fileName;
        try {
            file.transferTo(dest);
            return Result.succ(storeAvatorPath);
        } catch (IOException e) {
            e.printStackTrace();
            return Result.fail("失败");
        }
    }
}
