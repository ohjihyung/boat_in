package kr.or.ddit.controller.exam;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/exam")
public class SSLoginController {
    private static final Logger logger = LoggerFactory.getLogger(SSLoginController.class);
    
    @RequestMapping(value = "/start")
    public String start() {
        logger.info("start -in");
        return "/test/start";
    }
    
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ResponseEntity<Map<String, String>> loginFormAjax(String mem_id, String mem_pass, String mem_name) {
        logger.info("loginForm -in");
        logger.info("mem_id : " + mem_id);
        logger.info("mem_pass : " + mem_pass);
        logger.info("mem_name : " + mem_name);
        
        Map<String, String> map = new HashMap<String, String>();
        
        map.put("mem_id", mem_id);
        map.put("mem_pass", mem_pass);
        map.put("mem_name", mem_name);
        
        return new ResponseEntity<Map<String, String>>(map, HttpStatus.OK);
    }
}
