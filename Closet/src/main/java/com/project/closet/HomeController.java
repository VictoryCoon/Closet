package com.project.closet;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/* 
 * Developer : G
 * Description : 프로젝트의 전반적인 흐름에 대한 명시.
 * FLOW
 * = View(JSP).submit(Form데이터 제출에 대하여)
 *   -> @Controller에 해당하는class에서 ReqeustMapping의 값을 추적
 *   -> Service(Impl)에서 1차적으로 데이터 가공, 혹은 Dao(Impl)에서 가져온 값을 가공.
 *   -> Dao(Impl)에서 SqlSession으로 쿼리호출(데이터 직접 접근) 및 Return값 GET.
 *   -> Dao(Impl)에서 Service(Impl)로 값 전달, Service에서는 값에 따른 True X False 확인 후 Controller로 전달
 *   -> Controller 에서 Service로부터 확인된 값에 따라 View에 값 전달(ModelAndView) 또는 True X False 로직 수행.
 *   -> 화면 전환.
 * Flow 요약 : View -> Controller -> Service -> Dao -> Database(MyBatis) - > Dao(R) -> Service(R) -> Controller(R) -> View(R)			// R = Result
 * Date : 2018.09.04
 * E.T.C : HomeController.java는 절대 지우지 말 것, BasePackage파일이어서 그런지, 지우면 다른것도 다 먹통 됨.
 */

@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "main";
	}
	
	@RequestMapping("sessionEndUp")
	public ModelAndView sessionEndUp() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg","세션이 만료되었습니다. 다시 로그인해주세요.");
		mav.setViewName("main");
		
		return mav;
	}
	
//	@RequestMapping("/about")
//	public String about() {
//		return "about/about";
//	}
	
}
