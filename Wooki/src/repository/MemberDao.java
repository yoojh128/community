package repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mapper.MemberMapper;
import vo.PappusMembership;

@Component
public class MemberDao {
	
	private SqlSessionTemplate session;
	
	@Autowired
	public void setSession(SqlSessionTemplate session) {
		this.session = session;
	}

	public int loginCheck(String id, String pw) {
		return session.getMapper(MemberMapper.class).loginCheck(id, pw);
	}

	public int insertMembership(PappusMembership member) {
		return session.getMapper(MemberMapper.class).insertMembership(member);
	}

	public int confirmId(String id) {
		return session.getMapper(MemberMapper.class).confirmId(id);
	}

	public int delete(String id, String pw) {
		return session.getMapper(MemberMapper.class).delete(id, pw);
	}

	public PappusMembership userInfo(String id, String pw){
		return session.getMapper(MemberMapper.class).userInfo(id,pw);
	}
	
	public int update(PappusMembership member){
		return session.getMapper(MemberMapper.class).update(member);
	}
}
