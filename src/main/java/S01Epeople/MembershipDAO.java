package S01Epeople;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class MembershipDAO extends JDBConnect{

	public MembershipDAO(String driver, String url, String id, String pwd) {
		super(driver, url, id, pwd);
	}

	public MembershipDAO(ServletContext application) {
		super(application);
	}
	
	// DB Insert
	public int memberInsert(MembershipDTO dto) {
		
		int result = 0;
		
		try {
			
			String query = "insert into membership values (seq_membership_num.nextval,"
					+ " ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
			
			psmt = con.prepareStatement(query);
			
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPassword());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getGender());
			psmt.setString(5, dto.getBirthday());
			psmt.setString(6, dto.getZipcode());
			psmt.setString(7, dto.getAddress());
			psmt.setString(8, dto.getEmail_address());
			psmt.setString(9, dto.getMobile_number());
			psmt.setString(10, dto.getPhone_number());
			
			result = psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("회원가입 정보 입력 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	// Login
	public MembershipDTO memberLogin(String u_id, String u_pass) {
		
		MembershipDTO dto = new MembershipDTO();
		
		String query = "select * from membership where id = ? and password = ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, u_id);
			psmt.setString(2, u_pass);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getString(2));
				dto.setPassword(rs.getString(3));
				dto.setName(rs.getString(4));
				dto.setGender(rs.getString(5));
				dto.setBirthday(rs.getString(6));
				dto.setZipcode(rs.getString(7));
				dto.setAddress(rs.getString(8));
				dto.setEmail_address(rs.getString(9));
				dto.setMobile_number(rs.getString(10));
				dto.setPhone_number(rs.getString(11));
				dto.setRegidate(rs.getString(12));
			}
			
		} catch (Exception e) {
			System.out.println("로그인 중 오류 발생");
			e.printStackTrace();
		}
		
		return dto;
	}
	
	// idValidate1
	public MembershipDTO idValidate(String u_id) {
		
		MembershipDTO dto = new MembershipDTO();
		
		String query = "select id from membership where id = ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, u_id);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getString("id"));
			}
			
		} catch (Exception e) {
			System.out.println("아이디 중복 확인 중 오류 발생");
			e.printStackTrace();
		}
		
		return dto;
	}
	// idValidate2
	public int idValidate2(String u_id) {
		
		int result = 0;
		
		String query = "select id from membership where id = ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, u_id);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				result = 1;
			} else {
				result = 2;
			}
			
		} catch (Exception e) {
			System.out.println("아이디 중복 확인 중 오류 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
}
