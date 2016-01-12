package vo;

import java.util.List;

public class MemoPage {

	private List<Memo> memoList;
	private int requestPage;
	private int totalPageCount;
	private int startPage;
	private int endPage;

	public MemoPage() {
	}

	public MemoPage(List<Memo> memoList, int requestPage, int totalPageCount, int startPage, int endPage) {
		super();
		this.memoList = memoList;
		this.requestPage = requestPage;
		this.totalPageCount = totalPageCount;
		this.startPage = startPage;
		this.endPage = endPage;
	}

	public List<Memo> getMemoList() {
		return memoList;
	}

	public void setMemoList(List<Memo> memoList) {
		this.memoList = memoList;
	}

	public int getRequestPage() {
		return requestPage;
	}

	public void setRequestPage(int requestPage) {
		this.requestPage = requestPage;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

}
