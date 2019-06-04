package LightningProtection.controller;

import LightningProtection.pojo.ta_project;
import LightningProtection.service.ProjectService;
import common.pojo.EasyUIDataGridResult;
import common.pojo.PLResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Controller
public class ProjectController {
    @Autowired
    private ProjectService projectService;

    @RequestMapping("/item")
    @ResponseBody
    public List<ta_project> getProjectByExample(){
        List<ta_project> taProject = projectService.getProjectByExample();
        return taProject;
    }

    @RequestMapping("/item/list")
    @ResponseBody
    public EasyUIDataGridResult getProjectList(Integer page,Integer rows){
        EasyUIDataGridResult result = projectService.getProjectList(page ,rows);
        return result;
    }

    @RequestMapping("/item/review/list")
    @ResponseBody
    public EasyUIDataGridResult getprojectList(Integer page,Integer rows){
        EasyUIDataGridResult result = projectService.getprojectList(page ,rows);
        return result;
    }

    @RequestMapping(value = "/rest/project/delete",method = RequestMethod.POST)
    @ResponseBody
    public PLResult deleteProjectById(Long id){
        PLResult result = projectService.deleteProjectById(id);
        return result;
    }

    @RequestMapping(value = "/review/OK",method = RequestMethod.POST)
    @ResponseBody
    public PLResult editproject(ta_project taProject, HttpServletRequest request){
        PLResult result = projectService.editproject(taProject);
        return result;
    }

    @RequestMapping(value = "/add-project",method = RequestMethod.POST)
    @ResponseBody
    public void addProject(ta_project taProject){
        projectService.addProject(taProject);
    }

    @RequestMapping(value = "/edit-project",method = RequestMethod.POST)
    @ResponseBody
    public void editProject(ta_project taProject, HttpServletRequest request){
        projectService.editProject(taProject);
    }
}
