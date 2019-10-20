package com.yuu.blog.dao;

import com.yuu.blog.pojo.Options;
import org.springframework.stereotype.Repository;

/**
 * Options Mapper
 *
 * @Classname OptionsMapper
 * @Date 2019/1/9 23:51
 * @Created by Yuu
 */
@Repository
public interface OptionsMapper {

    /**
     * 获取基本信息
     *
      * @return
     */
    Options getOptions();

    /**
     * 新建信息
     *
     * @param options 信息
     */
    void insertOptions(Options options);

    /**
     * 更新信息
     *
     * @param options 信息
     */
    void updateOptions(Options options);
}
