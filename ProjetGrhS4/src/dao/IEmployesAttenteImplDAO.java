package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Employes;
import beans.EmployesAttente;

public class IEmployesAttenteImplDAO implements IEmployesAttenteDAO {

	@Override
	public void ajouterEmploye(EmployesAttente em) {
		// TODO Auto-generated method stub
		Connection connexion = DAOFACTORY.getConnection();
		try {
			PreparedStatement ps = connexion.prepareStatement(
					" insert into employesattente(nomEmploye,emailEmploye,dateNaissanceEmploye,mdpEmploye,cniEmploye)  values(?,?,?,?,?)");
			
			ps.setString(1, em.getNomEmploye());
			ps.setString(2, em.getEmailEmploye());
			ps.setString(3, em.getDateNaissanceEmploye());
			ps.setString(4, em.getMdpEmploye());
			ps.setString(5, em.getCniEmploye());
			ps.executeUpdate();
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("error");
		}
	}

	@Override
	public EmployesAttente getEmploye(int idEmployesAttente) {
		EmployesAttente em = new EmployesAttente();
		Connection connexion = DAOFACTORY.getConnection();
		try {
			PreparedStatement ps = connexion.prepareStatement(" select * from employesattente where idEmployesAttente=? ");
			ps.setInt(1, idEmployesAttente);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				em = new EmployesAttente();
				em.setIdEmployesAttente(rs.getInt("idEmployesAttente"));
				em.setNomEmploye(rs.getString("nomEmploye"));
				em.setEmailEmploye(rs.getString("emailEmploye"));
				em.setDateNaissanceEmploye(rs.getString("dateNaissanceEmploye"));
				em.setMdpEmploye( rs.getString("mdpEmploye"));
				em.setCniEmploye(rs.getString("cniEmploye"));
			}
			ps.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return em;
	}
	
	@Override
	public void accepterEmploye(int idEmployesAttente) {
		// TODO Auto-generated method stub
		IEmployeDAO employeMetier=new IEmployeImplDAO();
		IEmployesAttenteDAO employeAttenteMetier=new IEmployesAttenteImplDAO();
		Employes employe=new Employes();
		EmployesAttente employeAttente=new EmployesAttente();
		employeAttente=employeAttenteMetier.getEmploye(idEmployesAttente);
		employe.setNomEmploye(employeAttente.getNomEmploye());
		employe.setEmailEmploye(employeAttente.getEmailEmploye());
		employe.setDateNaissanceEmploye(employeAttente.getDateNaissanceEmploye());
		employe.setCniEmploye(employeAttente.getCniEmploye());
		employe.setMdpEmploye(employeAttente.getMdpEmploye());
		employe.setPhotoEmploye("person.jpg");
		employe.setSalaireEmploye(0);
		employe.setNumT(employeMetier.getNewNumT());
		employeMetier.ajouterEmploye(employe);
		declinerEmploye(idEmployesAttente);
	}

	@Override
	public void declinerEmploye(int idEmployesAttente) {
		// TODO Auto-generated method stub
		Connection connexion = DAOFACTORY.getConnection();
		try {
		PreparedStatement ps = connexion.prepareStatement("delete  from employesattente where  idemployesattente=? ; ");
		ps.setInt(1, idEmployesAttente);
		ps.executeUpdate();
		ps.close();

	} catch (Exception e) {
		e.printStackTrace();
		System.out.println("error");
	}
	}

	@Override
	public List<EmployesAttente> listeEmployeAttente() {
		List<EmployesAttente> emListe=new ArrayList<EmployesAttente>();
		Connection connection = DAOFACTORY.getConnection();
		try {
			PreparedStatement ps=connection.prepareStatement("Select * from employesattente");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				EmployesAttente em =new EmployesAttente();
				em.setIdEmployesAttente(rs.getInt("idEmployesAttente"));
				em.setNomEmploye(rs.getString("nomEmploye"));
				em.setEmailEmploye(rs.getString("emailEmploye"));
				em.setMdpEmploye(rs.getString("mdpEmploye"));
				em.setDateNaissanceEmploye(rs.getString("dateNaissanceEmploye"));
				em.setCniEmploye(rs.getString("cniEmploye"));
				System.out.println(em);
				emListe.add(em);
			}
			ps.close();
		}
		catch(Exception e) {
			e.getStackTrace();
		}
		return emListe;
	}

	@Override
	public int getNbreEmployeAttente() {
		Connection connexion = DAOFACTORY.getConnection();
		int n = 0;
		try {
			PreparedStatement ps = connexion.prepareStatement("select count(idEmployesAttente) from employesattente  ; ");

			ResultSet res = ps.executeQuery();
			while (res.next()) {
				n = res.getInt("count(idEmployesAttente)");
			}
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("error");
		}

		return n;
	}

	
}
