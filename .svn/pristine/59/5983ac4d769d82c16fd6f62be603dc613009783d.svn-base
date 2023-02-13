package kr.or.ddit.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class Kjh {
    @PostMapping(value = "/busung", produces = "text/plain; charset=utf-8")
    @ResponseBody
    public String busung(@RequestBody HashMap<String, Object> map) throws Exception {
        log.debug("부성리스트 : {}", map);
        
        //log.debug("key : {}", map.get("key"));
        //log.debug("name : {}", map.get("name"));
        List<Object> list = (List<Object>) map.get("key");
        List<Map<String, String>> myList = new ArrayList<>();
        
        for (int i = 0; i < list.size(); i++) {
            log.debug("{}번째 객체 : {}", i, list.get(i));
            //log.debug("머냐 {}", list.get(i).getClass().getName());
            LinkedHashMap<String, Object> hs = (LinkedHashMap<String, Object>) list.get(i);
            
            Map<String, String> testMap = new HashMap<String, String>();
            
            for (Map.Entry<String, Object> entry : hs.entrySet()) {
                log.debug("키값 {}, 밸류값 {}", entry.getKey(), entry.getValue());
                String key = entry.getKey();
                String value = (String) entry.getValue().toString();
                
                testMap.put(key, value);
            }
            
            //여기 for문 한바퀴당 맵 한세트씩 뽑을 수 있음.
            log.debug("제발 맵 : {}", testMap);
            log.debug("제발 맵 : {}", testMap.get("name"));
            log.debug("제발 맵 : {}", testMap.get("position"));
            log.debug("제발 맵 : {}", testMap.get("salary"));
            
        }
        
        return "z";
    }
}
