package beans;



public class Employes {

	private int idEmploye;
	private String nomEmploye;
	private String emailEmploye;
	private String dateNaissanceEmploye;
	private float salaireEmploye;
	private String mdpEmploye;
	private String cniEmploye;
	private int numT;
	private String photoEmploye;
	
	public Employes() {
		super();
	}

	public Employes(int idEmploye, String nomEmploye, String emailEmploye, String dateNaissanceEmploye,
			float salaireEmploye, String mdpEmploye, String cniEmploye) {
		super();
		this.idEmploye = idEmploye;
		this.nomEmploye = nomEmploye;
		this.emailEmploye = emailEmploye;
		this.dateNaissanceEmploye = dateNaissanceEmploye;
		this.salaireEmploye = salaireEmploye;
		this.mdpEmploye = mdpEmploye;
		this.cniEmploye = cniEmploye;
	}

	public int getIdEmploye() {
		return idEmploye;
	}

	public void setIdEmploye(int idEmploye) {
		this.idEmploye = idEmploye;
	}

	public String getNomEmploye() {
		return nomEmploye;
	}

	public void setNomEmploye(String nomEmploye) {
		this.nomEmploye = nomEmploye;
	}

	public String getEmailEmploye() {
		return emailEmploye;
	}

	public void setEmailEmploye(String emailEmploye) {
		this.emailEmploye = emailEmploye;
	}

	public String getDateNaissanceEmploye() {
		return dateNaissanceEmploye;
	}

	public void setDateNaissanceEmploye(String dateNaissanceEmploye) {
		this.dateNaissanceEmploye = dateNaissanceEmploye;
	}

	public float getSalaireEmploye() {
		return salaireEmploye;
	}

	public void setSalaireEmploye(float salaireEmploye) {
		this.salaireEmploye = salaireEmploye;
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

	public int getNumT() {
		return numT;
	}

	public void setNumT(int numT) {
		this.numT = numT;
	}

	public String getPhotoEmploye() {
		return photoEmploye;
	}

	public void setPhotoEmploye(String photoEmploye) {
		this.photoEmploye = photoEmploye;
	}

	public int getAgeEmployes() {
		int age = 0;
		
				String aux = this.dateNaissanceEmploye;
				String m[] = aux.split("-");
				aux = m[0];
				int anneeN = Integer.parseInt(aux);
				System.out.print(anneeN+"-");
				int moisN = Integer.parseInt(m[1]);
				System.out.print(moisN+"-");
				int jourN = Integer.parseInt(m[2]);
				System.out.println(jourN);
				aux = java.time.LocalDate.now() + "";
				
				String a[] = aux.split("-");
				int anneeA = Integer.parseInt(a[0]);
				System.out.print(anneeA+"-");
				int moisA = Integer.parseInt(a[1]);
				System.out.print(moisA+"-");
				int jourA = Integer.parseInt(a[2]);
				System.out.println(jourN);
				if (moisN < moisA) {
					age=anneeA - anneeN;
				} else if (moisN == moisA) {
					     if (jourA > jourN) {
						     age=anneeA - anneeN - 1;
					      } else
						age=anneeA - anneeN;
				      } else
					     age=anneeA - anneeN - 1;
			
		return age;
	}

	
}
