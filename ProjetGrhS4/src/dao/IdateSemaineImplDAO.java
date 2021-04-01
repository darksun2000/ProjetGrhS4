package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.*;
import java.time.temporal.TemporalAdjusters;

public class IdateSemaineImplDAO implements IdateSemaineDAO{

	@Override
	public String PreviousFriday() {
		LocalDate dt = LocalDate.now(); 
		return dt.with(TemporalAdjusters.previous(DayOfWeek.FRIDAY))+"".trim();
	}

	@Override
	public void autoRotation() {
		IEmployeImplDAO employeMetier = new IEmployeImplDAO();
		employeMetier.RotationRight();
	}

	@Override
	public String MyFriday() {
		Connection connection =DAOFACTORY.getConnection();
		String date = null;
		try {
			PreparedStatement ps = connection.prepareStatement("Select DateVendredi from datesemaine where idDateSemaine=1");
			ResultSet res = ps.executeQuery();
			while (res.next()) {
				date=res.getString("DateVendredi");
			}
			ps.close();
		}
		catch(Exception e) {
			e.getStackTrace();
		}
		return date;
	}
	
	@Override
	public int auto() {
		Connection connection =DAOFACTORY.getConnection();
		int auto=0;
		try {
			PreparedStatement ps = connection.prepareStatement("Select auto from datesemaine where idDateSemaine=1");
			ResultSet res = ps.executeQuery();
			while (res.next()) {
				auto=res.getInt("auto");
			}
			ps.close();
		}
		catch(Exception e) {
			e.getStackTrace();
		}
		return auto;
	}
	
	@Override
	public void setAuto(int checked) {
		Connection connection =DAOFACTORY.getConnection();
		try {
			PreparedStatement ps = connection.prepareStatement("Update datesemaine set auto=? where idDateSemaine=1");

			ps.setInt(1, checked);

			ps.executeUpdate();
			ps.close();
		}
		catch(Exception e) {
			e.getStackTrace();
		}
	}
	
	@Override
	public void ModifierFriday() {
		Connection connection =DAOFACTORY.getConnection();
		try {
			PreparedStatement ps = connection.prepareStatement("Update datesemaine set DateVendredi=? where idDateSemaine=1");

			ps.setString(1, PreviousFriday());

			ps.executeUpdate();
			ps.close();
		}
		catch(Exception e) {
			e.getStackTrace();
		}
	}
	@Override
	public Month getMonth(int mois) {
		switch(mois) {
		case 1 : return Month.JANUARY;
		case 2 : return Month.FEBRUARY;
		case 3 : return Month.MARCH;
		case 4 : return Month.APRIL;
		case 5 : return Month.MAY;
		case 6 : return Month.JUNE;
		case 7 : return Month.JULY;
		case 8 : return Month.AUGUST;
		case 9 : return Month.SEPTEMBER;
		case 10 : return Month.OCTOBER;
		case 11 : return Month.NOVEMBER;
		case 12 : return Month.DECEMBER;
		
		}
		return null;
	}
}
