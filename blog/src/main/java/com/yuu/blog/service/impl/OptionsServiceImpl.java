package com.yuu.blog.service.impl;

import com.yuu.blog.dao.OptionsMapper;
import com.yuu.blog.pojo.Options;
import com.yuu.blog.service.OptionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Classname OptionsServiceImpl
 * @Date 2019/1/9 23:50
 * @Created by Yuu
 */
@Service
public class OptionsServiceImpl implements OptionsService {

    @Autowired
    private OptionsMapper optionsMapper;

    @Override
    public Options getOptions() {
        return optionsMapper.getOptions();
    }

    @Override
    public void save(Options options) {

        // 新建信息
        if (options.getOptionId() == null) {
            optionsMapper.insertOptions(options);
        }

        // 编辑信息
        else {
            optionsMapper.updateOptions(options);
        }
    }
}
