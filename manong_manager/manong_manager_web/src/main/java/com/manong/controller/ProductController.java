package com.manong.controller;

import com.manong.pojo.EasyDataGrid;
import com.manong.pojo.Product;
import com.manong.pojo.ResponseJsonResult;
import com.manong.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author rsh
 * @date 2021/4/8 22:21
 * 商品管理控制层
 */
@Controller
public class ProductController {
    @Autowired
    ProductService productService;

    @RequestMapping("/product/list")
    @ResponseBody
    public EasyDataGrid listProduct(@RequestParam(value="page",defaultValue = "1") int page,
                              @RequestParam(value = "rows",defaultValue = "10")int rows){
        EasyDataGrid easyDataGrid = productService.listProduct(page, rows);
        return easyDataGrid;
    }

    @RequestMapping("product_save")
    @ResponseBody
    public ResponseJsonResult saveProduct(Product product){
        ResponseJsonResult responseJsonResult = productService.saveProduct(product);
        return responseJsonResult;
    }
}
