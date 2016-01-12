package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Component;

import repository.MemberDao;
import vo.PappusMembership;

@Component
public class MemberService {

	private MemberDao dao;

	@Autowired
	public void setDao(MemberDao dao) {
		this.dao = dao;
	}

	public int loginCheck(String id, String pw) {
		return dao.loginCheck(id, pw);
	}

	public int join(PappusMembership member) {
		return dao.insertMembership(member);
	}

	public int confirmId(String id) {
		return dao.confirmId(id);
	}

	public int delete(String id, String pw) {
		return dao.delete(id, pw);
	}
	
	public PappusMembership userInfo(String id, String pw){
		return dao.userInfo(id,pw);
	}
	
	public int update(PappusMembership member){
		return dao.update(member);
	}
}