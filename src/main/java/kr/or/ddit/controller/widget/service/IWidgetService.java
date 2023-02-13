package kr.or.ddit.controller.widget.service;

import java.util.List;

import kr.or.ddit.vo.WidgetBarVO;
import kr.or.ddit.vo.WidgetVO;

public interface IWidgetService {

    public List<WidgetVO> list() throws Exception;

    public void insertWidgetBar(WidgetBarVO widgetBarVO) throws Exception;

    public List<WidgetBarVO> myWidgetList(WidgetBarVO widgetBarVO) throws Exception;

    public void deleteWidgetBar(WidgetBarVO widgetBarVO) throws Exception;

    public void moveWidget(WidgetBarVO widgetBarVO) throws Exception;

}
