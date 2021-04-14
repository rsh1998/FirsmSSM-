package com.manong.pojo;

import java.util.List;

/**
 * @author rsh
 * @date 2021/4/13 22:05
 */
public class EasyDataGrid {

    private int total;
    private List<?> rows;

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public List<?> getRows() {
        return rows;
    }

    public void setRows(List<?> rows) {
        this.rows = rows;
    }
}