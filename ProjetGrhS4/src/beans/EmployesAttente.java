package beans;

public class EmployesAttente {

	private int idEmployesAttente;
	private String nomEmploye; 
	private String emailEmploye;
	private String dateNaissanceEmploye;
	private String mdpEmploye; 
	private String cniEmploye;
	
	
	public String getNomEmploye() {
		return nomEmploye;
	}
	public void setNomEmploye(String nomEmploye) {
		this.nomEmploye = nomEmploye;
	}
	public String getDateNaissanceEmploye() {
		return dateNaissanceEmploye;
	}
	public void setDateNaissanceEmploye(String dateNaissanceEmploye) {
		this.dateNaissanceEmploye = dateNaissanceEmploye;
	}
	public String getMdpEmploye() {
		return mdpEmploye;
	}
	public void setMdpEmploye(String mdpEmploye) {
		this.mdpEmploye = mdpEmploye;
	}
	public String getCniEmploye() {
		return cniEmploye;
	}
	public void setCniEmploye(String cniEmploye) {
		this.cniEmploye = cniEmploye;
	}
	public int getIdEmployesAttente() {
		return idEmployesAttente;
	}
	public void setIdEmployesAttente(int idEmployesAttente) {
		this.idEmployesAttente = idEmployesAttente;
	}
	public String getEmailEmploye() {
		return emailEmploye;
	}
	public void setEmailEmploye(String emailEmploye) {
		this.emailEmploye = emailEmploye;
	}
}
