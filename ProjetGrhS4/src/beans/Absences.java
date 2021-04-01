package beans;

public class Absences {

	private int idAbsence;
	private String motifAbsence;
	private String natureAbsence;
	private String dateAbsence;
	private int idEmploye;
	private String nomEmploye;
	private int nbreAbsence;
	
	public Absences() {
		super();
	}

	public Absences(int idAbsence, String motifAbsence, String natureAbsence, String dateAbsence, int idEmploye) {
		super();
		this.idAbsence = idAbsence;
		this.motifAbsence = motifAbsence;
		this.natureAbsence = natureAbsence;
		this.dateAbsence = dateAbsence;
		this.idEmploye = idEmploye;
	}

	public int getIdAbsences() {
		return idAbsence;
	}

	public void setIdAbsences(int idAbsence) {
		this.idAbsence = idAbsence;
	}

	public String getMotifAbsences() {
		return motifAbsence;
	}

	public void setMotifAbsences(String motifAbsence) {
		this.motifAbsence = motifAbsence;
	}

	public String getNatureAbsences() {
		return natureAbsence;
	}

	public void setNatureAbsences(String natureAbsence) {
		this.natureAbsence = natureAbsence;
	}

	public String getDateAbsences() {
		return dateAbsence;
	}

	public void setDateAbsences(String dateAbsence) {
		this.dateAbsence = dateAbsence;
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

	public int getNbreAbsence() {
		return nbreAbsence;
	}

	public void setNbreAbsence(int nbreAbsence) {
		this.nbreAbsence = nbreAbsence;
	}
}
