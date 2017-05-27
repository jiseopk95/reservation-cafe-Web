package exam.jdbc;

/**
 * 
 * Member에 해당하는 정보에 대한 저장소 역할 
 *
 */
public class MemberVO {
/**
 * 필요한 property 선언
 */
	private String id;
	private String pwd;
	private String name;
	private String jumin1;
	private String jumin2;
	private String addr;
	private int age;
	
	public MemberVO(){}
	public MemberVO(String id, String pwd, String name, String jumin1, String jumin2, String addr, int age){
		
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		
		this.jumin1 = jumin1;
		this.jumin2 = jumin2;
		this.id = id;
		
		this.addr = addr;
		this.age=age;
		
	}
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getJumin1() {
		return jumin1;
	}
	public void setJumin1(String jumin1) {
		this.jumin1 = jumin1;
	}
	public String getJumin2() {
		return jumin2;
	}
	public void setJumin2(String jumin2) {
		this.jumin2 = jumin2;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;		
	}
	
}
