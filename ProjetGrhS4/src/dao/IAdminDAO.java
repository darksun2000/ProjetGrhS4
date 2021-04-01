package dao;

import beans.Admin;

public interface IAdminDAO {

	public Admin getAdmin(String login, String pwd);	
	public boolean login(String login, String pwd);
	public Admin chercherAdmin(String loginAdmin);
	public void modifierAdmin(Admin ad);
	public Admin getAdmin(); 
	public boolean login(String login);
	public String loginMdp(String login);
}
