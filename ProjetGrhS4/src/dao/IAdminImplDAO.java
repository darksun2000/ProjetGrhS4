package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import beans.Admin;

public class IAdminImplDAO implements IAdminDAO {
 
	@Override
	public Admin getAdmin(String login, String pwd) {
		Connection connection= DAOFACTORY.getConnection();
		System.out.println("login "+login+" mdp : " +pwd);
		Admin c  = new Admin();
		try {
			PreparedStatement ps = connection.prepareStatement 
					("SELECT *  FROM admin  WHERE loginAdmin=? and mdpAdmin=?");	
			ps.setString(1, login);
			ps.setString(2, pwd);
            ResultSet rs = ps.executeQuery();
			
			if(rs.next()){
				c.setIdAdmin(rs.getInt("idAdmin"));
				c.setLoginAdmin(rs.getString("loginAdmin"));
				c.setMdpAdmin(rs.getString("mdpAdmin"));
				c.setEmailAdmin(rs.getString("emailAdmin"));
				c.setTelAdmin(rs.getString("telAdmin"));
				c.setPhotoAdmin(rs.getString("photoAdmin"));
			}			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return c;
	}
	
	@Override
	public Admin getAdmin() {
		Connection connection= DAOFACTORY.getConnection();
		Admin c  = new Admin();
		try {
			PreparedStatement ps = connection.prepareStatement 
					("SELECT *  FROM admin  WHERE idAdmin=?");	
			ps.setString(1, "1");
            ResultSet rs = ps.executeQuery();
			
			if(rs.next()){
				c.setIdAdmin(rs.getInt("idAdmin"));
				c.setLoginAdmin(rs.getString("loginAdmin"));
				c.setMdpAdmin( rs.getString("mdpAdmin"));
				c.setEmailAdmin(rs.getString("emailAdmin"));
				c.setTelAdmin(rs.getString("telAdmin"));
				c.setPhotoAdmin(rs.getString("photoAdmin"));
			}			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return c;
	}


	@Override
	public boolean login(String login, String pwd) {
		boolean a=false;		
		System.out.println(login +" "+ pwd);
		Connection connection = DAOFACTORY.getConnection();
		try {
			PreparedStatement ps  = connection.prepareStatement("SELECT mdpAdmin FROM admin WHERE loginAdmin=? ");
			ps.setString(1, login);
			ResultSet rs = ps.executeQuery();
			if(rs.next() && (rs.getString("mdpAdmin")).equals(pwd) ){
				a=true;	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return a;
	}
	@Override
	public boolean login(String login) {
		boolean a=false;
		Connection connection = DAOFACTORY.getConnection();
		try {
			PreparedStatement ps  = connection.prepareStatement("SELECT mdpAdmin FROM admin WHERE loginAdmin=? ");
			ps.setString(1, login);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				a=true;	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return a;
	}
	
	@Override
	public String loginMdp(String login) {
		String mdp="";
		Connection connection = DAOFACTORY.getConnection();
		try {
			PreparedStatement ps  = connection.prepareStatement("SELECT mdpAdmin FROM admin WHERE loginAdmin=? ");
			ps.setString(1, login);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				mdp=rs.getString("mdpAdmin");	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mdp;
	}

	@Override
	public void modifierAdmin(Admin ad) {
		Connection connexion = DAOFACTORY.getConnection();
		try {
			PreparedStatement ps=connexion.prepareStatement("update admin \r\n" + 
					"set  loginAdmin=? , mdpAdmin=? , emailAdmin=? , telAdmin=? , photoAdmin=?;");
			
			ps.setString(1, ad.getLoginAdmin());
			ps.setString(2, ad.getMdpAdmin());
			ps.setString(3, ad.getEmailAdmin());
			ps.setString(4, ad.getTelAdmin());
			ps.setString(5, ad.getPhotoAdmin());
			
			ps.executeUpdate();
	        ps.close();
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("error");
		}
	}

	@Override
	public Admin chercherAdmin(String loginAdmin) {
		Admin ad = new Admin() ; 
		
		Connection connexion = DAOFACTORY.getConnection();
		try {
			PreparedStatement ps = connexion.prepareStatement( 
					" select * from admin where loginAdmin=? ");
			ps.setString(1, loginAdmin);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				ad  = new Admin();
				ad.setIdAdmin(rs.getInt("idAdmin"));
				ad.setLoginAdmin(rs.getString("loginAdmin"));
				ad.setMdpAdmin(rs.getString("mdpAdmin"));
				ad.setEmailAdmin(rs.getString("emailAdmin"));
				ad.setTelAdmin(rs.getString("telAdmin"));
				ad.setPhotoAdmin(rs.getString("photoAdmin"));
				System.out.println("chercher admin :"+rs.getString("photoAdmin"));
				
			}
			  ps.close();


		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ad;
	}
	}

	

