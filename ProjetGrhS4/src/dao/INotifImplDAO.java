package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import beans.Notif;

public class INotifImplDAO implements INotifDAO {

	@Override
	public void changeNotif(String valeur) {
		Connection connection=DAOFACTORY.getConnection();
		try {
			PreparedStatement ps=connection.prepareStatement("UPDATE notif SET nomNotif =? where idNotif=1");
			if(valeur.equals("0")) {
			ps.setString(1, "");
			}
			else {
			ps.setString(1, valeur);
			}
			ps.executeUpdate();
	        ps.close();
					}
		catch(SQLException e) {
			e.getStackTrace();
		}
	}

	@Override
	public Notif getNotif() {
		Notif notif=new Notif();
		Connection connection=DAOFACTORY.getConnection();
		try {
			PreparedStatement ps=connection.prepareStatement("Select count(*) from messageemploye where notification=?");
			ps.setString(1, "new");
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
			notif.setIdNotif(1);
			if(rs.getString("count(*)").equals("0")) {
				notif.setNomNotif("");
			}
			else {
			notif.setNomNotif(rs.getString("count(*)"));}
			System.out.println("nombre de notif : "+notif.getNomNotif());
			}
					}
		catch(SQLException e) {
			e.getStackTrace();
		}
		return notif;
	}

}
