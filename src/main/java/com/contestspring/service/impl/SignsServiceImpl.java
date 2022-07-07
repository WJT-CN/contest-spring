package com.contestspring.service.impl;

import com.contestspring.entity.Signs;
import com.contestspring.mapper.SignsMapper;
import com.contestspring.service.SignsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Author
 * @since 2021-04-11
 */
@Service
public class SignsServiceImpl extends ServiceImpl<SignsMapper, Signs> implements SignsService {

}
