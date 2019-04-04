package LightningProtection.controller;

import LightningProtection.pojo.ta_project;
import LightningProtection.service.ProjectService;
import common.pojo.EasyUIDataGridResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ProjectController {
    @Autowired
    private ProjectService projectService;

    @RequestMapping("/item/{id}")
    @ResponseBody
    private ta_project getProjectById(@PathVariable int id){
        ta_project taProject = projectService.getProjectById(id);
        return taProject;
    }

    @RequestMapping("/item/list")
    @ResponseBody
    public EasyUIDataGridResult getProjectList(Integer page,Integer rows){
        EasyUIDataGridResult result = projectService.getProjectList(page ,rows);
        return result;
    }
}
