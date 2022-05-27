package membership;
/**
 * 
 * @author JWhouse
 * DTO(Data Transfer Object) : JSP와 Java 파일간에 데이터를 전달하기 위한 객체로 자바빈 규약에 의해 제작된다.
 * 자바빈 규약은 115p 참조
 */
public class MemberDTO {
	
	// 멤버 변수 : member 테이블의 컬럼과 동일하게 설정한다.
	private String id;
	private String pass;
	private String name;
	private String regidate;
	
	
	/**
	 * 생성자의 경우 꼭 필요한 경우가 아니라면 생성하지 않아도 된다.
	 * 생성자를 생성하지 않은 경우 컴파일러에 의해 default 생성자(기본 생성자)가 추가되기 때문이다.
	 */
	
	// 정보 은닉된 멤버 변수에 접근을 위해 public으로 정의된 getter / setter
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRegidate() {
		return regidate;
	}
	public void setRegidate(String regidate) {
		this.regidate = regidate;
	}
	

}
