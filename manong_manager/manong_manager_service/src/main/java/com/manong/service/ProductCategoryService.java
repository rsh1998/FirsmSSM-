package com.manong.service;

import com.manong.pojo.EasyUITree;
import com.manong.pojo.ResponseJsonResult;

import java.util.List;

/**
 * @author rsh
 * @date 2021/4/9 0:11
 */
public interface ProductCategoryService {

    List<EasyUITree> findProductCategoryListByParentId(Short parentid);
    ResponseJsonResult addCategory(Short parentid,String name);
    ResponseJsonResult deleteCategory(Short parentid,Short id);
}
