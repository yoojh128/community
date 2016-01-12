package vo;

import java.util.Date;

public class Memo {
	private int memo_num;
	private String id;
	private String content;
	private String sido;
	private String sigugun;
	private String posvalue;
	private Date posting_date;
	private int read_count;
	private int up;
	private int down;
	private String reply;

	public Memo() {
	}

	public Memo(int memo_num, String id, String content, String sido, String sigugun, String posvalue,
			Date posting_date, int read_count, int up, int down, String reply) {
		super();
		this.memo_num = memo_num;
		this.id = id;
		this.content = content;
		this.sido = sido;
		this.sigugun = sigugun;
		this.posvalue = posvalue;
		this.posting_date = posting_date;
		this.read_count = read_count;
		this.up = up;
		this.down = down;
		this.reply = reply;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public int getMemo_num() {
		return memo_num;
	}

	public void setMemo_num(int memo_num) {
		this.memo_num = memo_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSido() {
		return sido;
	}

	public void setSido(String sido) {
		this.sido = sido;
	}

	public String getSigugun() {
		return sigugun;
	}

	public void setSigugun(String sigugun) {
		this.sigugun = sigugun;
	}

	public String getPosvalue() {
		return posvalue;
	}

	public void setPosvalue(String posvalue) {
		this.posvalue = posvalue;
	}

	public Date getPosting_date() {
		return posting_date;
	}

	public void setPosting_date(Date posting_date) {
		this.posting_date = posting_date;
	}

	public int getRead_count() {
		return read_count;
	}

	public void setRead_count(int read_count) {
		this.read_count = read_count;
	}

	public int getUp() {
		return up;
	}

	public void setUp(int up) {
		this.up = up;
	}

	public int getDown() {
		return down;
	}

	public void setDown(int down) {
		this.down = down;
	}

}
