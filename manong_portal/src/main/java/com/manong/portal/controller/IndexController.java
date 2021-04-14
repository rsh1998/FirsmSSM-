package com.manong.portal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author rsh
 * @date 2021/4/14 16:24
 */
@Controller
public class IndexController {
    @RequestMapping("/home.html")
    public String index(){
        return "index";
    }
}
