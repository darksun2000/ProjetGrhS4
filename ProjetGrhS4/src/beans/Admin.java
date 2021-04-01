package beans;

public class Admin {

	private int idAdmin;
	private String loginAdmin;
	private String mdpAdmin;
	private String emailAdmin;
	private String telAdmin;
	private String photoAdmin;
    
	
	public Admin() {
		super();
	}
	
	public Admin(int idAdmin, String loginAdmin, String mdpAdmin) {
		super();
		this.idAdmin = idAdmin;
		this.loginAdmin = loginAdmin;
		this.mdpAdmin = mdpAdmin;
		
	}


	public int getIdAdmin() {
		return idAdmin;
	}
	public void setIdAdmin(int idAdmin) {
		this.idAdmin = idAdmin;
	}
	
	public String getLoginAdmin() {
		return loginAdmin;
	}
	public void setLoginAdmin(String loginAdmin) {
		this.loginAdmin = loginAdmin;
	}
	
	public String getMdpAdmin() {
		return mdpAdmin;
	}
	public void setMdpAdmin(String mdpAdmin) {
		this.mdpAdmin = mdpAdmin;
	}

	public String getEmailAdmin() {
		return emailAdmin;
	}

	public void setEmailAdmin(String emailAdmin) {
		this.emailAdmin = emailAdmin;
	}

	public String getTelAdmin() {
		return telAdmin;
	}

	public void setTelAdmin(String telAdmin) {
		this.telAdmin = telAdmin;
	}

	public String getPhotoAdmin() {
		return photoAdmin;
	}

	public void setPhotoAdmin(String photoAdmin) {
		this.photoAdmin = photoAdmin;
	}
	
}
