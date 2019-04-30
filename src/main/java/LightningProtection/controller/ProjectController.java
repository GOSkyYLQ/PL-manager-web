package LightningProtection.controller;

import LightningProtection.pojo.ta_project;
import LightningProtection.service.ProjectService;
import common.pojo.EasyUIDataGridResult;
import common.pojo.PLResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;



@Controller
public class ProjectController {
    @Autowired
    private ProjectService projectService;

    @RequestMapping("/item/{pro_name}")
    @ResponseBody
    public ta_project getProjectByExample(@PathVariable String pro_name){
        ta_project taProject = projectService.getProjectByExample(pro_name);
        return taProject;
    }

    @RequestMapping("/item/list")
    @ResponseBody
    public EasyUIDataGridResult getProjectList(Integer page,Integer rows){
        EasyUIDataGridResult result = projectService.getProjectList(page ,rows);
        return result;
    }

    @RequestMapping(value = "/rest/item/delete",method = RequestMethod.POST)
    @ResponseBody
    public PLResult deleteProjectById(Long id){
        PLResult result = projectService.deleteProjectById(id);
        return result;
    }

    @RequestMapping(value = "/add-project",method = RequestMethod.POST)
    @ResponseBody
    public void addProject(ta_project taProject){
        projectService.addProject(taProject);
    }
}
