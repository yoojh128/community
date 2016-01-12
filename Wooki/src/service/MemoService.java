package service;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.MemoDao;
import vo.Memo;
import vo.MemoPage;

@Component
public class MemoService {

	public static final int COUNT_PER_PAGE = 10;

	private MemoDao dao;

	@Autowired
	public void setDao(MemoDao dao) {
		this.dao = dao;
	}

	public MemoPage getMemoPage(HttpServletRequest request) {
		String pageStr = request.getParameter("page");
		String favorite = (String) request.getAttribute("favorite");

		if (request.getParameter("favorite") != null && request.getParameter("favorite").equals("favorite")) {
			favorite = "favorite";
		}

		String other = (String) request.getAttribute("other");

		if (request.getParameter("other") != null && request.getParameter("other").equals("other")) {
			other = "other";
		}
		
		int requestPage = 1;
		if (pageStr != null && pageStr.length() > 0) {
			requestPage = Integer.parseInt(pageStr);
		}

		int totalMemoCount = 0;

		if (favorite != null && favorite.equals("favorite")) {
			totalMemoCount = dao.selectMemoFavoriteCount(request.getParameter("id"));
			System.out.println(totalMemoCount);
		} else if (other != null && other.equals("other")) {
			try {
				if (request.getParameter("sido") != null) {
					totalMemoCount = dao.selectMemoCount(URLDecoder.decode(request.getParameter("sido"), "UTF-8"),
							URLDecoder.decode(request.getParameter("sigugun"), "UTF-8"));
				} else {
					totalMemoCount = dao.selectMemoCount("서울특별시", "강남구");
					request.setAttribute("sido", "서울특별시");
					request.setAttribute("sigugun", "강남구");
				}
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		} else {
			try {
				totalMemoCount = dao.selectMemoCount(URLDecoder.decode(request.getParameter("sido"), "UTF-8"),
						URLDecoder.decode(request.getParameter("sigugun"), "UTF-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}

		if (totalMemoCount == 0) {
			request.setAttribute("value", 0);
			return new MemoPage();
		}

		int totalPageCount = totalMemoCount / COUNT_PER_PAGE;
		if (totalMemoCount % COUNT_PER_PAGE != 0) {
			totalPageCount++;
		}

		int startRow = (requestPage - 1) * COUNT_PER_PAGE;
		List<Memo> memoList = null;
		
		if (favorite != null && favorite.equals("favorite")) {
			if (request.getParameter("value") != null) {
				memoList = dao.selectMemoFavoriteList(request.getParameter("id"), startRow, COUNT_PER_PAGE,
						request.getParameter("value"));
			} else {
				memoList = dao.selectMemoFavoriteList(request.getParameter("id"), startRow, COUNT_PER_PAGE, "0");
				request.setAttribute("value", 0);
			}
		} else if (other != null && other.equals("other")) {
			try {
				memoList = dao.selectMemoOtherList(startRow, COUNT_PER_PAGE, request.getParameter("value"),
						URLDecoder.decode(request.getParameter("sido"), "UTF-8"),
						URLDecoder.decode(request.getParameter("sigugun"), "UTF-8"));
				
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			
		} else {
			System.out.println("value : " + request.getParameter("value"));
			if (request.getParameter("value") != null) {
				try {
					memoList = dao.selectMemoList(URLDecoder.decode(request.getParameter("sido"), "UTF-8"),
							URLDecoder.decode(request.getParameter("sigugun"), "UTF-8"), startRow, COUNT_PER_PAGE,
							request.getParameter("value"));
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
			} else {
				try {
					memoList = dao.selectMemoList(URLDecoder.decode(request.getParameter("sido"), "UTF-8"),
							URLDecoder.decode(request.getParameter("sigugun"), "UTF-8"), startRow, COUNT_PER_PAGE, "0");
					request.setAttribute("value", 0);
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
			}
		}

		int startPage = requestPage - 5;
		if (startPage < 1) {
			startPage = 1;
		}
		int endPage = requestPage + 5;
		if (endPage > totalPageCount) {
			endPage = totalPageCount;
		}

		return new MemoPage(memoList, requestPage, totalPageCount, startPage, endPage);
	}

	public Memo readMemo(HttpServletRequest request) {
		String memo_num_str = request.getParameter("memo_num");
		int memo_num = Integer.parseInt(memo_num_str);
		Memo result = null;
		Memo result_tmp = null;

		if (dao.updateReadCount(memo_num) > 0) {
			result = dao.selectMemo(memo_num);

			result_tmp = dao.selectUpdown(memo_num);

			if (result_tmp == null) {
				result_tmp = new Memo();
			}

			result.setUp(result_tmp.getUp());
			result.setDown(result_tmp.getDown());

			result_tmp = dao.selectRep(memo_num);

			if (result_tmp == null) {
				result_tmp = new Memo();
			}

			result.setReply(result_tmp.getReply());
		}

		return result;
	}

	public int addReply(HttpServletRequest request) {
		String memo_num_str = request.getParameter("memo_num");
		int memo_num = Integer.parseInt(memo_num_str);
		String id = request.getParameter("id");
		String reply_text = null;
		int result;

		try {
			reply_text = URLDecoder.decode(request.getParameter("reply_text"), "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}

		reply_text = id + " : " + reply_text + "\r\n";
		if (dao.existReply(memo_num) == 0) {
			result = dao.createReply(memo_num, reply_text);
		} else {
			result = dao.addReply(memo_num, reply_text);
		}

		return result;
	}

	public int addFavorite(HttpServletRequest request) {
		String memo_num_str = request.getParameter("memo_num");
		int memo_num = Integer.parseInt(memo_num_str);
		String id = request.getParameter("id");

		int result = 0;

		if (dao.selectFavorite(memo_num, id) == 0) {
			result = dao.addFavorite(memo_num, id);
		}

		return result;
	}

	public int addUp(HttpServletRequest request) {
		String memo_num_str = request.getParameter("memo_num");
		int memo_num = Integer.parseInt(memo_num_str);
		String id = request.getParameter("id");

		int result = 0;

		if (dao.existUpdown(memo_num, id) == 0) {
			result = dao.addUpdown_Up(memo_num, id);
		} else if (dao.isUp(memo_num, id) == 0) {
			result = dao.plusUp(memo_num, id);
		}

		return result;
	}

	public int addDown(HttpServletRequest request) {
		String memo_num_str = request.getParameter("memo_num");
		int memo_num = Integer.parseInt(memo_num_str);
		String id = request.getParameter("id");

		int result = 0;

		if (dao.existUpdown(memo_num, id) == 0) {
			result = dao.addUpdown_Down(memo_num, id);
		} else if (dao.isDown(memo_num, id) == 0) {
			result = dao.plusDown(memo_num, id);
		}

		return result;
	}

	public int write(HttpServletRequest request) {
		String id = request.getParameter("id");
		String content = null;
		String sido = null;
		String sigugun = null;

		System.out.println("하기 전 : " + request.getParameter("sido"));
		try {
			System.out.println("하고난 후 : " + URLDecoder.decode(request.getParameter("sido"), "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		try {
			content = URLDecoder.decode(request.getParameter("content"), "UTF-8");
			sido = URLDecoder.decode(request.getParameter("sido"), "UTF-8");
			sigugun = URLDecoder.decode(request.getParameter("sigugun"), "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		String posvalue = request.getParameter("posvalue");

		Memo memo = new Memo();
		memo.setId(id);
		memo.setContent(content);
		memo.setSido(sido);
		memo.setSigugun(sigugun);
		memo.setPosvalue(posvalue);

		int result = 0;
		result = dao.insertMemo(memo);

		return result;
	}
}
