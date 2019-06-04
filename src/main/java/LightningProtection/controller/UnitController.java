package LightningProtection.controller;

import LightningProtection.pojo.ta_construction_unit;
import LightningProtection.service.ProjectService;
import LightningProtection.service.UnitService;
import common.pojo.EasyUIDataGridResult;
import common.pojo.PLResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class UnitController {
    @Autowired
    private UnitService unitService;
    private ProjectService projectService;

    @RequestMapping("/unit/{id}")
    @ResponseBody
    private ta_construction_unit getUnitById(@PathVariable int id){
        ta_construction_unit taConstructionUnit = unitService.getUnitById(id);
        return taConstructionUnit;
    }

    @RequestMapping("/unit/list")
    @ResponseBody
    public EasyUIDataGridResult getUnitList(int page ,int rows){
        EasyUIDataGridResult result = unitService.getUnitList(page,rows);
        return result;
    }

    @RequestMapping(value = "/rest/unit/delete",method = RequestMethod.POST)
    @ResponseBody
    public PLResult deleteProjectById(Long id){
        PLResult result = unitService.deleteUnitById(id);
        return result;
    }

    @RequestMapping(value = "/add-unit",method = RequestMethod.POST)
    @ResponseBody
    public void addProject(ta_construction_unit taConstructionUnit){
        unitService.addUnit(taConstructionUnit);
    }

//    @RequestMapping("/loadProject")
//    @ResponseBody
//    public List<Map<String,Object>> loadProject(HttpServletResponse response){
//        response.setContentType("text/html;charset=utf-8");
//        response.setCharacterEncoding("utf-8"); //响应编码
//        System.out.println("jsp页面加载即触发");
//
//        List<ta_project> projectList = projectService.getProjectByExample();
//        System.out.println(projectList.size());
//        List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
//        for(ta_project taProject : projectList){
//            Map<String, Object> map = new HashMap<String, Object>();
//            String pro_name = taProject.getPro_name().toString();
//            String id = taProject.getId().toString();
//            map.put("id",id);
//            map.put("pro_name",pro_name);
//            list.add(map);
//        }
//        return list;
//    }
}
