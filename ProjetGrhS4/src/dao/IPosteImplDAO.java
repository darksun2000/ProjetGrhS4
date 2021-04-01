package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.Month;
import java.time.temporal.TemporalAdjusters;

public class IPosteImplDAO implements IPosteDAO{

	@Override
	public int[] getNbrPosteJr(int jour, int numT) {
		Connection connection = DAOFACTORY.getConnection();
		int[] postes =new int[4];
		if(numT<=10 || jour<=5) {
		try {
			PreparedStatement ps = connection.prepareStatement("select * from poste where numT=? AND numJ=?");
			ps.setInt(1, numT);
			ps.setInt(2, jour);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
			postes[0]=rs.getInt("ACCEUIL");
			postes[1]=rs.getInt("EPSE");
			postes[2]=rs.getInt("AUTOEMPLOI");		
			postes[3]=rs.getInt("ARE");
			}
			ps.close();
		}
		catch(Exception e) {
			e.getStackTrace();
		}
		
		
		}
		else { 
			postes[0]=0;
			postes[1]=0;
			postes[2]=0;		
			postes[3]=0;
		}
		return postes;
	}

	@Override
	public int[] getNbrSemaine(int numT) {
		int[] postes =getNbrPosteJr(1,numT);
		int[] postesAux =new int[4];
		for (int i = 2; i <= 5; i++) {
			postesAux=getNbrPosteJr(i,numT);
			for (int j = 0; j < postesAux.length; j++) {
				
				postes[j]+=postesAux[j];
			}
		}
		return postes;
	}



	@Override
	public int getNbrJrLundi(String date) {
		IdateSemaineDAO dateSemaineMetier= new IdateSemaineImplDAO();
		int nbrjrAn=0;
		String[] dateComp=date.split("-");
		for (int i = 1; i <= 366; i++) {
		 String dt=LocalDate.ofYearDay(Integer.parseInt(dateComp[0]), i)+"";
		 if(dt.equals(date)) {
			 nbrjrAn=i;
			 break;
		 }
		}
		Month mymonth=dateSemaineMetier.getMonth(Integer.parseInt(dateComp[1]));
		LocalDate dt=LocalDate.of(Integer.parseInt(dateComp[0]), mymonth, Integer.parseInt(dateComp[2]));
		String dateM = dt.with(TemporalAdjusters.previous(DayOfWeek.MONDAY))+"".trim();
		String[] dateCompM=dateM.split("-");
		int nbrjrAnM=0;
		for (int i = 1; i <= 366; i++) {
		 String dtM=LocalDate.ofYearDay(Integer.parseInt(dateCompM[0]), i)+"";
		 if(dtM.equals(dateM)) {
			 nbrjrAnM=i;
			 break;
		 }
		}
		return nbrjrAn-nbrjrAnM;
	}
	
	@Override
	public int getNbrJrAnP(String date) {
		String[] dateComp=date.split("-");
		IdateSemaineDAO dateSemaineMetier= new IdateSemaineImplDAO();
		int nbrjrAnM=0;
		Month mymonth=dateSemaineMetier.getMonth(Integer.parseInt(dateComp[1]));
		LocalDate dt=LocalDate.of(Integer.parseInt(dateComp[0]), mymonth, Integer.parseInt(dateComp[2]));
		String dateM = dt.with(TemporalAdjusters.previous(DayOfWeek.MONDAY))+"".trim();
		String[] dateCompM=dateM.split("-");
		
		for (int i = 1; i <= 366; i++) {
		 String dtM=LocalDate.ofYearDay(Integer.parseInt(dateCompM[0]), i)+"";
		 if(dtM.equals(dateM)) {
			 nbrjrAnM=i;
			 break;
		 }
		}
		return nbrjrAnM;
	}
	@Override
	public int getNbrJrAnN(String date) {
		String[] dateComp=date.split("-");
		IdateSemaineDAO dateSemaineMetier= new IdateSemaineImplDAO();
		int nbrjrAnM=0;
		Month mymonth=dateSemaineMetier.getMonth(Integer.parseInt(dateComp[1]));
		LocalDate dt=LocalDate.of(Integer.parseInt(dateComp[0]), mymonth, Integer.parseInt(dateComp[2]));
		String dateM = dt.with(TemporalAdjusters.next(DayOfWeek.MONDAY))+"".trim();
		String[] dateCompM=dateM.split("-");
		
		for (int i = 1; i <= 366; i++) {
		 String dtM=LocalDate.ofYearDay(Integer.parseInt(dateCompM[0]), i)+"";
		 if(dtM.equals(dateM)) {
			 nbrjrAnM=i;
			 break;
		 }
		}
		return nbrjrAnM;
	}
	
	@Override
		public int getNumTCorr(int numT,String date) {
		IEmployeDAO employeMetier=new IEmployeImplDAO();
			LocalDate ld = LocalDate.now();
			String dateM1 = ld.with(TemporalAdjusters.previous(DayOfWeek.MONDAY))+"".trim();
			/////////////////////////////////////////////////////
			String[] dateComp=date.split("-");
			IdateSemaineDAO dateSemaineMetier= new IdateSemaineImplDAO();
			Month mymonth=dateSemaineMetier.getMonth(Integer.parseInt(dateComp[1]));
			LocalDate dt=LocalDate.of(Integer.parseInt(dateComp[0]), mymonth, Integer.parseInt(dateComp[2]));
			String dateM2=dt.with(TemporalAdjusters.previous(DayOfWeek.MONDAY))+"".trim();
			//////////////////////////////////////////////////////
			int nbrjrAnM1=0;
			for (int i = 1; i <= 366; i++) {
				 String dtM=LocalDate.ofYearDay(Integer.parseInt(dateComp[0]), i)+"";
				 if(dtM.equals(dateM1)) {
					 nbrjrAnM1=i;
					 break;
				 }
			}
			////////////////////////////////////////////////////////
			int nbrjrAnM2=0;
			for (int i = 1; i <= 366; i++) {
				 String dtM=LocalDate.ofYearDay(Integer.parseInt(dateComp[0]), i)+"";
				 if(dtM.equals(dateM2)) {
					 nbrjrAnM2=i;
					 break;
				 }
			}
			////////////////////////////////////////////////////////
			int nbreSemaine=(nbrjrAnM1-nbrjrAnM2)/7;
			for (int i = 0; i < nbreSemaine; i++) {
				numT--;
				if(numT==0) {
					numT=employeMetier.getNbrEmployes();
				}
			}
			return numT;
		}
	}

