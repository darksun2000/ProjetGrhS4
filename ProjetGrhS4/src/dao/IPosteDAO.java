package dao;


public interface IPosteDAO {

	
	int[]  getNbrSemaine(int numT);
	int [] getNbrPosteJr(int jours,int numT);
	int getNbrJrLundi(String date);
	public int getNbrJrAnN(String date);
	public int getNbrJrAnP(String date);
	public int getNumTCorr(int numT,String date) ;

}
