package dao;

public interface IGmailEnvoieDAO {

	public void sendFromGMail(String from, String pass, String[] to,
			String subject, String body) ;
}
