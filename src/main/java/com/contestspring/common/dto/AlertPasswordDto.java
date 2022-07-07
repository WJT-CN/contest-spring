package com.contestspring.common.dto;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;

@Data
public class AlertPasswordDto implements Serializable {
    @NotBlank(message = "昵称不能为空")
    private String username;

    @NotBlank(message = "旧密码不能为空")
    private String oldpassword;

    @NotBlank(message = "新密码不能为空")
    private String password;
}
