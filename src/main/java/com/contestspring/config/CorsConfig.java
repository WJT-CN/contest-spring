package com.contestspring.config;

import org.springframework.boot.SpringBootConfiguration;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.List;

/**
 * 解决跨域问题
 */
@Configuration
@EnableWebMvc
public class CorsConfig implements WebMvcConfigurer {

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
/*                .allowedOriginPatterns("*")*/
/*                .allowedMethods("GET", "HEAD", "POST", "PUT", "DELETE", "OPTIONS")*/
                .allowedOrigins("*")
                .allowedMethods("*")
                .allowCredentials(true)
                .maxAge(3600)
                .allowedHeaders("*");
    }
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/img/userAvatar/**").addResourceLocations(
                "file:" + System.getProperty("user.dir") + System.getProperty("file.separator")+"img"
        +System.getProperty("file.separator")+"userAvatar"+System.getProperty("file.separator")
        );
        registry.addResourceHandler("/award/certificate/**").addResourceLocations(
                "file:" + System.getProperty("user.dir") + System.getProperty("file.separator")+"award"
                        +System.getProperty("file.separator")+"certificate"+System.getProperty("file.separator")
        );
        registry.addResourceHandler("/award/work/**").addResourceLocations(
                "file:" + System.getProperty("user.dir") + System.getProperty("file.separator")+"award"
                        +System.getProperty("file.separator")+"work"+System.getProperty("file.separator")
        );
        registry.addResourceHandler("/file/article/img/**").addResourceLocations(
                "file:" + System.getProperty("user.dir") + System.getProperty("file.separator")+"file"
                        +System.getProperty("file.separator")+"article"+System.getProperty("file.separator")+"img"+System.getProperty("file.separator")
        );
        registry.addResourceHandler("/file/article/doc/**").addResourceLocations(
                "file:" + System.getProperty("user.dir") + System.getProperty("file.separator")+"file"
                        +System.getProperty("file.separator")+"article"+System.getProperty("file.separator")+"doc"+System.getProperty("file.separator")
        );
        registry.addResourceHandler("/file/filedownload/**").addResourceLocations(
                "file:" + System.getProperty("user.dir") + System.getProperty("file.separator")+"file"
                        +System.getProperty("file.separator")+"filedownload"+System.getProperty("file.separator")
        );
    }

}
