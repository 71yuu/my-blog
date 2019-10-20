package com.yuu.blog.web.controller.common;

import com.yuu.blog.common.ConstantUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * 图片上传 Controller
 *
 * @Classname UploadFileController
 * @Date 2019/1/7 16:22
 * @Created by Yuu
 */
@Controller
public class UploadFileController {


    /**
     * 富文本编辑器图片上传
     * @param file
     * @param request
     * @return
     */
    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> uploadFile (@RequestParam(value = "editormd-image-file", required = true) MultipartFile file, HttpServletRequest request) {
        Map<String, Object> result = new HashMap<>();

        // 富文本编辑器上传
        if (file != null) {
            result.put("success", 1);
            result.put("message", "图片上传成功");
            result.put("url", writeFile(file, request));
        }

        return result;
    }


    /**
     * 头像上传
     *
     * @param file
     * @param request
     * @return
     */
    @RequestMapping(value = "/uploadIcon", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> uploadIcon (@RequestParam(value = "file", required = true) MultipartFile file, HttpServletRequest request) {
        Map<String, Object> result = new HashMap<>();

        if (file != null) {
            result.put("url", writeFile(file, request));
        }

        return result;
    }



    /**
     * 将图片写入指定目录
     *
     * @param multipartFile
     * @param request
     * @return 返回文件完整路径
     */
    private String writeFile(MultipartFile multipartFile, HttpServletRequest request) {
        // 获取文件后缀
        String fileName = multipartFile.getOriginalFilename();
        String fileSuffix = fileName.substring(fileName.lastIndexOf("."));

        // 文件存放路径
        String filePath = request.getSession().getServletContext().getRealPath(ConstantUtils.UPLOAD_PATH);

        // 判断路径是否存在，不存在则创建文件夹
        File file = new File(filePath);
        if (!file.exists()) {
            file.mkdir();
        }

        // 将文件写入目标
        file = new File(filePath, UUID.randomUUID() + fileSuffix);
        try {
            multipartFile.transferTo(file);
        } catch (IOException e) {
            e.printStackTrace();
        }

        // 返回文件完整路径
        String serverPath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
        return serverPath + ConstantUtils.UPLOAD_PATH + file.getName();
    }
}
