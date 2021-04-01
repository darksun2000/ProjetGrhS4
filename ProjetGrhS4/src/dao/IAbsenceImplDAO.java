package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.time.temporal.TemporalAdjusters;
import java.util.ArrayList;
import java.util.List;

import beans.Absences;

public class IAbsenceImplDAO implements IAbsenceDAO {

	private IEmployeImplDAO employeMetier = new IEmployeImplDAO();
	private ICaseTabDAO caseTabMetier = new ICaseTabImplDAO();
	
	@Override
	public void ajouterAbsence(Absences ab) {
		Connection connexion = DAOFACTORY.getConnection();
		try {
			PreparedStatement ps=connexion.prepareStatement(" insert into absences(motifAbsence,natureAbsence,dateAbsence,nomEmploye) values(?,?,?,?)" ); 
			if(ab.getMotifAbsences()==null) {
				ps.setString(1, "Pas de motif");
			}
			else {
			ps.setString(1, ab.getMotifAbsences());
			}
			ps.setString(2, ab.getNatureAbsences());
			ps.setString(3, ab.getDateAbsences());
			ps.setString(4, ab.getNomEmploye());
			
			
			ps.executeUpdate();
	        ps.close();
	}catch (Exception e) {
		e.printStackTrace();
		System.out.println("error");
	}
	}

	@Override
	public List<Absences> listeAbsences() {
		List<Absences> absences = new ArrayList<Absences>();
		
		Connection connexion = DAOFACTORY.getConnection();
		try {
			PreparedStatement ps=connexion.prepareStatement("select  nomEmploye , count(idAbsence) from absences   group by nomEmploye ;");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Absences ab=new Absences();
				ab.setNomEmploye(rs.getString("nomEmploye"));
				ab.setNbreAbsence(rs.getInt("count(idAbsence)"));
				absences.add(ab);
			}
			ps.close();
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("error");
		}
		return absences;
	}
	
	public List<Absences> listeAbsences1(String nomEmploye) {
		List<Absences> absences = new ArrayList<Absences>();
		
		Connection connexion = DAOFACTORY.getConnection();
		try {
			PreparedStatement ps=connexion.prepareStatement("select * from absences Where nomEmploye=? ;");
			ps.setString(1, nomEmploye);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Absences ab=new Absences();
				ab.setIdAbsences(rs.getInt("idAbsence"));
				ab.setNomEmploye(nomEmploye);
				ab.setDateAbsences(rs.getString("dateAbsence"));
				ab.setMotifAbsences(rs.getString("motifAbsence"));
				ab.setNatureAbsences(rs.getString("natureAbsence"));
				absences.add(ab);
			}
			ps.close();
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("error");
		}
		return absences;
	}
	
	@Override
	public void supprimerAbsence(int idAbsence) {
		Connection connexion = DAOFACTORY.getConnection();
		try {
			PreparedStatement ps=connexion.prepareStatement("delete from absences\r\n" + 
					"where idAbsence=? ; ");
			ps.setInt(1, idAbsence);
			ps.executeUpdate();
	        ps.close();
			
		
	}catch (Exception e) {
		e.printStackTrace();
		System.out.println("error");
	}
	}

	@Override
	public int getNbreAbsences() {
		// TODO Auto-generated method stub
		Connection connection=DAOFACTORY.getConnection();
		int n=0;
		try {
			PreparedStatement ps=connection.prepareStatement("select count(idAbsence) from absences  ; ");
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
			 n=rs.getInt("count(idAbsence)");
			}ps.close();
			
			
		}
		catch(Exception e) {
			e.getStackTrace();
		}
		return n;
	}
	
	public int getNbreAbsences(String nomEmploye) {
		// TODO Auto-generated method stub
		Connection connection=DAOFACTORY.getConnection();
		int n=0;
		try {
			PreparedStatement ps=connection.prepareStatement("select count(idAbsence) from absences WHERE nomEmploye=?  ; ");
			ps.setString(1, nomEmploye);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
			 n=rs.getInt("count(idAbsence)");
			}ps.close();
			
			
		}
		catch(Exception e) {
			e.getStackTrace();
		}
		return n;
	}

	@Override
	public void supprimerAbsenceGeneral() {
		// TODO Auto-generated method stub
		Connection connection=DAOFACTORY.getConnection();
		try {
			PreparedStatement ps=connection.prepareStatement("Delete from absences");
			ps.executeUpdate();
			ps.close();
		}
		catch(Exception e) {
			e.getStackTrace();
		}
	}
	
	
	
	@Override
	public void supprimerAbsenceEmploye(String nomEmploye) {
		// TODO Auto-generated method stub
		Connection connection=DAOFACTORY.getConnection();
		try {
			PreparedStatement ps=connection.prepareStatement("Delete from absences where nomEmploye=?");
			System.out.println("supprimer absence--------------------");
			ps.setString(1, nomEmploye);
			ps.executeUpdate();
			ps.close();
		}
		catch(Exception e) {
			e.getStackTrace();
		}
	}

	@Override
	public Absences getAbsence(int idAbsence) {
		Connection connection =DAOFACTORY.getConnection();
		Absences absence=new Absences();
		try {
			PreparedStatement ps = connection.prepareStatement("Select * from absences where idAbsence=?");
			ps.setInt(1, idAbsence);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				absence.setIdAbsences(idAbsence);
				absence.setDateAbsences(rs.getString("dateAbsence"));
				absence.setNomEmploye(rs.getString("nomEmploye"));
				absence.setNatureAbsences(rs.getString("natureAbsence"));
				absence.setMotifAbsences(rs.getString("motifAbsence"));
				
			}
			ps.close();
			
		}
		catch(Exception e) {
			e.getStackTrace();
		}
		return absence;
	}

	@Override
	public void modifierAbsence(Absences absence) {
		Connection connection =DAOFACTORY.getConnection();
		try {
			PreparedStatement ps = connection.prepareStatement("UPDATE absences SET motifAbsence=?, natureAbsence=?, dateAbsence=?, nomEmploye=? where idAbsence=?");
			ps.setString(1, absence.getMotifAbsences());
			ps.setString(2, absence.getNatureAbsences());
			ps.setString(3, absence.getDateAbsences());
			ps.setString(4, absence.getNomEmploye());
			ps.setInt(5, absence.getIdAbsences());
			ps.executeUpdate();
			ps.close();
		}
		catch(Exception e) {
			e.getStackTrace();
		}
		
	}

	@Override
	public List<Absences> listeTotaleAbsences() {
		List<Absences> absences = new ArrayList<Absences>();
		
		Connection connexion = DAOFACTORY.getConnection();
		try {
			PreparedStatement ps=connexion.prepareStatement("select  * from absences;");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Absences ab=new Absences();
				ab.setNomEmploye(rs.getString("nomEmploye"));
				ab.setDateAbsences(rs.getString("dateAbsence"));
				ab.setMotifAbsences(rs.getString("motifAbsence"));
				ab.setNatureAbsences(rs.getString("natureAbsence"));
				ab.setIdAbsences(rs.getInt("idAbsence"));
				absences.add(ab);
			}
			ps.close();
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("error");
		}
		return absences;
	}

	@Override
	public void absenceSurEmploi(String date, int i) {
		System.out.println("+++++++++++++++++++++++++debut methode absenceSurEmploi+++++++++++++++++++++++++++++");
		i--;
		caseTabMetier.setCaseNonAbsent();
		// absence dans l'emploi du temps--------------
		List<Absences> absences = listeTotaleAbsences();
		
		String dateEntiere = "";
		String dateFinString = "";
		String dateDebutString = "";
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-d");
		LocalDate dateFinAbsence = null;
		LocalDate dateDebutAbsence = null;
		LocalDate dateSemaine = LocalDate.parse(date, formatter);
		LocalDate dateSemaineProchaine = LocalDate.parse(dateSemaine.with(TemporalAdjusters.next(DayOfWeek.MONDAY))+"".trim(), formatter);
		System.out.println("date cette semaine : "+dateSemaine);
		System.out.println("date semaine prochaine : "+dateSemaineProchaine);
		
		int numT = -1;
		int start =1;
		//cleaning
		for (int j = absences.size()-1; j >=0; j--) {
			dateEntiere = absences.get(j).getDateAbsences();
			dateFinString = dateEntiere.split(" ")[2];
			dateDebutString = dateEntiere.split(" ")[0];
			dateFinAbsence = LocalDate.parse(dateFinString, formatter);
			dateDebutAbsence = LocalDate.parse(dateDebutString, formatter);
			
			if (dateFinAbsence.isBefore(dateSemaine) || dateDebutAbsence.isAfter(dateSemaineProchaine)) {
				caseTabMetier.setCaseNonAbsentByNumT(employeMetier.getEmploye(absences.get(j).getNomEmploye()).getNumT());
				System.out.println("les absences enlevées : "+absences.get(j).getDateAbsences() + " car : "+dateFinAbsence.isBefore(dateSemaine)+" || "+dateDebutAbsence.isAfter(dateSemaineProchaine));
				absences.remove(j);
			} else {
				System.out.println("les absences non enlevées : "+absences.get(j).getDateAbsences());
				int joursSemFinAbs = (int) ChronoUnit.DAYS.between(dateSemaine ,dateFinAbsence);
				int joursDebAbsSem = (int) ChronoUnit.DAYS.between( dateSemaine,dateDebutAbsence);
				System.out.println("les jours qui restent sont : "+joursSemFinAbs);
				System.out.println("les jours qui sont passés sont : "+joursDebAbsSem);
				
				//----------------------
				
				numT = employeMetier.getEmploye(absences.get(j).getNomEmploye()).getNumT();
				for (int ji = 1; ji <= i; ji++) {
					numT++;
					if(numT > employeMetier.getNbrEmployes()) numT=1;
				}
				if(joursSemFinAbs >= 5 && joursDebAbsSem<=0) {
					System.out.println("les absences qui durent toute la semaine : "+absences.get(j).getDateAbsences());
					System.out.println("numT de l'absent = "+numT);
					caseTabMetier.setCaseAbsentByNumT(numT);
				}
				else {
					System.out.println("les absences qui ne durent pas toute la semaine : "+absences.get(j).getDateAbsences());
					if(joursDebAbsSem>0 && joursDebAbsSem<=5) {
					start=joursDebAbsSem;
					System.out.println("start change with absence : "+absences.get(j).getDateAbsences() + " , start = "+start);
					}
					else start=1;
					if(joursSemFinAbs == joursDebAbsSem++) {
						caseTabMetier.setCaseAbsent(numT, joursDebAbsSem);
						System.out.println("absence en jour : "+ joursDebAbsSem + " et numT : " + numT);
						System.out.println();
					}
					else {
					joursSemFinAbs++;
					System.out.println("end change with absence : "+absences.get(j).getDateAbsences() + " , end = "+joursSemFinAbs);

					for (int jour = start; jour <= joursSemFinAbs ; jour++) {
						caseTabMetier.setCaseAbsent(numT, jour);
					}
					}
				}
				
			}

		}
		
		System.out.println("+++++++++++++++++++++++++fin methode absenceSurEmploi+++++++++++++++++++++++++++++");

	}
}
