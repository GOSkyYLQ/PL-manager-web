package LightningProtection.controller;

import LightningProtection.pojo.ta_construction_unit;
import LightningProtection.service.UnitService;
import common.pojo.EasyUIDataGridResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UnitController {
    @Autowired
    private UnitService unitService;

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
}
