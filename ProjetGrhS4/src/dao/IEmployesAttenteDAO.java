package dao;

import java.util.List;

import beans.EmployesAttente;

public interface IEmployesAttenteDAO {

	void ajouterEmploye(EmployesAttente empa);
	public EmployesAttente getEmploye(int idEmployesAttente);
	void accepterEmploye(int idEmployesAttente);
	void declinerEmploye(int idEmployesAttente);
	List<EmployesAttente> listeEmployeAttente();
	int getNbreEmployeAttente();
}
