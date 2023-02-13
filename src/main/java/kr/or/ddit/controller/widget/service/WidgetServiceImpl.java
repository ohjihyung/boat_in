package kr.or.ddit.controller.widget.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.WidgetMapper;
import kr.or.ddit.vo.WidgetBarVO;
import kr.or.ddit.vo.WidgetVO;

@Service
public class WidgetServiceImpl implements IWidgetService {
    @Inject
    private WidgetMapper mapper;
    
    @Override
    public List<WidgetVO> list() throws Exception {
        return mapper.list();
    }

    @Override
    public void insertWidgetBar(WidgetBarVO widgetBarVO) throws Exception {
        mapper.insertWidgetBar(widgetBarVO);
    }

    @Override
    public List<WidgetBarVO> myWidgetList(WidgetBarVO widgetBarVO) throws Exception {
        return mapper.myWidgetList(widgetBarVO);
    }

    @Override
    public void deleteWidgetBar(WidgetBarVO widgetBarVO) throws Exception {
        mapper.deleteWidgetBar(widgetBarVO);
    }

    @Override
    public void moveWidget(WidgetBarVO widgetBarVO) throws Exception {
        mapper.moveWidget(widgetBarVO);
    }

}
