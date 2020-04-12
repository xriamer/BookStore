package com.xriamer.store.dao;

import com.xriamer.store.vo.Books;

import java.util.List;
import java.util.Set;

public interface IBooksDAO extends IDAO<Integer, Books> {
    public List<Books> findAllByStatus(Integer status, Integer currentPage, Integer lineSize, String column, String keyWord) throws Exception;

    public Integer getAllCountByStatus(Integer status, String column, String keyWord) throws Exception;

    public boolean doUpdateStatus(Set<Integer> id, Integer status) throws Exception;

    public Set<String> findAllByPhoto(Set<Integer> id) throws Exception;

    /**
     * 根据图书的分类与状态进行图书的列表显示
     *
     * @param iid         图书的所属类型
     * @param status      图书的当前状态
     * @param currentPage
     * @param lineSize
     * @param column
     * @param keyWord
     * @return
     * @throws Exception
     */
    public List<Books> findAllByItem(Integer iid, Integer status, Integer currentPage, Integer lineSize, String column, String keyWord) throws Exception;

    public Integer getAllCountByItem(Integer iid, Integer status, String column, String keyWord) throws Exception;

}