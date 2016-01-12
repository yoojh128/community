package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import vo.Memo;

public interface MemoMapper {

	int selectMemoFavoriteCount(String id);

	int selectMemoCount(@Param("si") String si, @Param("gu") String gu);

	List<Memo> selectMemoFavoriteList_0(@Param("id") String id, @Param("startRow") int startRow,
			@Param("countPerPage") int countPerPage, @Param("value") String value);

	List<Memo> selectMemoFavoriteList_1(@Param("id") String id, @Param("startRow") int startRow,
			@Param("countPerPage") int countPerPage, @Param("value") String value);

	List<Memo> selectMemoOtherList_0(@Param("startRow") int startRow, @Param("countPerPage") int countPerPage,
			@Param("value") String value, @Param("si") String si, @Param("gu") String gu);

	List<Memo> selectMemoOtherList_1(@Param("startRow") int startRow, @Param("countPerPage") int countPerPage,
			@Param("value") String value, @Param("si") String si, @Param("gu") String gu);

	List<Memo> selectMemoList_0(@Param("startRow") int startRow, @Param("countPerPage") int countPerPage,
			@Param("value") String value, @Param("si") String si, @Param("gu") String gu);

	List<Memo> selectMemoList_1(@Param("startRow") int startRow, @Param("countPerPage") int countPerPage,
			@Param("value") String value, @Param("si") String si, @Param("gu") String gu);

	int updateReadCount(int memo_num);

	Memo selectMemo(int memo_num);

	Memo selectUpdown(int memo_num);

	Memo selectRep(int memo_num);

	int existReply(int memo_num);

	int createReply(@Param("memo_num") int memo_num, @Param("reply_text") String reply_text);

	int addReply(@Param("memo_num") int memo_num, @Param("reply_text") String reply_text);

	int selectFavorite(@Param("memo_num") int memo_num, @Param("id") String id);

	int addFavorite(@Param("memo_num") int memo_num, @Param("id") String id);

	int existUpdown(@Param("memo_num") int memo_num, @Param("id") String id);

	int addUpdown_Up(@Param("memo_num") int memo_num, @Param("id") String id);

	int isUp(@Param("memo_num") int memo_num, @Param("id") String id);

	int plusUp(@Param("memo_num") int memo_num, @Param("id") String id);

	int addUpdown_Down(@Param("memo_num") int memo_num, @Param("id") String id);

	int isDown(@Param("memo_num") int memo_num, @Param("id") String id);

	int plusDown(@Param("memo_num") int memo_num, @Param("id") String id);

	int insertMemo(Memo memo);
}
