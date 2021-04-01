package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.IEmployeDAO;
import beans.Employes;

public class IEmployeImplDAO implements IEmployeDAO {

	@Override
	public void ajouterEmploye(Employes em) {
		Connection connexion = DAOFACTORY.getConnection();
		try {
			PreparedStatement ps = connexion.prepareStatement(
					" insert into employes(idEmploye,nomEmploye,emailEmploye,dateNaissanceEmploye,salaireEmploye,mdpEmploye,cniEmploye,numT,photoEmploye)  values(?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, em.getIdEmploye());
			ps.setString(2, em.getNomEmploye());
			ps.setString(3, em.getEmailEmploye());
			ps.setString(4, em.getDateNaissanceEmploye());
			ps.setFloat(5, em.getSalaireEmploye());
			ps.setString(6, em.getMdpEmploye());
			ps.setString(7, em.getCniEmploye());
			ps.setInt(8, em.getNumT());
			ps.setString(9, em.getPhotoEmploye());
			ps.executeUpdate();
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("error");
		}

	}

	@Override
	public void modifierEmploye(Employes em) {
		Connection connexion = DAOFACTORY.getConnection();
		try {
			PreparedStatement ps = connexion.prepareStatement("update employes \r\n"
					+ "set  nomEmploye=? , emailEmploye=? , dateNaissanceEmploye=? , salaireEmploye=?  , mdpEmploye=?  , cniEmploye=? , photoEmploye=? \r\n"
					+ "where nomEmploye=? ;");

			ps.setString(1, em.getNomEmploye());
			ps.setString(2, em.getEmailEmploye());
			ps.setString(3, em.getDateNaissanceEmploye());
			ps.setFloat(4, em.getSalaireEmploye());
			ps.setString(5, em.getMdpEmploye());
			ps.setString(6, em.getCniEmploye());

			ps.setString(7, em.getPhotoEmploye());
			ps.setString(8, em.getNomEmploye());

			ps.executeUpdate();
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("error");
		}

	}

	@Override
	public void modifierEmployeNumT(Employes em) {
		Connection connexion = DAOFACTORY.getConnection();
		try {
			PreparedStatement ps = connexion.prepareStatement("update employes set  numT=? where idEmploye=? ;");

			ps.setInt(1, em.getNumT());
			ps.setInt(2, em.getIdEmploye());

			ps.executeUpdate();
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("error");
		}

	}

	@Override
	public List<Employes> listeEmployes() {
		List<Employes> employes = new ArrayList<Employes>();
		Connection connexion = DAOFACTORY.getConnection();
		try {
			PreparedStatement ps = connexion.prepareStatement("select * from employes");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Employes em = new Employes();
				em.setIdEmploye(rs.getInt("idEmploye"));
				em.setNomEmploye(rs.getString("nomEmploye"));
				em.setEmailEmploye(rs.getString("emailEmploye"));
				em.setDateNaissanceEmploye(rs.getString("dateNaissanceEmploye"));
				em.setSalaireEmploye(rs.getFloat("salaireEmploye"));
				em.setMdpEmploye(rs.getString("mdpEmploye"));
				em.setCniEmploye(rs.getString("cniEmploye"));
				em.setPhotoEmploye(rs.getString("photoEmploye"));
				em.setNumT(rs.getInt("numT"));

				System.out.println("ana");
				employes.add(em);
			}
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("error");
		}
		return employes;
	}

	@Override
	public List<Employes> listeEmployesNumT() {
		List<Employes> employes = new ArrayList<Employes>();
		Connection connexion = DAOFACTORY.getConnection();
		try {
			PreparedStatement ps = connexion.prepareStatement("select * from employes where numT>10");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Employes em = new Employes();
				em.setIdEmploye(rs.getInt("idEmploye"));
				em.setNomEmploye(rs.getString("nomEmploye"));
				em.setEmailEmploye(rs.getString("emailEmploye"));
				em.setDateNaissanceEmploye(rs.getString("dateNaissanceEmploye"));
				em.setSalaireEmploye(rs.getFloat("salaireEmploye"));
				em.setMdpEmploye(rs.getString("mdpEmploye"));
				em.setCniEmploye(rs.getString("cniEmploye"));
				em.setPhotoEmploye(rs.getString("photoEmploye"));
				em.setNumT(rs.getInt("numT"));

				System.out.println("ana");
				employes.add(em);
			}
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("error");
		}
		return employes;
	}
	
	@Override
	public List<Integer> listeAgeEmployes() {
		List<Integer> age = new ArrayList<Integer>();
		Connection connexion = DAOFACTORY.getConnection();
		try {
			PreparedStatement ps = connexion.prepareStatement("select dateNaissance from employes");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				String aux = rs.getString("dateNaissanceEmploye");
				String m[] = aux.split("-");
				aux = m[0];
				int anneeN = Integer.parseInt(aux);
				int moisN = Integer.parseInt(m[1]);
				int jourN = Integer.parseInt(m[2]);
				aux = java.time.LocalDate.now() + "";
				String a[] = aux.split("-");
				int anneeA = Integer.parseInt(a[0]);
				int moisA = Integer.parseInt(a[1]);
				int jourA = Integer.parseInt(a[2]);
				if (moisN > moisA) {
					age.add(anneeA - anneeN);
				} else if (moisN == moisA) {
					if (jourA > jourN) {
						age.add(anneeA - anneeN - 1);
					} else
						age.add(anneeA - anneeN);
				} else
					age.add(anneeA - anneeN - 1);
			}
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("error");
		}
		return age;
	}

	@Override
	public List<Employes> listeEmployes(String nomEmploye) {
		List<Employes> employes = new ArrayList<Employes>();
		Connection connexion = DAOFACTORY.getConnection();
		try {
			PreparedStatement ps = connexion.prepareStatement("select * from employes where nomEmploye!=?");
			ps.setString(1, nomEmploye);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Employes em = new Employes();
				em.setIdEmploye(rs.getInt("idEmploye"));
				em.setNomEmploye(rs.getString("nomEmploye"));
				em.setEmailEmploye(rs.getString("emailEmploye"));
				em.setDateNaissanceEmploye(rs.getString("dateNaissanceEmploye"));
				em.setSalaireEmploye(rs.getFloat("salaireEmploye"));
				em.setMdpEmploye(rs.getString("mdpEmploye"));
				em.setCniEmploye(rs.getString("cniEmploye"));
				em.setPhotoEmploye(rs.getString("photoEmploye"));

				employes.add(em);
			}
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("error");
		}
		return employes;
	}

	@Override
	public void supprimerEmploye(int idEmploye) {
		Connection connexion = DAOFACTORY.getConnection();
		// correction de numT
		IEmployeDAO employeMetier = new IEmployeImplDAO();
		int numTsup = employeMetier.getEmploye(idEmploye).getNumT();
		List<Employes> em = employeMetier.listeEmployes();
		System.out.println("<wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww>");
		try {
//----------------------------------Reglage de numT------------------------------------------------//
			for (int i = 0; i < employeMetier.getNbrEmployes(); i++) {
				System.out.println("wwwwwwwwwwwwwww:" + em.get(i).getNumT());
				System.out.println(numTsup);
				if (em.get(i).getNumT() > numTsup) {
					System.out.println("ooooooooooooooooooooooooooooo2");
					PreparedStatement p = connexion.prepareStatement("Update employes set numT=? where idEmploye=?");
					int n = em.get(i).getNumT() - 1;
					p.setInt(1, n);
					System.out.println("ooooooooooooooooooooooooooooo3");

					p.setInt(2, em.get(i).getIdEmploye());
					p.executeUpdate();
					p.close();
				}

			}

//----------------------------------supprimer Employe-------------------------------------------//			

			PreparedStatement ps = connexion.prepareStatement("delete  from employes where  idEmploye=? ; ");
			ps.setInt(1, idEmploye);
			ps.executeUpdate();
			ps.close();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("error");
		}

	}

	@Override
	public Employes chercherEmploye(int idEmploye) {
		Employes em = new Employes();
		Connection connexion = DAOFACTORY.getConnection();
		try {
			PreparedStatement ps = connexion.prepareStatement(" select * from employes where idEmploye=? ");
			ps.setInt(1, idEmploye);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				em = new Employes();
				em.setIdEmploye(rs.getInt("idEmploye"));
				em.setNomEmploye(rs.getString("nomEmploye"));
				em.setEmailEmploye(rs.getString("emailEmploye"));
				em.setDateNaissanceEmploye(rs.getString("dateNaissanceEmploye"));
				em.setSalaireEmploye(rs.getFloat("salaireEmploye"));
				em.setMdpEmploye( rs.getString("mdpEmploye"));
				em.setCniEmploye(rs.getString("cniEmploye"));
				em.setPhotoEmploye(rs.getString("photoEmploye"));
			}
			ps.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return em;
	}

	@Override
	public boolean login1(String login, String pwd) {
		boolean a = false;
		Connection connection = DAOFACTORY.getConnection();
		try {
			System.out.println("login: " + login + " mdp: " + pwd + " ");
			PreparedStatement ps = connection.prepareStatement("SELECT mdpEmploye FROM employes WHERE nomEmploye=?");
			ps.setString(1, login);
			ResultSet rs = ps.executeQuery();
			if (rs.next() && rs.getString("mdpEmploye").equals(pwd)) {
				a = true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return a;
	}

	@Override
	public boolean login1(String login) {
		boolean a = false;
		Connection connection = DAOFACTORY.getConnection();
		try {
			PreparedStatement ps = connection.prepareStatement("SELECT mdpEmploye FROM employes WHERE nomEmploye=?");
			ps.setString(1, login);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				a = true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return a;
	}

	@Override
	public String login1Mdp(String nomEmploye) {
		String mdp = "";
		Connection connection = DAOFACTORY.getConnection();
		try {
			PreparedStatement ps = connection.prepareStatement("SELECT mdpEmploye FROM employes WHERE nomEmploye=?");
			ps.setString(1, nomEmploye);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				mdp = rs.getString("mdpEmploye");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mdp;
	}

	@Override
	public Employes getEmploye(String login, String pwd) {
		Connection connection = DAOFACTORY.getConnection();
		Employes em = new Employes();
		try {
			PreparedStatement ps = connection.prepareStatement(
					"SELECT idEmploye, nomEmploye, emailEmploye, dateNaissanceEmploye, salaireEmploye, cniEmploye, mdpEmploye ,photoEmploye FROM employes WHERE nomEmploye=? and mdpEmploye=?");
			ps.setString(1, login);
			ps.setString(2, pwd);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				em.setIdEmploye(rs.getInt("idEmploye"));
				em.setNomEmploye(rs.getString("nomEmploye"));
				em.setDateNaissanceEmploye(rs.getString("dateNaissanceEmploye"));
				em.setEmailEmploye(rs.getString("emailEmploye"));
				em.setSalaireEmploye(rs.getFloat("salaireEmploye"));
				em.setCniEmploye(rs.getString("cniEmploye"));
				em.setMdpEmploye(rs.getString("mdpEmploye"));
				em.setPhotoEmploye(rs.getString("photoEmploye"));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return em;
	}

	public Employes getEmploye(int idEmploye) {
		Connection connection = DAOFACTORY.getConnection();
		Employes em = new Employes();
		try {
			PreparedStatement ps = connection.prepareStatement("SELECT * FROM employes WHERE idEmploye=?");
			ps.setString(1, idEmploye + "".trim());
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				em.setIdEmploye(idEmploye);
				em.setNomEmploye(rs.getString("nomEmploye"));
				em.setDateNaissanceEmploye(rs.getString("dateNaissanceEmploye"));
				em.setEmailEmploye(rs.getString("emailEmploye"));
				em.setSalaireEmploye(rs.getFloat("salaireEmploye"));
				em.setCniEmploye(rs.getString("cniEmploye"));
				em.setMdpEmploye(rs.getString("mdpEmploye"));
				em.setNumT(rs.getInt("numT"));
				em.setPhotoEmploye(rs.getString("photoEmploye"));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return em;

	}

	@Override
	public boolean getEmployeMdp(String nom, String email) {
		Connection connection = DAOFACTORY.getConnection();
		try {
			PreparedStatement ps = connection
					.prepareStatement("SELECT mdpEmploye FROM employes WHERE nomEmploye=? and emailEmploye=?");
			ps.setString(1, nom);
			ps.setString(2, email);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				return true;

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public String[] listeEmployes2() {
		IEmployeDAO employeMetier = new IEmployeImplDAO();
		String[] employes = new String[employeMetier.getNbrEmployes()];
		Connection connexion = DAOFACTORY.getConnection();
		try {
			PreparedStatement ps = connexion
					.prepareStatement("SELECT nomEmploye ,numT FROM employes    order by numT;");
			ResultSet rs = ps.executeQuery();
			int i = 0;
			while (rs.next()) {
				employes[i] = rs.getString("nomEmploye");
				i++;
			}
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("error");
		}
		return employes;
	}

	public int chercherEmpCons(int idEmploye) {
		int em = 0;
		Connection connexion = DAOFACTORY.getConnection();
		try {
			PreparedStatement ps = connexion.prepareStatement(" select numT from employes where idEmploye=? ");
			ps.setInt(1, idEmploye);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				em = rs.getInt("numT");

			}
			ps.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return em;
	}

	public void RotationRight() {
		Connection connexion = DAOFACTORY.getConnection();
		PreparedStatement ps = null;
		IEmployeDAO employeMetier = new IEmployeImplDAO();
		List<Employes> em = employeMetier.listeEmployes();
		int j, k;
		int n = getNbrEmployes();
		try {
			for (int i = 0; i < n; i++) {
				j = chercherEmpCons(em.get(i).getIdEmploye());
				if (j == n)
					k = 1;
				else
					k = j + 1;

				ps = connexion.prepareStatement("update employes set numT = ? where idEmploye = ? ; ");
				ps.setInt(1, k);
				ps.setInt(2, em.get(i).getIdEmploye());
				ps.executeUpdate();

			}
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("error");
		}
	}

	public void RotationLeft() {
		Connection connexion = DAOFACTORY.getConnection();
		PreparedStatement ps = null;
		IEmployeDAO employeMetier = new IEmployeImplDAO();
		List<Employes> em = employeMetier.listeEmployes();
		int j, k;
		int n = getNbrEmployes();
		try {
			for (int i = 1; i <= n; i++) {
				j = chercherEmpCons(em.get(i).getIdEmploye());
				if (j == 1)
					k = n;
				else
					k = j - 1;

				ps = connexion.prepareStatement("update employes set numT = ? where idEmploye = ? ; ");
				ps.setInt(1, k);
				ps.setInt(2, i);
				ps.executeUpdate();

			}
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("error");
		}
	}

	@Override
	public int getNbrEmployes() {
		Connection connexion = DAOFACTORY.getConnection();
		int n = 0;
		try {
			PreparedStatement ps = connexion.prepareStatement("select count(idEmploye) from employes  ; ");

			ResultSet res = ps.executeQuery();
			while (res.next()) {
				n = res.getInt("count(idEmploye)");
			}
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("error");
		}

		return n;
	}

	@Override
	public Employes getEmploye(String nomEmploye) {
		Connection connection = DAOFACTORY.getConnection();
		Employes em = new Employes();
		try {
			PreparedStatement ps = connection.prepareStatement(
					"SELECT * FROM employes WHERE nomEmploye=?");
			ps.setString(1, nomEmploye.trim());
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				em.setIdEmploye(rs.getInt("idEmploye"));
				em.setNomEmploye(rs.getString("nomEmploye"));
				em.setDateNaissanceEmploye(rs.getString("dateNaissanceEmploye"));
				em.setEmailEmploye(rs.getString("emailEmploye"));
				em.setSalaireEmploye(rs.getFloat("salaireEmploye"));
				em.setCniEmploye(rs.getString("cniEmploye"));
				em.setMdpEmploye(rs.getString("mdpEmploye"));
				em.setPhotoEmploye(rs.getString("photoEmploye"));
				em.setNumT(rs.getInt("numT"));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return em;
	}

	@Override
	public int getNewNumT() {
		Connection connection = DAOFACTORY.getConnection();
		int numT = 0;
		try {
			PreparedStatement ps = connection.prepareStatement("SELECT numT FROM employes ORDER BY numT");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				if (numT < rs.getInt("numT")) {
					numT = rs.getInt("numT");
				}

			}
			numT++;
		} catch (SQLException e) {
			e.getStackTrace();
		}
		return numT;
	}

}
