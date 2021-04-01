package beans;

public class MessageEmploye {

	private int idMessage;
	private String message;
	private String nomEmploye;
	private String sujetMessage;
	private String dateMessage;
	private int indiceEmpAdm;
	private String notification;
	private String attachement;
	private String sizeAtt;
	private String type;
	private String nomAttachement;
	
	
	public String getNomAttachement() {
		return nomAttachement;
	}
	public void setNomAttachement(String nomAttachement) {
		this.nomAttachement = nomAttachement;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSizeAtt() {
		return sizeAtt;
	}
	public void setSizeAtt(String sizeAtt) {
		this.sizeAtt = sizeAtt;
	}
	public String getAttachement() {
		return attachement;
	}
	public void setAttachement(String attachement) {
		this.attachement = attachement;
	}
	public MessageEmploye() {
		super();
	}
	public MessageEmploye(int idMessage, String message) {
		super();
		this.idMessage = idMessage;
		
		this.message = message;
	}
	public int getIdMessage() {
		return idMessage;
	}
	public void setIdMessage(int idMessage) {
		this.idMessage = idMessage;
	}
	
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getNomEmploye() {
		return nomEmploye;
	}
	public void setNomEmploye(String nomEmploye) {
		this.nomEmploye = nomEmploye;
	}
	public String getSujetMessage() {
		return sujetMessage;
	}
	public void setSujetMessage(String sujetMessage) {
		this.sujetMessage = sujetMessage;
	}
	public String getDateMessage() {
		return dateMessage;
	}
	public void setDateMessage(String dateMessage) {
		this.dateMessage = dateMessage;
	}
	public int getIndiceEmpAdm() {
		return indiceEmpAdm;
	}
	public void setIndiceEmpAdm(int indiceEmpAdm) {
		this.indiceEmpAdm = indiceEmpAdm;
	}
	public String getNotification() {
		return notification;
	}
	public void setNotification(String notification) {
		this.notification = notification;
	}
	
	
	
}
