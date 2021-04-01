package dao;

import java.util.List;

import beans.Employes;
import beans.MessageEmploye;



public interface IMessageEmployeDao {

	public void EnvoyerMessageA(MessageEmploye messageEmploye);
	public List<MessageEmploye> ListeMessagesE(String nomEmploye) ;
	public List<MessageEmploye> ListeMessagesE() ;
    public void supprimerMessage(int id) ; 
    public MessageEmploye get_Message(int id);
    public int getNbreMessages();
	void EnvoyerMessageE(MessageEmploye messageClient);
	List<MessageEmploye> ListeMessagesA();
	public void eteindreNotif(int idMessage);
	public int getNbreNotif();
	public int getNbreMessages(String nomEmploye);
	public int getNbreNotif(String nomEmploye);
	public void EnvoyerMessageAtout(MessageEmploye messageClient);
	public List<MessageEmploye> ListeMessagesAnotif();
	public Employes getEmployeMessage(MessageEmploye msg);
	public void supprimerToutMessage();
	
}
