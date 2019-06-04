package LightningProtection.controller;

import LightningProtection.pojo.ta_assets;
import LightningProtection.service.AssetsService;
import common.pojo.EasyUIDataGridResult;
import common.pojo.PLResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AssetsController {
    @Autowired
    private AssetsService assetsService;

//    @RequestMapping("/item")
//    @ResponseBody
//    public List<ta_project> getConstractByExample(){
//        List<ta_project> taConstract = assetsService.getConstractByExample();
//        return taConstract;
//    }

    @RequestMapping("/assets/list")
    @ResponseBody
    public EasyUIDataGridResult getAssetsList(int page,int rows){
        EasyUIDataGridResult result = assetsService.getAssetsList(page ,rows);
        return result;
    }

    @RequestMapping(value = "/rest/assets/delete",method = RequestMethod.POST)
    @ResponseBody
    public PLResult deleteConstractById(Long id){
        PLResult result = assetsService.deleteAssetsById(id);
        return result;
    }

    @RequestMapping(value = "/add-assets",method = RequestMethod.POST)
    @ResponseBody
    public void addConstract(ta_assets taAssets){
        assetsService.addAssets(taAssets);
    }
}
