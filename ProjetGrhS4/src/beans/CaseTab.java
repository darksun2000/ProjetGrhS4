package beans;

public class CaseTab {

	private int idcaseTab; 
	private String nomEmploye;
	private int isAbsent;
	private int numT,jour,numLigne;
	
	
	
	public int getNumLigne() {
		return numLigne;
	}
	public void setNumLigne(int numLigne) {
		this.numLigne = numLigne;
	}
	public int getNumT() {
		return numT;
	}
	public void setNumT(int numT) {
		this.numT = numT;
	}
	public int getJour() {
		return jour;
	}
	public void setJour(int jour) {
		this.jour = jour;
	}
	public int getIsAbsent() {
		return isAbsent;
	}
	public void setIsAbsent(int isAbsent) {
		this.isAbsent = isAbsent;
	}
	public int getIdcaseTab() {
		return idcaseTab;
	}
	public void setIdcaseTab(int idcaseTab) {
		this.idcaseTab = idcaseTab;
	}
	public String getNomEmploye() {
		return nomEmploye;
	}
	public void setNomEmploye(String nomEmploye) {
		this.nomEmploye = nomEmploye;
	}
}
