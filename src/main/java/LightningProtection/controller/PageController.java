package LightningProtection.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.PathVariable;

/**
 * 页面跳转Controller
 */
@Controller
public class PageController {
    @RequestMapping("/")
    public String showIndex(){
        return "login";
    }
    @RequestMapping("/{page}")
    public String showPage(@PathVariable String page){
        return page;
    }
}
