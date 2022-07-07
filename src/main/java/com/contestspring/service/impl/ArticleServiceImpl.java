package com.contestspring.service.impl;

import com.contestspring.entity.Article;
import com.contestspring.mapper.ArticleMapper;
import com.contestspring.service.ArticleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 文章 服务实现类
 * </p>
 *
 * @author Author
 * @since 2021-04-20
 */
@Service
public class ArticleServiceImpl extends ServiceImpl<ArticleMapper, Article> implements ArticleService {

}
