package mapper;

import org.apache.ibatis.annotations.Param;

import vo.PappusMembership;

public interface MemberMapper {

	int loginCheck(@Param("id") String id, @Param("pw") String pw);

	int insertMembership(PappusMembership member);

	int confirmId(String id);

	int delete(@Param("id") String id, @Param("pw") String pw);
	
	PappusMembership userInfo(@Param("id") String id, @Param("pw") String pw);

	int update(PappusMembership member);
}
