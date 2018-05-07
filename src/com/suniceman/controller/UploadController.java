package com.suniceman.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/upload")
public class UploadController {
    
    @ResponseBody
    @RequestMapping("/image")
    public Object image(MultipartFile file) throws IllegalStateException, IOException {
        String fileName = UUID.randomUUID()
                + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
        String pathPicture = "/home/cdn/" + fileName;
        File filePicture = new File(pathPicture);
        file.transferTo(filePicture);
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("code", 0);
        data.put("msg", "");
        Map<String, String> link = new HashMap<String, String>();
        link.put("src", "/cdn/" + fileName);
        data.put("data", link);
        return data;
    }
    
    @ResponseBody
    @RequestMapping("/file")
    public Object file(MultipartFile file) throws IllegalStateException, IOException {
        String fileName = UUID.randomUUID()
                + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
        String pathPicture = "/home/cdn/" + fileName;
        File filePicture = new File(pathPicture);
        file.transferTo(filePicture);
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("code", 0);
        data.put("msg", "");
        Map<String, String> link = new HashMap<String, String>();
        link.put("src", "/cdn/" + fileName);
        link.put("name", file.getOriginalFilename());
        data.put("data", link);
        return data;
    }
}
