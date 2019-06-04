package LightningProtection.controller;

import LightningProtection.pojo.ta_project_place;
import LightningProtection.service.ProjectService;
import LightningProtection.service.PlaceService;
import common.pojo.EasyUIDataGridResult;
import common.pojo.PLResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class PlaceController {
    @Autowired
    private PlaceService placeService;
    private ProjectService projectService;

    @RequestMapping("/place/{id}")
    @ResponseBody
    private ta_project_place getPlaceById(@PathVariable int id){
        ta_project_place taConstructionPlace = placeService.getPlaceById(id);
        return taConstructionPlace;
    }

    @RequestMapping("/place/list")
    @ResponseBody
    public EasyUIDataGridResult getPlaceList(int page ,int rows){
        EasyUIDataGridResult result = placeService.getPlaceList(page,rows);
        return result;
    }

    @RequestMapping(value = "/rest/place/delete",method = RequestMethod.POST)
    @ResponseBody
    public PLResult deleteProjectById(Long id){
        PLResult result = placeService.deletePlaceById(id);
        return result;
    }

    @RequestMapping(value = "/add-place",method = RequestMethod.POST)
    @ResponseBody
    public void addProject(ta_project_place taConstructionPlace){
        placeService.addPlace(taConstructionPlace);
    }
    
}
