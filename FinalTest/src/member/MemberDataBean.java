//Member의 정보를 저장 및 조회에 사용

package member;

public class MemberDataBean {
	 private String id;
	 private String passwd;
	 private String name;
	 private String email;
	 
	 public String getId() {
	  return id;
	 }
	 public void setId(String id) {
	  this.id = id;
	 }
	 public String getPasswd() {
	  return passwd;
	 }
	 public void setPasswd(String passwd) {
	  this.passwd = passwd;
	 }
	 public String getName() {
	  return name;
	 }
	 public void setName(String name) {
	  this.name = name;
	 }
	 public String getEmail() {
		 return email;
	 }
	 public void setEmail(String email) {
		 this.email = email;
	 }
}

	