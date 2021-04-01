package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import beans.Employes;
import beans.MessageEmploye;

public class IMessageEmployeImpl implements IMessageEmployeDao {

	@Override
	public void EnvoyerMessageE(MessageEmploye messageClient) {
		Connection connexion = DAOFACTORY.getConnection() ; 
        PreparedStatement ps = null;

		try {
            ps = connexion.prepareStatement(
            		"INSERT INTO messageEmploye(nomEmploye,message,sujetMessage,dateMessage,indiceEmpAdm,notification,attachement,sizeAtt,type,nomAttachement) VALUES(?,?,?,?,?,?,?,?,?,?);");
            
            
            ps.setString(1, messageClient.getNomEmploye());
            ps.setString(2, messageClient.getMessage());
            ps.setString(3, messageClient.getSujetMessage());
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			   LocalDateTime now = LocalDateTime.now();
			  String date=dtf.format(now);
			
            ps.setString(4, date);
            ps.setString(5, "1");
            ps.setString(6, "new");
            ps.setString(7,messageClient.getAttachement());
            ps.setString(8, messageClient.getSizeAtt());
            ps.setString(9, messageClient.getType());
            ps.setString(10, messageClient.getNomAttachement());
           
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
	}

	@Override
	public List<MessageEmploye> ListeMessagesA() {
		List<MessageEmploye> messages = new ArrayList<MessageEmploye>() ; 
		Connection conn = DAOFACTORY.getConnection() ; 
		try {
			PreparedStatement ps = conn.prepareStatement(
			           "select * from messageEmploye WHERE indiceEmpAdm=1 ORDER BY idMessage DESC; ");
			ResultSet rs = ps.executeQuery() ; 
			while(rs.next()) {
				MessageEmploye  M = new MessageEmploye();
				M.setIdMessage(rs.getInt("idMessage"));
				M.setNomEmploye(rs.getString("nomEmploye"));
				M.setMessage(rs.getString("message"));
				M.setSujetMessage(rs.getString("sujetMessage"));
				M.setDateMessage(rs.getString("dateMessage"));
				M.setIndiceEmpAdm(rs.getInt("indiceEmpAdm"));
				M.setNotification(rs.getString("Notification"));
				messages.add(M) ; 
			}
			ps.close(); 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return messages;
	}
	
	
	@Override
	public List<MessageEmploye> ListeMessagesAnotif() {
		IMessageEmployeDao messageMetier = new IMessageEmployeImpl();
		List<MessageEmploye> messages1 = messageMetier.ListeMessagesA();
		List<MessageEmploye> messages = new ArrayList<MessageEmploye>();
		System.out.println(messages1.size()+"--------------------------");
		if(messages1.isEmpty()) {
			
		}
		else if(messages1.size()==1){messages.add(messages1.get(0));}
		     else if(messages1.size()==2){messages.add(messages1.get(0));messages.add(messages1.get(1));}
		          else {
	    messages.add(messages1.get(0));
	    messages.add(messages1.get(1));
	    messages.add(messages1.get(2));
	    System.out.println(messages);
	    }
		return messages;
	}
	

	@Override
	public void supprimerMessage(int id) {
		Connection conn = DAOFACTORY.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement(
               "delete from messageEmploye where idMessage = ?");
			ps.setInt(1, id);
			ps.executeUpdate() ;

			ps.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}		
	}

	@Override
	public void supprimerToutMessage() {
		Connection conn = DAOFACTORY.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement(
               "delete from messageEmploye");
			ps.executeUpdate() ;

			ps.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}		
	}

	
	@Override
	public MessageEmploye get_Message(int idMessage) {
		MessageEmploye M = null ; 
		Connection conn = DAOFACTORY.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement( 
					" select * from messageEmploye where idMessage=? ");
			ps.setInt(1, idMessage);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				M  = new MessageEmploye();
				M.setIdMessage(Integer.parseInt(rs.getString("idMessage")));
				M.setNomEmploye(rs.getString("nomEmploye"));
				M.setMessage(rs.getString("message"));
				M.setSujetMessage(rs.getString("sujetMessage"));
				M.setDateMessage(rs.getString("dateMessage"));
				M.setIndiceEmpAdm(rs.getInt("indiceEmpAdm"));
				M.setNotification(rs.getString("Notification"));
				M.setAttachement(rs.getString("attachement"));
				M.setSizeAtt(rs.getString("sizeAtt"));
				M.setType(rs.getString("type"));
				M.setNomAttachement(rs.getString("nomAttachement"));
				
			}
				ps.close(); 	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return M;
	}

	@Override
	public int getNbreMessages() {
		Connection connexion = DAOFACTORY.getConnection();
		int n = 0 ;
		try {
			PreparedStatement ps=connexion.prepareStatement("select count(idMessage) from messageemploye where indiceEmpAdm=?  ; "); 
            ps.setString(1,1+"");
			ResultSet res = ps.executeQuery();
			while(res.next()) {
				n = res.getInt("count(idMessage)");
			}ps.close();
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("error");
		}
	    	
			return n ;
	}
	
	@Override
	public int getNbreMessages(String nomEmploye) {
		Connection connexion = DAOFACTORY.getConnection();
		int n = 0 ;
		try {
			PreparedStatement ps=connexion.prepareStatement("select count(idMessage) from messageemploye WHERE nomEmploye=? And indiceEmpAdm=?; "); 
            ps.setString(1, nomEmploye);
            ps.setString(2, "2");
			ResultSet res = ps.executeQuery();
			while(res.next()) {
				n = res.getInt("count(idMessage)");
			}ps.close();
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("error");
		}
	    	
			return n ;
	}

	@Override
	public void EnvoyerMessageA(MessageEmploye messageClient) {
		Connection connexion = DAOFACTORY.getConnection() ; 
        PreparedStatement ps = null;

		try {
            ps = connexion.prepareStatement(
            		"INSERT INTO messageEmploye(nomEmploye,message,sujetMessage,dateMessage,indiceEmpAdm,notification,attachement,sizeAtt,type,nomAttachement) VALUES(?,?,?,?,?,?,?,?,?,?);");
            
            
            ps.setString(1, messageClient.getNomEmploye());
            ps.setString(2, messageClient.getMessage());
            ps.setString(3, messageClient.getSujetMessage());
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			   LocalDateTime now = LocalDateTime.now();
			  String date=dtf.format(now);
			
            ps.setString(4, date);
            ps.setString(5, "2");
            ps.setString(6,"new.");
            ps.setString(7, messageClient.getAttachement());
            ps.setString(8, messageClient.getSizeAtt());
            ps.setString(9, messageClient.getType());
            ps.setString(10,messageClient.getNomAttachement());
            
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
		
	}

	
	@Override
	public void EnvoyerMessageAtout(MessageEmploye messageClient) {
		Connection connexion = DAOFACTORY.getConnection() ; 
        PreparedStatement ps = null;
        IEmployeDAO employeMetier= new IEmployeImplDAO();
       String listeNom[] = new String[employeMetier.getNbrEmployes()];
       listeNom=employeMetier.listeEmployes2();
       for (int i = 0; i < listeNom.length; i++) {
		
	
		try {
            ps = connexion.prepareStatement(
            		"INSERT INTO messageEmploye(nomEmploye,message,sujetMessage,dateMessage,indiceEmpAdm,notification,attachement,sizeAtt,type,nomAttachement) VALUES(?,?,?,?,?,?,?,?,?,?);");
            
            
            ps.setString(1, listeNom[i]);
            ps.setString(2, messageClient.getMessage());
            ps.setString(3, messageClient.getSujetMessage());
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			   LocalDateTime now = LocalDateTime.now();
			  String date=dtf.format(now);
			
            ps.setString(4, date);
            ps.setString(5, "2");
            ps.setString(6,"new.");
            ps.setString(7, messageClient.getAttachement());
            ps.setString(8, messageClient.getSizeAtt());
            ps.setString(9, messageClient.getType());
            ps.setString(10,  messageClient.getNomAttachement());
           
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
       }
	}

	
	
	@Override
	public List<MessageEmploye> ListeMessagesE(String nomEmploye) {
		List<MessageEmploye> messages = new ArrayList<MessageEmploye>() ; 
		Connection conn = DAOFACTORY.getConnection() ; 
		try {
			PreparedStatement ps = conn.prepareStatement(
			           "select * from messageEmploye WHERE indiceEmpAdm=2 AND nomEmploye=? ; ");
			ps.setString(1, nomEmploye);
			ResultSet rs = ps.executeQuery() ; 
			while(rs.next()) {
				MessageEmploye  M = new MessageEmploye();
				M.setIdMessage(rs.getInt("idMessage"));
				M.setNomEmploye(rs.getString("nomEmploye"));
				M.setMessage(rs.getString("message"));
				M.setSujetMessage(rs.getString("sujetMessage"));
				M.setDateMessage(rs.getString("dateMessage"));
				M.setIndiceEmpAdm(rs.getInt("indiceEmpAdm"));
				M.setNotification(rs.getString("Notification"));
				messages.add(M) ; 
			}
			ps.close(); 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return messages;
	}
	
	@Override
	public List<MessageEmploye> ListeMessagesE() {
		List<MessageEmploye> messages = new ArrayList<MessageEmploye>() ; 
		Connection conn = DAOFACTORY.getConnection() ; 
		try {
			PreparedStatement ps = conn.prepareStatement(
			           "select * from messageEmploye WHERE indiceEmpAdm=2 ; ");
			
			ResultSet rs = ps.executeQuery() ; 
			while(rs.next()) {
				MessageEmploye  M = new MessageEmploye();
				M.setIdMessage(rs.getInt("idMessage"));
				M.setNomEmploye(rs.getString("nomEmploye"));
				M.setMessage(rs.getString("message"));
				M.setSujetMessage(rs.getString("sujetMessage"));
				M.setDateMessage(rs.getString("dateMessage"));
				M.setIndiceEmpAdm(rs.getInt("indiceEmpAdm"));
				M.setNotification(rs.getString("Notification"));
				messages.add(M) ; 
			}
			ps.close(); 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return messages;
	}
	
	@Override
	public void eteindreNotif(int idMessage) {
		Connection connection=DAOFACTORY.getConnection();
		try {
			PreparedStatement ps=connection.prepareStatement("UPDATE messageemploye SET notification =? where idMessage=?");
			ps.setString(1, "");
			ps.setString(2, idMessage+"");
			ps.executeUpdate();
	        ps.close();
					}
		catch(SQLException e) {
			e.getStackTrace();
		}
	}
	
	@Override
	public int getNbreNotif() {
		Connection connection=DAOFACTORY.getConnection();
		int n = 0;
		try {
			PreparedStatement ps=connection.prepareStatement("SELECT COUNT(*) from messageemploye where notification=?");
			ps.setString(1, "new");
            
			ResultSet rs=ps.executeQuery();
			n=rs.getInt("count(*)");
	        System.out.println(n);
	        ps.close();
					}
		catch(SQLException e) {
			e.getStackTrace();
		}
		return n;
	}
	
	@Override
	public int getNbreNotif(String nomEmploye) {
		Connection connection=DAOFACTORY.getConnection();
		System.out.println("nom employe nbre de notif :"+nomEmploye.trim());
		int n = 0;
		try {
			PreparedStatement ps=connection.prepareStatement("SELECT COUNT(idMessage) from messageemploye where notification=? and nomEmploye=?");
			System.out.println("ca passer preparedstatement");
			ps.setString(1, "new.");
			System.out.println("ca passer new.");
            ps.setString(2, nomEmploye);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				n = rs.getInt("count(idMessage)");
			}ps.close();
	        System.out.println("nbre notif"+n);
	        ps.close();
					}
		catch(SQLException e) {
			e.getStackTrace();
			System.out.println("erreur nbre de notif");
		}
		return n;
	}
	
	@Override
	public Employes getEmployeMessage(MessageEmploye msg){
		Connection connection = DAOFACTORY.getConnection();
		Employes em = new Employes();
		try {
			PreparedStatement ps = connection.prepareStatement("SELECT * FROM employes Where nomEmploye=?");
			ps.setString(1, msg.getNomEmploye());
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				em.setIdEmploye(rs.getInt("idEmploye"));
				em.setNomEmploye(rs.getString("nomEmploye"));
				em.setEmailEmploye(rs.getString("emailEmploye"));
				em.setDateNaissanceEmploye(rs.getString("dateNaissanceEmploye"));
				em.setSalaireEmploye(rs.getFloat("salaireEmploye"));
				em.setMdpEmploye(rs.getString("mdpEmploye"));
				em.setCniEmploye(rs.getString("cniEmploye"));
				em.setPhotoEmploye(rs.getString("photoEmploye"));
			}
			
		}
		catch(SQLException e) {
			e.getStackTrace();
		}
		return em;
	}
	
	

}
