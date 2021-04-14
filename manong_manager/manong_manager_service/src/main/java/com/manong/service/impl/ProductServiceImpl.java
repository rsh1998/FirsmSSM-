package com.manong.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.manong.mapper.ProductMapper;
import com.manong.pojo.EasyDataGrid;
import com.manong.pojo.Product;
import com.manong.pojo.ProductExample;
import com.manong.pojo.ResponseJsonResult;
import com.manong.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author rsh
 * @date 2021/4/12 23:58
 */
@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    ProductMapper productMapper;
    @Override
    public ResponseJsonResult saveProduct(Product product) {
        product.setStatus((byte)1);
        productMapper.insert(product);
        ResponseJsonResult responseJsonResult = new ResponseJsonResult();
        responseJsonResult.setStatus(200);
        return responseJsonResult;
    }

    @Override
    public EasyDataGrid listProduct(int pages, int rows) {
        ProductExample productExample = new ProductExample();
        PageHelper.startPage(pages, rows);
        List<Product> products = productMapper.selectByExample(productExample);
        PageInfo<Product> pageInfo = new PageInfo<>(products);

        EasyDataGrid easyDataGrid = new EasyDataGrid();
        easyDataGrid.setRows(products);
        easyDataGrid.setTotal((int) pageInfo.getTotal());

        return easyDataGrid;
    }
}
