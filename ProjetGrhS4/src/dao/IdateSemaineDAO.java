package dao;

import java.time.Month;

public interface IdateSemaineDAO {

	String PreviousFriday();
	void autoRotation();
	public String MyFriday();
	public int auto();
	public void ModifierFriday();
	public void setAuto(int checked);
	public Month getMonth(int mois);
}
