package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.MemoService;
import vo.Memo;
import vo.MemoPage;

@Controller
public class MemoController {

	private MemoService service;

	@Autowired
	public void setService(MemoService service) {
		this.service = service;
	}

	@RequestMapping("/main.do")
	public String main() {
		return "memo/main";
	}

	@RequestMapping("/about.do")
	public String about() {
		return "memo/test";
	}

	@RequestMapping("/list_loccheck.do")
	public String list_loccheck() {
		return "memo/list_loccheck";
	}

	@RequestMapping("/list.do")
	public ModelAndView list(HttpServletRequest request) {
		MemoPage memoPage = service.getMemoPage(request);
		request.setAttribute("memoPage", memoPage);
		try {
			request.setAttribute("sido", URLDecoder.decode(request.getParameter("sido"), "UTF-8"));
			request.setAttribute("sigugun", URLDecoder.decode(request.getParameter("sigugun"), "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		ModelAndView mv = new ModelAndView();
		mv.setViewName("memo/list");

		return mv;
	}

	@RequestMapping("/list_scroll.do")
	public ModelAndView list_scroll(HttpServletRequest request) {
		MemoPage memoPage = service.getMemoPage(request);
		request.setAttribute("memoPage", memoPage);
		try {
			if (request.getParameter("favorite") == null) {
				request.setAttribute("sido", URLDecoder.decode(request.getParameter("sido"), "UTF-8"));
				request.setAttribute("sigugun", URLDecoder.decode(request.getParameter("sigugun"), "UTF-8"));
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		ModelAndView mv = new ModelAndView();
		mv.setViewName("memo/list_scroll");

		return mv;
	}

	@RequestMapping("/list_favorite.do")
	public ModelAndView list_fatorite(HttpServletRequest request) {
		request.setAttribute("favorite", "favorite");
		MemoPage memoPage = service.getMemoPage(request);
		request.setAttribute("memoPage", memoPage);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("memo/list_favorite");

		return mv;
	}

	@RequestMapping("/list_other.do")
	public ModelAndView list_other(HttpServletRequest request) {
		request.setAttribute("other", "other");
		MemoPage memoPage = service.getMemoPage(request);
		request.setAttribute("memoPage", memoPage);

		ModelAndView mv = new ModelAndView();

		try {
			if (request.getParameter("sido") != null) {
				System.out.println(URLDecoder.decode(request.getParameter("sido"), "UTF-8"));
				System.out.println(URLDecoder.decode(request.getParameter("sigugun"), "UTF-8"));
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		mv.setViewName("memo/list_other");

		return mv;
	}

	@RequestMapping("/read.do")
	public String read(HttpServletRequest request) {
		Memo memo = service.readMemo(request);
		request.setAttribute("memo", memo);

		return "memo/read";
	}

	@RequestMapping("/write_form.do")
	public String write_form(HttpServletRequest request) {
		return "memo/write_form";
	}

	@RequestMapping("/memo_write.do")
	public String memo_write(HttpServletRequest request) {
		int result = service.write(request);
		request.setAttribute("result", result);

		return "memo/write_result";
	}

	@RequestMapping("/reply.do")
	public void reply(HttpServletRequest request, HttpServletResponse response) {
		int result = service.addReply(request);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out;
		try {
			out = response.getWriter();
			out.print(result);
			return;
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("/favorite.do")
	public void favorite(HttpServletRequest request, HttpServletResponse response) {
		int result = service.addFavorite(request);

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out;
		try {
			out = response.getWriter();
			out.print(result);
			return;
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("/up.do")
	public void up(HttpServletRequest request, HttpServletResponse response) {
		int result = service.addUp(request);

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out;
		try {
			out = response.getWriter();
			out.print(result);
			return;
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("/down.do")
	public void down(HttpServletRequest request, HttpServletResponse response) {
		int result = service.addDown(request);

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out;
		try {
			out = response.getWriter();
			out.print(result);
			return;
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
