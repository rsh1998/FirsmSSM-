package com.manong.service;

import com.manong.pojo.EasyDataGrid;
import com.manong.pojo.Product;
import com.manong.pojo.ResponseJsonResult;

/**
 * @author rsh
 * @date 2021/4/12 23:57
 */
public interface ProductService {
    ResponseJsonResult saveProduct(Product product);
    EasyDataGrid listProduct(int pages,int rows);
}
