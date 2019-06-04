package LightningProtection.controller;

import LightningProtection.pojo.ta_project_design;
import LightningProtection.service.DesignService;
import common.pojo.EasyUIDataGridResult;
import common.pojo.PLResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DesignController {
    @Autowired
    private DesignService designService;

    @RequestMapping("/design/list")
    @ResponseBody
    public EasyUIDataGridResult getDesignList(Integer page, Integer rows){
        EasyUIDataGridResult result = designService.getDesignList(page ,rows);
        return result;
    }

    @RequestMapping(value = "/rest/design/delete",method = RequestMethod.POST)
    @ResponseBody
    public PLResult deleteDesignById(Long id){
        PLResult result = designService.deleteDesignById(id);
        return result;
    }

    @RequestMapping(value = "/add-design",method = RequestMethod.POST)
    @ResponseBody
    public void addDesign(ta_project_design tadesign){
        designService.addDesign(tadesign);
    }

}
