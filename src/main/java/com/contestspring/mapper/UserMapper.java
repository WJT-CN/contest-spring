package com.contestspring.mapper;

import com.contestspring.entity.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.web.util.HtmlUtils;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author Author
 * @since 2021-03-28
 */
public interface UserMapper extends BaseMapper<User> {

}
