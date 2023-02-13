package kr.or.ddit.controller.widget;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.util.concurrent.Service;

import kr.or.ddit.controller.widget.service.IWidgetService;
import kr.or.ddit.vo.WidgetBarVO;
import kr.or.ddit.vo.WidgetVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/widget")
public class WidgetController {
    @Inject
    private IWidgetService service;
    
    /**
     * @return 사용할 수 있는 위젯 목록
     * @throws Exception
     */
    @GetMapping(value = "/list", produces = "application/json; charset=utf-8")
    @ResponseBody
    public List<WidgetVO> list() throws Exception {
        List<WidgetVO> list = service.list();
        
        return list;
    }
    
    /**
     * @param widgetBarVO
     * @return 
     * @throws Exception
     */
    @PostMapping(value = "/insertWidgetBar", produces = "text/plain; charset=utf-8")
    @ResponseBody
    public String insertWidgetBar(@RequestBody WidgetBarVO widgetBarVO) throws Exception {
        log.debug("위젯바 객체 : {}",widgetBarVO);
        service.insertWidgetBar(widgetBarVO);
        
        return "인서트 성공";
    }
    
    /**
     * 회원별 위젯바가 어떻게 구성됐는지 조회
     * @author 김진호
     * @param widgetBarVO 
     * @return 회원별 위젯바 구성 목록
     */
    @PostMapping(value = "/myWidgetList", produces = "application/json; charset=utf-8")
    @ResponseBody
    public List<WidgetBarVO> myWidgetList(@RequestBody WidgetBarVO widgetBarVO) throws Exception {
        log.debug("위젯리스트 조회 : {}", widgetBarVO);
        List<WidgetBarVO> myWidgetList = service.myWidgetList(widgetBarVO);
        
        return myWidgetList;
    }
    
    /**
     * 휴지통으로 이동된 위젯을 위젯바에서 삭제
     * @author 김진호
     * @param widgetBarVO 
     * @return 결과
     */
    @PostMapping(value = "/deleteWidgetBar", produces = "application/json; charset=utf-8")
    @ResponseBody
    public String deleteWidgetBar(@RequestBody WidgetBarVO widgetBarVO) throws Exception {
        log.debug("삭제할 위젯 : {}", widgetBarVO);
        service.deleteWidgetBar(widgetBarVO);
        
        return "위젯 삭제 성공";
    }
    
    /**
     * 위젯 이동시 위치값 저장
     * @param widgetBarVO
     * @throws Exception
     */
    @PostMapping(value = "/moveWidget", produces = "text/plain; charset=utf-8")
    @ResponseBody
    public String moveWidget(@RequestBody WidgetBarVO widgetBarVO) throws Exception {
        log.debug("위치 이동한 위젯바 객체 : {}", widgetBarVO);
        service.moveWidget(widgetBarVO);
        
        return "이동 성공";
    }
}
