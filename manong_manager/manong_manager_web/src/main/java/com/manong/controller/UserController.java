package com.manong.controller;

import com.manong.pojo.User;
import com.manong.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author rsh
 * @date 2021/4/7 23:42
 */
@Controller
public class UserController {

    @Autowired
    UserService userService;

    @RequestMapping("/user/{userid}")
    @ResponseBody
    public User  getUserById(@PathVariable Integer userid){
        User user = userService.getUserById(userid);
        return user;
    }
}
