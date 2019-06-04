package LightningProtection.controller;

import LightningProtection.pojo.ta_project_build;
import LightningProtection.service.BuildService;
import common.pojo.EasyUIDataGridResult;
import common.pojo.PLResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BuildController {
    @Autowired
    private BuildService buildService;

    @RequestMapping("/build/list")
    @ResponseBody
    public EasyUIDataGridResult getBuildList(Integer page, Integer rows){
        EasyUIDataGridResult result = buildService.getBuildList(page ,rows);
        return result;
    }

    @RequestMapping(value = "/rest/build/delete",method = RequestMethod.POST)
    @ResponseBody
    public PLResult deleteBuildById(Long id){
        PLResult result = buildService.deleteBuildById(id);
        return result;
    }

    @RequestMapping(value = "/add-build",method = RequestMethod.POST)
    @ResponseBody
    public void addBuild(ta_project_build tabuild){
        buildService.addBuild(tabuild);
    }

}
