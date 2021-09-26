package com.manong.portal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author rsh
 * @date 2021/4/11 14:34
 */
@Controller
public class FreemarkerTest {
    @RequestMapping("/hi")
    public String sayHi(Model model){
        model.addAttribute("name","rsh");
        return "hi";
    }
    @RequestMapping("/hello")
    public String sayHello(Model model){
        model.addAttribute("name","rsh");
        return "hello.ftl";
    }

}
