package com.xriamer.store.dao;

import com.xriamer.store.vo.Shopcar;

import java.util.Map;
import java.util.Set;

public interface IShopcarDAO extends IDAO<Integer, Shopcar> {
    /**
     * 数据重复增加时，应该将已有的数据进行自增
     *
     * @param mid
     * @param bid
     * @return
     * @throws Exception
     */
    public boolean doUpdateAmount(String mid, Integer bid) throws Exception;

    /**
     * 根据用户编号和商品编号，查询出购物车的信息
     *
     * @param mid
     * @param bid
     * @return
     * @throws Exception
     */
    public Shopcar findByMemberAndBooks(String mid, Integer bid) throws Exception;

    /**
     * 清除一个用户的所有购物车信息
     *
     * @param mid 用户编号
     * @return 清楚成功返回true 否则返回false
     * @throws Exception
     */
    public boolean doRemoveByMember(String mid) throws Exception;

    /**
     * 批量保存新的购物车数据
     *
     * @param vos
     * @return
     * @throws Exception
     */
    public boolean doCreateBatch(Set<Shopcar> vos) throws Exception;

    /**
     * 删除一个用户一种图书的购物车信息
     *
     * @param mid 用户编号
     * @param bid 图书编号
     * @return
     * @throws Exception
     */
    public boolean doRemoveByMemberAndGoods(String mid, Integer bid) throws Exception;

    /**
     * 一个用户购买的所有的图书信息
     *
     * @param mid 用户编号
     * @return
     * @throws Exception
     */
    public Map<Integer, Integer> findAllByMember(String mid) throws Exception;
}