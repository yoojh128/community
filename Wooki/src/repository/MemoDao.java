package repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mapper.MemoMapper;
import vo.Memo;

@Component
public class MemoDao {

	private SqlSessionTemplate session;

	@Autowired
	public void setSession(SqlSessionTemplate session) {
		this.session = session;
	}

	public int selectMemoFavoriteCount(String id) {
		return session.getMapper(MemoMapper.class).selectMemoFavoriteCount(id);
	}

	public int selectMemoCount(String si, String gu) {
		return session.getMapper(MemoMapper.class).selectMemoCount(si, gu);
	}

	public List<Memo> selectMemoFavoriteList(String id, int startRow, int countPerPage, String value) {
		if (value.equals("0")) {
			return session.getMapper(MemoMapper.class).selectMemoFavoriteList_0(id, startRow, countPerPage, value);
		} else {
			return session.getMapper(MemoMapper.class).selectMemoFavoriteList_1(id, startRow, countPerPage, value);
		}
	}

	public List<Memo> selectMemoOtherList(int startRow, int countPerPage, String value, String si, String gu) {
		if (value.equals("0")) {
			return session.getMapper(MemoMapper.class).selectMemoOtherList_0(startRow, countPerPage, value, si, gu);
		} else {
			return session.getMapper(MemoMapper.class).selectMemoOtherList_1(startRow, countPerPage, value, si, gu);
		}
	}

	public List<Memo> selectMemoList(String si, String gu, int startRow, int countPerPage, String value) {
		if (value.equals("0")) {
			return session.getMapper(MemoMapper.class).selectMemoList_0(startRow, countPerPage, value, si, gu);
		} else {
			return session.getMapper(MemoMapper.class).selectMemoList_1(startRow, countPerPage, value, si, gu);
		}
	}

	public int updateReadCount(int memo_num) {
		return session.getMapper(MemoMapper.class).updateReadCount(memo_num);
	}

	public Memo selectMemo(int memo_num) {
		return session.getMapper(MemoMapper.class).selectMemo(memo_num);
	}

	public Memo selectUpdown(int memo_num) {
		return session.getMapper(MemoMapper.class).selectUpdown(memo_num);
	}

	public Memo selectRep(int memo_num) {
		return session.getMapper(MemoMapper.class).selectRep(memo_num);
	}

	public int existReply(int memo_num) {
		return session.getMapper(MemoMapper.class).existReply(memo_num);
	}

	public int createReply(int memo_num, String reply_text) {
		return session.getMapper(MemoMapper.class).createReply(memo_num, reply_text);
	}

	public int addReply(int memo_num, String reply_text) {
		return session.getMapper(MemoMapper.class).addReply(memo_num, reply_text);
	}

	public int selectFavorite(int memo_num, String id) {
		return session.getMapper(MemoMapper.class).selectFavorite(memo_num, id);
	}

	public int addFavorite(int memo_num, String id) {
		return session.getMapper(MemoMapper.class).addFavorite(memo_num, id);
	}

	public int existUpdown(int memo_num, String id) {
		return session.getMapper(MemoMapper.class).existUpdown(memo_num, id);
	}

	public int addUpdown_Up(int memo_num, String id) {
		return session.getMapper(MemoMapper.class).addUpdown_Up(memo_num, id);
	}

	public int isUp(int memo_num, String id) {
		return session.getMapper(MemoMapper.class).isUp(memo_num, id);
	}

	public int plusUp(int memo_num, String id) {
		return session.getMapper(MemoMapper.class).plusUp(memo_num, id);
	}

	public int addUpdown_Down(int memo_num, String id) {
		return session.getMapper(MemoMapper.class).addUpdown_Down(memo_num, id);
	}

	public int isDown(int memo_num, String id) {
		return session.getMapper(MemoMapper.class).isDown(memo_num, id);
	}

	public int plusDown(int memo_num, String id) {
		return session.getMapper(MemoMapper.class).plusDown(memo_num, id);
	}

	public int insertMemo(Memo memo) {
		return session.getMapper(MemoMapper.class).insertMemo(memo);
	}
}
