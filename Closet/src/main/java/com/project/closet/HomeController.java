package com.project.closet;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/* 
 * Developer : G
 * Description : ������Ʈ�� �������� �帧�� ���� ���.
 * FLOW
 * = View(JSP).submit(Form������ ���⿡ ���Ͽ�)
 *   -> @Controller�� �ش��ϴ�class���� ReqeustMapping�� ���� ����
 *   -> Service(Impl)���� 1�������� ������ ����, Ȥ�� Dao(Impl)���� ������ ���� ����.
 *   -> Dao(Impl)���� SqlSession���� ����ȣ��(������ ���� ����) �� Return�� GET.
 *   -> Dao(Impl)���� Service(Impl)�� �� ����, Service������ ���� ���� True X False Ȯ�� �� Controller�� ����
 *   -> Controller ���� Service�κ��� Ȯ�ε� ���� ���� View�� �� ����(ModelAndView) �Ǵ� True X False ���� ����.
 *   -> ȭ�� ��ȯ.
 * Flow ��� : View -> Controller -> Service -> Dao -> Database(MyBatis) - > Dao(R) -> Service(R) -> Controller(R) -> View(R)			// R = Result
 * Date : 2018.09.04
 * E.T.C : HomeController.java�� ���� ������ �� ��, BasePackage�����̾ �׷���, ����� �ٸ��͵� �� ���� ��.
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
		mav.addObject("msg","세션이 만료되었습니다. 다시 로그인해 주세요.");
		mav.setViewName("main");
		
		return mav;
	}
	
//	@RequestMapping("/about")
//	public String about() {
//		return "about/about";
//	}
	
}
