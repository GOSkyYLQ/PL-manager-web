package LightningProtection.controller;

import LightningProtection.pojo.ta_contract;
import LightningProtection.service.ContractService;
import common.pojo.EasyUIDataGridResult;
import common.pojo.PLResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ContractController {
    @Autowired
    private ContractService contractService;

//    @RequestMapping("/item")
//    @ResponseBody
//    public List<ta_project> getConstractByExample(){
//        List<ta_project> taConstract = contractService.getConstractByExample();
//        return taConstract;
//    }

    @RequestMapping("/contract/list")
    @ResponseBody
    public EasyUIDataGridResult getContractList(int page,int rows){
        EasyUIDataGridResult result = contractService.getContractList(page ,rows);
        return result;
    }

    @RequestMapping(value = "/rest/contract/delete",method = RequestMethod.POST)
    @ResponseBody
    public PLResult deleteConstractById(Long id){
        PLResult result = contractService.deleteContractById(id);
        return result;
    }

    @RequestMapping(value = "/add-contract",method = RequestMethod.POST)
    @ResponseBody
    public void addConstract(ta_contract taConstract){
        contractService.addContract(taConstract);
    }
}
