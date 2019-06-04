package LightningProtection.controller;


import LightningProtection.pojo.ta_project_kance;
import LightningProtection.service.KanceService;
import common.pojo.EasyUIDataGridResult;
import common.pojo.PLResult;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
public class KanceController {
    @Autowired
    private KanceService kanceService;

    @RequestMapping("/kance/list")
    @ResponseBody
    public EasyUIDataGridResult getKanceList(Integer page, Integer rows) {
        EasyUIDataGridResult result = kanceService.getKanceList(page, rows);
        return result;
    }

    @RequestMapping(value = "/rest/kance/delete", method = RequestMethod.POST)
    @ResponseBody
    public PLResult deleteKanceById(Long id) {
        PLResult result = kanceService.deleteKanceById(id);
        return result;
    }

    @RequestMapping(value = "/add-kance", method = RequestMethod.POST)
    @ResponseBody
    public void addKance(ta_project_kance takance) {
        kanceService.addKance(takance);
    }

    @RequestMapping(value = "/uploadFile", produces = "text/html;charset=utf-8")
    @ResponseBody
    public void importPicFile1(@RequestParam MultipartFile file1, HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        if (file1.isEmpty()) {
            map.put("result", "error");
            map.put("msg", "上传文件不能为空");
        } else {
            String originalFilename = file1.getOriginalFilename();
            String fileBaseName = FilenameUtils.getBaseName(originalFilename);
            Date now = new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String floderName = fileBaseName + "_" + df.format(now);
            try {
                //创建要上传的路径
                File fdir = new File("D:/file");
                if (!fdir.exists()) {
                    fdir.mkdirs();
                }
                //文件上传到路径下
                FileUtils.copyInputStreamToFile(file1.getInputStream(), new File(fdir, originalFilename));
                //coding
                map.put("result", "success");

            } catch (Exception e) {
                map.put("result", "error");
                map.put("msg", e.getMessage());

            }
        }
    }
}
