package dao;

import java.util.List;

import beans.Absences;

public interface IAbsenceDAO {

	public void ajouterAbsence(Absences ab);
	public List<Absences> listeAbsences();
	public List<Absences> listeTotaleAbsences();
	public void supprimerAbsence(int idAbsence);
	public void supprimerAbsenceGeneral();
	public List<Absences> listeAbsences1(String nomEmploye);
	public int getNbreAbsences();
	public int getNbreAbsences(String nomEmploye);
	public void supprimerAbsenceEmploye(String nomEmploye); 
	public Absences getAbsence(int idAbsence);
	public void modifierAbsence(Absences absence);
	public void absenceSurEmploi(String date, int i);
}
