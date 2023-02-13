package kr.or.ddit.controller.myhome;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javassist.expr.NewArray;
import kr.or.ddit.controller.member.service.IMemberService;
import kr.or.ddit.controller.myhome.service.IMyhomeService;
import kr.or.ddit.controller.oneoone.service.IQnaService;
import kr.or.ddit.controller.project.service.IProjectService;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MyhomeVO;
import kr.or.ddit.vo.NewsVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.QnAVO;
import kr.or.ddit.vo.TopWorkVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/myhome")
public class MyhomeController {
	
	@Inject
    private IProjectService projectService;
	
	@Inject
	private IMyhomeService myhomeService;
	
	@Inject
	private IMemberService memberService;
	
	@Inject
	IQnaService qnaService;

	@GetMapping("/home")
	public String myHome() {
		return "content/myhome";
	}
	
	@GetMapping(value = "/crawlingNews" ,produces = "application/json;charset=utf-8")
	@ResponseBody
	public Map<String, List<NewsVO>> startCrawl() throws IOException {
		
		List<NewsVO> selectOneNews = new ArrayList<NewsVO>();
		Map<String, List<NewsVO>> resultMap = new HashMap<String, List<NewsVO>>();
		
		// 기사제목, 링크, 시간, 이미지경로
		// Map<String, List<VO>> resultMap = new HashMap<String, VO>();
		
		String url = "https://www.mk.co.kr/news/it/internet/";
		Document doc = Jsoup.connect(url).get();
		
		Elements element = doc.select("ul#list_area");
		
		//이미지 src는 jsp에 가져가서 쪼개기
		for(Element el : element.select("li.news_node")) {
			
			if(el.html().startsWith("<a")) {
			
				NewsVO newsVO = new NewsVO();
				
				Elements titleEle = el.select("h3.news_ttl");
				String title = titleEle.text();
//				log.debug(title);
				newsVO.setNewsTitle(title);
				
				Elements newsLinkEle = el.select("a");
				String link = newsLinkEle.attr("href");
//				log.debug(link);
				newsVO.setNewsLink(link);
				
				Elements timeEle = el.select("div.info_group > p");
				String time = timeEle.text();
//				log.debug(time);
				newsVO.setNewsTime(time);
				
				Elements imgEle = el.select("div.thumb_area > img");
				if(!imgEle.isEmpty()) {
					String imgSrc = imgEle.attr("data-src");
//					log.debug(imgSrc);
					newsVO.setNewsImgSrc(imgSrc);
				}else {
					newsVO.setNewsImgSrc("/resources/profileImg/newsNoImage.jpg");
//					log.debug("해당 글은 이미지 없음");
				}
				selectOneNews.add(newsVO);
			}//if문 끝
			
		}//for문끝
		
//		for (int i = 0; i < selectOneNews.size(); i++) {
//			log.debug("뉴스:" + selectOneNews.get(i));
//		}
		
		resultMap.put("newsList", selectOneNews);
		
		return resultMap; 
	}
	
	@PostMapping(value = "/projectList", produces = "application/json; charset=utf-8")
	@ResponseBody
    public List<ProjectVO> projectList(@RequestBody MemberVO memberVO) throws Exception{
		log.debug(memberVO + "");
        List<ProjectVO> list = projectService.list(memberVO);
        
        log.debug("프로젝트리스트확인 : {}", list);
        return list;
    }
	
	@PostMapping(value = "/selectMemberbyHome", produces = "application/json; charset=utf-8")
	@ResponseBody
	public MemberVO memberInfobyHome(@RequestBody MemberVO memberVO){
//		log.debug("myhomeselect"+memberVO);
		
		MyhomeVO selectMyhome = myhomeService.selectMyhome(memberVO);
		log.debug("내홈정보{}", selectMyhome);
		
		if(selectMyhome == null) {
			
			int cnt = myhomeService.insertMyhomeMemberId(memberVO);
//			if(cnt>0) {
//				log.debug("myhome아이디 insert성공");
//			}else {
//				log.debug("myhome아이디 insert실패!!");
//			}
		}
		
		MemberVO selectMemberInfo = myhomeService.selectMemberInfo(memberVO);
		
//		log.debug("home에서 필요한 정보: " + selectMemberInfo);
		
		return selectMemberInfo;
	}
	
	@PostMapping(value = "/updateBgColor", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String updateMyhomeColor(@RequestBody MyhomeVO myhomeVO) {
		log.debug("myhomeVO: " + myhomeVO);
		
		int cnt = myhomeService.updateMyHomeColor(myhomeVO);
		
		if(cnt>0) {
			return "성공";
		}else {
			return "실패";
		}
		
	}
	
	@PostMapping(value = "/selectMyAllAlarm", produces = "application/json; charset=utf-8")
	@ResponseBody
	public List<AlarmVO> selectMyAllAlarm(@RequestBody MemberVO memberVO) throws Exception{
//		log.debug("알람 전체 리스트 위해 필요한 아이디" + memberVO);
		
		List<AlarmVO> myAllAlarmList = myhomeService.selectMyAllAlarm(memberVO);
		
		log.debug("내 알람리스트{}", myAllAlarmList);
		
		for(AlarmVO  v : myAllAlarmList) {
			String senderName = memberService.getUserNameById(v.getAlarmSender());
//			log.debug(senderName);
			v.setAlarmSender(senderName);
		}
		
		return myAllAlarmList;
	}
	
    
     @PostMapping(value = "/outOfdeadlinelist", produces = "application/json; charset=utf-8")
     @ResponseBody 
     public List<TopWorkVO> outOfdeadlinelist(@RequestBody MemberVO memberVO){ 
     // log.debug("outOfdeadlinelist 내작업에서 사용: {}", memberVO);
    List<TopWorkVO> outOfdeadlinelist = myhomeService.outOfdeadlineWorkList(memberVO);

    // log.debug("outOfdeadlineWorkList결과 {}", outOfdeadlinelist);
     return outOfdeadlinelist; 
     }
     
     
     @PostMapping(value = "/before3daysworkList", produces = "application/json; charset=utf-8")
     @ResponseBody 
     public List<TopWorkVO> before3daysworkList(@RequestBody MemberVO memberVO){
     List<TopWorkVO> before3daysworkList = myhomeService.before3daysWorkList(memberVO);
     
     return before3daysworkList; 
     }
     
     @PostMapping(value = "/selectOneProjectFromTopbar", produces = "application/json; charset=utf-8")
     @ResponseBody
     public ProjectVO selectOneProjectFromTopbar(@RequestBody ProjectVO proVo) throws Exception {
    	 
    	 ProjectVO proVO = projectService.selectOne(proVo.getProNo());
    	 
    	 return proVO;
     }
     
     //관리자 홈 관련 controller시작

 	@GetMapping(value = "/qnaNoAnswerList", produces = "application/json; charset=utf-8" )
 	@ResponseBody
 	public List<QnAVO> qnaNoAnswerList(){
 		
 		List<QnAVO> qnaNoAnswerList = myhomeService.qnaNoAnswerList();
 		
 		return qnaNoAnswerList;
 	}
 	
 	@PostMapping(value ="/showQnaDetail", produces = "application/json; charset=utf-8")
	@ResponseBody
	public QnAVO showDetail(@RequestBody Map<String, String> data) throws Exception {
		String qnaNo = data.get("qnaNo").toString();
		QnAVO vo = new QnAVO();
		vo = qnaService.getQnaDetail(qnaNo);
		return vo;
	}
	
}


















