package com.manong.portal.controller;

import com.manong.pojo.RestCategories;
import com.manong.pojo.RestProduct;
import com.manong.portal.service.CategoriesService;
import com.manong.portal.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @author rsh
 * @date 2021/4/14 16:24
 */
@Controller
public class IndexController {
    @Autowired
    CategoriesService categoriesService;
    @Autowired
    ProductService productService;

    @RequestMapping("/home.html")
    public String index(ModelMap modelMap){
        RestCategories categories = categoriesService.getCategories();
        modelMap.addAttribute("categories",categories);
        List<RestProduct> products = productService.getProducts();
        modelMap.addAttribute("products",products);
        return "product";
    }
}
