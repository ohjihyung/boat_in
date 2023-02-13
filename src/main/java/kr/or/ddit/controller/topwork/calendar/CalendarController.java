package kr.or.ddit.controller.topwork.calendar;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.controller.topwork.service.ITopWorkService;
import kr.or.ddit.vo.TopWorkVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/calendar")
public class CalendarController {
    private static Logger logger = LoggerFactory.getLogger(CalendarController.class);
    
    @Inject
    private ITopWorkService service;
    
    @GetMapping("/main")
    public String calendar() {
        return "content/calendar";
    }
    
    //수정완료
    @PostMapping(value = "/list", produces = "application/json; charset=utf-8")
    @ResponseBody
    public List<TopWorkVO> list(
            @RequestParam(name = "proNo", required = false) String proNo,
            @RequestParam(name = "memberId", required = false) String memberId) throws Exception {
        logger.info("리스트 들어옴");
        logger.info("리스트 proNo : {}", proNo);
        //logger.info("리스트 멤버아이디 : {}", memberId);
        log.debug("리스트 멤버아이디 : {}", memberId);
        
        List<TopWorkVO> list;
        if (memberId == null) {
            list = service.list(proNo); 
        } else {
            Map<String, String> map = new HashMap<>();
            map.put("proNo", proNo);
            map.put("memberId", memberId);
            
            list = service.myList(map);
        }
         
        
        return list;
    }
    
    @PostMapping(value = "/select", produces = "application/json; charset=utf-8")
    @ResponseBody
    public TopWorkVO select(@RequestBody TopWorkVO topWorkVO) throws Exception {
        TopWorkVO vo = service.select(topWorkVO);
        log.debug("파라미터는 : {}, 넘겨줄애는 : {}", topWorkVO, vo);
        
        return vo;
    }
    
    @PostMapping(value = "/insert", produces = "text/plain; charset=utf-8")
    @ResponseBody
    public String insert(@RequestBody TopWorkVO topWorkVO) throws Exception {
        logger.info("인서트 들어옴 : {}", topWorkVO);
        service.insert(topWorkVO);
        
        return "인서트 성공";
    }
    
    @PostMapping(value = "/updateMove", produces = "text/plain; charset=utf-8")
    @ResponseBody
    public String updateMove(@RequestBody TopWorkVO topWorkVO) throws Exception {
        service.updateMove(topWorkVO);
        
        return "이동 성공!";
    }
    
    @PostMapping(value = "/update", produces = "text/plain; charset=utf-8")
    @ResponseBody
    public String update(@RequestBody TopWorkVO topWorkVO) throws Exception {
        logger.debug("업데이트 데이터 : {}", topWorkVO);
        service.update(topWorkVO);
        
        return "업데이트 성공";
    }
    
    @PostMapping(value = "/delete", produces = "text/plain; charset=utf-8")
    @ResponseBody
    public String delete(@RequestBody TopWorkVO topWorkVO) throws Exception {
        logger.debug("삭제할 번호 : {}", topWorkVO.getTopWorkNo());
        service.delete(topWorkVO);
        
        return "삭제 성공";
    }
    
    @PostMapping(value = "selectCategoryColor", produces = "application/json; charset=utf-8")
    public String selectCategory(@RequestBody TopWorkVO topWorkVO) throws Exception {
        log.debug("카테고리 찾으러 온 vo : {}", topWorkVO);
        String color = service.selectCategoryColor(topWorkVO.getTwCategoryNo());
        
        return color;
    }
    
    
}
