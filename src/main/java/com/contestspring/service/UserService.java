package com.contestspring.service;

import com.contestspring.entity.User;
import com.baomidou.mybatisplus.extension.service.IService;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.web.util.HtmlUtils;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Author
 * @since 2021-03-28
 */
public interface UserService extends IService<User> {

}
