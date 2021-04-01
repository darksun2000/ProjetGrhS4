package dao;

import beans.CaseTab;

public interface ICaseTabDAO {
 
	public void setCaseNull(int idcasetab);
	public void setCaseFull(int idcasetab ,String nomEmploye);
	public CaseTab[] getTabComplet();
	public void setTabNull();
	public void setCaseAbsentByNumT(int numT);
	public void setCaseAbsent(int numT, int jour);
	public boolean isCaseNull(int idcasetab);
	public void setCaseNonAbsent(int numT, int jour);
	public void setCaseNonAbsentByNumT(int numT);
	public void setCaseNonAbsent();
	
}
