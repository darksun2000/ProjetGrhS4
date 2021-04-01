package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import beans.CaseTab;

public class ICaseTabImplDAO implements ICaseTabDAO {

	@Override
	public void setCaseNull(int idcaseTab) {
		// TODO Auto-generated method stub
		Connection connection = DAOFACTORY.getConnection();
		try {
			PreparedStatement ps = connection.prepareStatement("update casetab set nomEmploye='' where idcaseTab=?");
			ps.setInt(1, idcaseTab);
			ps.executeUpdate();
			ps.close();
		}
		catch(Exception e) {
			e.getStackTrace();
		}
	}

	@Override
	public void setCaseFull(int idcaseTab, String nomEmploye) {
		// TODO Auto-generated method stub
		Connection connection = DAOFACTORY.getConnection();
		try {
			PreparedStatement ps = connection.prepareStatement("update casetab set nomEmploye=? where idcaseTab=?");
			ps.setString(1," + "+ nomEmploye);
			ps.setInt(2, idcaseTab);
			ps.executeUpdate();
			ps.close();
		}
		catch(Exception e) {
			e.getStackTrace();
		}
	}
	
	@Override
	public void setCaseAbsent(int numT, int jour) {
		// TODO Auto-generated method stub
		Connection connection = DAOFACTORY.getConnection();
		try {
			PreparedStatement ps = connection.prepareStatement("update casetab set isAbsent=? where numT=? AND jour=?");
			ps.setInt(1,1);
			ps.setInt(2, numT);
			ps.setInt(3,jour);
			System.out.println("++++++++++++++++++++++++++++++++++++");
			int row = ps.executeUpdate();
			System.out.println("rows affected = "+row);
			ps.close();
		}
		catch(Exception e) {
			e.getStackTrace();
			System.out.println("erreur dans : setCaseAbsent ");
		}
	}
	
	@Override
	public void setCaseNonAbsent(int numT, int jour) {
		// TODO Auto-generated method stub
		Connection connection = DAOFACTORY.getConnection();
		try {
			PreparedStatement ps = connection.prepareStatement("update casetab set isAbsent=? where numT=? AND jour=?");
			ps.setInt(1,0);
			ps.setInt(2, numT);
			ps.setInt(3,jour);
			ps.executeUpdate();
			ps.close();
		}
		catch(Exception e) {
			e.getStackTrace();
			System.out.println("erreur dans : setCaseNonAbsent");

		}
	}
	
	@Override
	public void setCaseAbsentByNumT(int numT) {
		// TODO Auto-generated method stub
		Connection connection = DAOFACTORY.getConnection();
		int absent = 1;
		try {
			PreparedStatement ps = connection.prepareStatement("update casetab set isAbsent=? where numT=?");
			ps.setInt(1,absent);
			ps.setInt(2, numT);
			int rows = ps.executeUpdate();
			ps.close();
			System.out.println("rows affected = "+rows);
			System.out.println("toutes les cases de numT = "+numT+" sont devenues "+ absent);
		}
		catch(Exception e) {
			e.getStackTrace();
			System.out.println("erreur dans : setCaseAbsentByNumT");

		}
	}

	@Override
	public void setCaseNonAbsentByNumT(int numT) {
		// TODO Auto-generated method stub
		Connection connection = DAOFACTORY.getConnection();
		try {
			PreparedStatement ps = connection.prepareStatement("update casetab set isAbsent=? where numT=?");
			ps.setInt(1,0);
			ps.setInt(2, numT);
			ps.executeUpdate();
			ps.close();
		}
		catch(Exception e) {
			e.getStackTrace();
			System.out.println("erreur dans : setCaseNonAbsentByNumT");

		}
	}
	
	
	@Override
	public void setCaseNonAbsent() {
		// TODO Auto-generated method stub
		Connection connection = DAOFACTORY.getConnection();
		try {
			PreparedStatement ps = connection.prepareStatement("update casetab set isAbsent=?");
			ps.setInt(1,0);
			ps.executeUpdate();
			ps.close();
		}
		catch(Exception e) {
			e.getStackTrace();
			System.out.println("erreur dans : setCaseNonAbsent");

		}
	}
	
	@Override
	public CaseTab[] getTabComplet() {
		// TODO Auto-generated method stub
		CaseTab[] cases = new CaseTab[42];
		int i=0;
		Connection connection = DAOFACTORY.getConnection();
		try {
			PreparedStatement ps = connection.prepareStatement("Select * from casetab");
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				CaseTab ct = new CaseTab();
				ct.setIdcaseTab(rs.getInt("idcaseTab"));
				ct.setNomEmploye(rs.getString("nomEmploye"));
				ct.setIsAbsent(rs.getInt("isAbsent"));
				ct.setNumT(rs.getInt("numT"));
				ct.setJour(rs.getInt("jour"));
				ct.setNumLigne(rs.getInt("numLigne"));
				cases[i]=ct;
				i++;
			}
			ps.close();
		}
		catch(Exception e) {
			e.getStackTrace();
		}
		return cases;
	}

	@Override
	public void setTabNull() {
		for (int i = 0; i < 42; i++) {
			setCaseNull(i+1);
		}
		
	}

	@Override
	public boolean isCaseNull(int idcaseTab) {
		Connection connection = DAOFACTORY.getConnection();
		try {
			PreparedStatement ps = connection.prepareStatement("Select * from casetab where idcaseTab=?");
			ps.setInt(1, idcaseTab);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				
				if(rs.getString("nomEmploye").equals(""))
					return true;
				
			}
			ps.close();
		}
		catch(Exception e) {
			e.getStackTrace();
		}
		return false;
	}

	
	
}
