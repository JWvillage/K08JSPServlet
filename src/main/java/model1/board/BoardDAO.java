package model1.board;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class BoardDAO extends JDBConnect {

	public BoardDAO(ServletContext application) {
		super(application);
	}

	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;

		String query = "SELECT COUNT(*) FROM board";
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " " + " LIKE '%" + map.get("searchWord") + "%' ";
		}
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("게시물 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}
		return totalCount;
	}

	public List<BoardDTO> selectList(Map<String, Object> map) {
		List<BoardDTO> bbs = new Vector<BoardDTO>();

		String query = "SELECT * FROM board ";
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " " + " LIKE '%" + map.get("searchWord") + "%'";
		}
		query += " ORDER BY num DESC";

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			while (rs.next()) {
				BoardDTO dto = new BoardDTO();

				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));

				bbs.add(dto);
			}
		} catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		// List.jsp로 컬렉션을 반환한다.
		return bbs;
	}
	
	// 사용자가 입력한 내용을 board테이블에 입력(insert) 처리한다.
	public int insertWrite(BoardDTO dto) {

		// 입력 결과 확인용 변수
		int result = 0;

		try {
			// 인파라미터가 있는 동적 쿼리문 작성(사용자의 입력에 따라 달라짐)
			String query = "insert into board (num, title, content, id, visitcount) values ("
					+ "seq_board_num.nextval, ?, ?, ?, 0)";

			// 동적 쿼리문 실행을 위한 prepared 객체 생성
			psmt = con.prepareStatement(query);
			// 인파라미터 설정
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());

			// 쿼리문 실행 : 행에 영향을 미치는 쿼리이므로 executeUpdate() 메소드 사용
			// 			입력에 성공하면 1, 실패하면 0을 반환한다.
			result = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}

		return result;
	}
	
	// 상세보기를 위해 매개변수로 전달된 일련번호에 해당하는 게시물을 인출한다.
	public BoardDTO selectView(String num) {
		
		BoardDTO dto = new BoardDTO();

		// join을 이용해서 member테이블의 name컬럼까지 가져온다.
		String query = "select B.*, M.name from member M inner join board B on M.id = B.id where num = ?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			rs = psmt.executeQuery();

			// 일련번호는 중복되지 않으므로 if문으로 처리한다.
			// 게시판 목록처럼 여러개의 레코드를 가져온다면 while문을 사용하면 된다.
			if (rs.next()) {
				// DTO에 레코드의 내용을 추가한다.
				dto.setNum(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString(6));
				dto.setName(rs.getString("name"));
			}

		} catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}

		return dto;
	}
	
	// 게시물의 조회수를 1 증가시킨다.
	public void updateVisitCount(String num) {
		
		// 게시물의 일련번호를 매개변수로 받은 후 visitcount를 1 증가시킨다.
		// 해당 컬럼은 number타입이므로 덧셈이 가능하다.
		String query = "update board set visitcount = visitcount + 1 where num = ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			psmt.executeQuery();
			
		} catch (Exception e) {
			System.out.println("게시물 조회 수 증가 중 예외 발생");
			e.printStackTrace();
		}
	}

	public int updateEdit(BoardDTO dto) {
		
		int result = 0;
		
		try {
			
			String query = "update board set title = ?, content = ? where num = ?";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNum());
			
			result = psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("게시물 수정 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int deletePost(BoardDTO dto) {
		int result = 0;
		
		try {
			
			String query = "delete from board where num = ?";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getNum());
			
			result = psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 게시판의 페이징 처리를 위한 메소드
	public List<BoardDTO> selectListPage(Map<String, Object> map) {
		
		List<BoardDTO> bbs = new ArrayList<BoardDTO>();

		/*
		 * 3개의 서브 쿼리 문을 통해 각 페이지에 출력할 게시판 목록을 인출 할 수 있는 쿼리문을 작성한다.
		 * ( 자세한 내용은 JDBC 실습.sql 참조 )
		 * */
		String query = " SELECT * FROM ( select tb.*, rownum rNum from ( select * from board ";
		// 검색 조건 추가. 검색어가 있는 겨우에만 where 절이 추가된다.
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " " + " LIKE '%" + map.get("searchWord") + "%' ";
		}
		query += " ORDER BY num DESC) tb) where rNum between ? and ? ";

		/*
		 * between 절 대신 비교 연산자를 사용한다면 다음과 같이 수정할 수 있다.
		 * => where rNum = ? and rNum <= ?
		 * */
		
		// 문자열을 연결할 때는 StringBuffer 클래스를 사용하면 유용하다.
//		StringBuffer sb = new StringBuffer();
//		sb.append(" select * from ");
//		sb.append(" (select tb.*, rownum rNum from ");
//		sb.append(" (select * from board order by num desc) tb) ");
//		sb.append(" where rNum between  ? and ? ");
//		sb.toString();
		
		try {
			psmt = con.prepareStatement(query);
			/*
			 * 인파라미터 설정 : JSP에서 해당 페이지에 출력할 게시물의 구간을 계산한 후
			 * Map컬렉션에 저장하고 DAO로 전달하면 해당 값으로 쿼리문을 완성한다.
			 * */
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			
			rs = psmt.executeQuery();

			while (rs.next()) {
				
				BoardDTO dto = new BoardDTO();

				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));

				// 반환할 결과 목록을 List컬렉션에 추가한다.
				bbs.add(dto);
			}
		} catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		
		return bbs;
	}
}