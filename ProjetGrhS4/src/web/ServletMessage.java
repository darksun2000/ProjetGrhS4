package web;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import beans.Employes;
import beans.MessageEmploye;
import dao.IAdminDAO;
import dao.IAdminImplDAO;
import dao.IEmployeDAO;
import dao.IEmployeImplDAO;
import dao.IMessageEmployeDao;
import dao.IMessageEmployeImpl;
import dao.INotifDAO;
import dao.INotifImplDAO;

/**
 * Servlet implementation class ServletMessage
 */
@WebServlet(urlPatterns = {"/supprimerToutMessage","/signaleInfo","/EnvoyerMessageE","/EnvoyerMessageA","/listeMessageA","/listeMessageE","/afficherMessage","/afficherMessageE","/supprimerMessage","/supprimerMessageE","/ecrireMessage"})
public class ServletMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IMessageEmployeDao messageMetier = new IMessageEmployeImpl();
	private INotifDAO notifMetier = new INotifImplDAO();
	private IAdminDAO adminMetier = new IAdminImplDAO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletMessage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getServletPath()!=null) {
			
			if(request.getServletPath().equals("/ecrireMessage")) {
				System.out.println("j ai entre");
				IEmployeDAO employeMetier=new IEmployeImplDAO();
				request.setAttribute("employes", employeMetier.listeEmployes());
				this.getServletContext().getRequestDispatcher("/EcrireMessage.jsp").forward(request, response);
			}
			
		//Envoyer un message
		
		if(request.getServletPath().equals("/EnvoyerMessageE")) {
			System.out.println(11);
			try {
				ServletFileUpload sf= new ServletFileUpload(new DiskFileItemFactory());
				System.out.println("ba9i mawsel1");
				System.out.println(request.getParameter("nomEmploye"));
			List<FileItem> fi=sf.parseRequest(request);
			System.out.println(fi);
			MessageEmploye message = new MessageEmploye();
			message.setNomEmploye(request.getParameter("nomEmploye"));
			message.setSujetMessage(fi.get(0).getString());
			System.out.println(fi);
			message.setMessage(fi.get(1).getString());
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			   LocalDateTime now = LocalDateTime.now();
			  String date=dtf.format(now);
			message.setDateMessage(date);
			message.setIndiceEmpAdm(1);
			System.out.println("imporant! : " +fi.get(3).getName());
			System.out.println(fi.get(3).getContentType());
				
			if(!fi.get(3).getName().equals("")) {
				
				InputStream ips = fi.get(3).getInputStream();
				byte [] bytephoto = new byte[ips.available()];
				ips.read(bytephoto);
				byte[] encodeBase64Document1 = Base64.encodeBase64(bytephoto);
				String base64Encoded = new String(encodeBase64Document1, "UTF-8");
				message.setAttachement(base64Encoded);
				String nom=fi.get(3).getName();
				File file = new File("WebContent\\dist\\img\\" + nom);
				message.setSizeAtt((file.length()/1024.0)+"");
				message.setNomAttachement(nom);
				message.setType(fi.get(3).getContentType());
				}
			else {
				message.setAttachement("");
				message.setSizeAtt("");
				message.setNomAttachement("");
				message.setType("");
			}
				messageMetier.EnvoyerMessageE(message);
			}
			
			catch(Exception e) {
				e.getStackTrace();
				System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
				
			}
			
			
			notifMetier.changeNotif(messageMetier.getNbreNotif()+"");
            System.out.println("la derniere ligne de servlet Envoyer msg");
			this.getServletContext().getRequestDispatcher("/HomeEmploye.jsp").forward(request, response);
			
		}
		
		
		if(request.getServletPath().equals("/EnvoyerMessageA")) {
			System.out.println(11);
			try{
				ServletFileUpload sf= new ServletFileUpload(new DiskFileItemFactory());
				List<FileItem> fi=sf.parseRequest(request);
			String nomEmploye=fi.get(0).getString();
			
				
			request.getSession().setAttribute("Messagenotif", messageMetier.ListeMessagesAnotif());
			
			MessageEmploye message = new MessageEmploye();
            message.setNomEmploye(nomEmploye);
			message.setSujetMessage(fi.get(1).getString());
			message.setMessage(fi.get(2).getString());
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			   LocalDateTime now = LocalDateTime.now();
			  String date=dtf.format(now);
			message.setDateMessage(date);
			message.setIndiceEmpAdm(2);
			
            System.out.println(12);
            
            
				
				System.out.println("ba9i mawsel2");
				
				System.out.println("ba9i mawsel1");
		System.out.println(fi);
		System.out.println(fi.get(2).getString());
		if(!fi.get(4).getName().equals("")) {
			
			InputStream ips = fi.get(4).getInputStream();
			byte [] bytephoto = new byte[ips.available()];
			ips.read(bytephoto);
			byte[] encodeBase64Document1 = Base64.encodeBase64(bytephoto);
			String base64Encoded = new String(encodeBase64Document1, "UTF-8");
			message.setAttachement(base64Encoded);
			String nom=fi.get(4).getName();
			File file = new File("WebContent\\dist\\img\\" + nom);
			message.setSizeAtt((file.length()/1024.0)+"");
			message.setNomAttachement(nom);
			message.setType(fi.get(4).getContentType());
			}
		else {
			message.setAttachement("");
			message.setSizeAtt("");
			message.setNomAttachement("");
			message.setType("");
		}
				System.out.println(nomEmploye);
	            if(nomEmploye.equals("Touts les employés")) {
	            	System.out.println("********************************************");
	            	messageMetier.EnvoyerMessageAtout(message);}
				else {
					System.out.println("---------------------------------------------");
				messageMetier.EnvoyerMessageA(message);}
	            request.setAttribute("cond", 1);
				this.getServletContext().getRequestDispatcher("/listeMessageA").forward(request, response);
			}
			catch(Exception e) {
				System.out.println(e.getStackTrace());
				
				
			}
            
		}
		
		//signalé erreur info
		if(request.getServletPath().equals("/signaleInfo")) {
			System.out.println(11);
			MessageEmploye message = new MessageEmploye();
			message.setNomEmploye(request.getParameter("nomEmploye"));
			String champs=request.getParameter("champs");
			String SujetMessage="Erreur dans une information";
			String Message="je crois le champs "+champs+" n'est pas exacte ou contient un erreur , veuillez le reverifier Monsieur l' admin .";
			message.setSujetMessage(SujetMessage);
			message.setMessage(Message);
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			   LocalDateTime now = LocalDateTime.now();
			  String date=dtf.format(now);
			message.setDateMessage(date);
			message.setIndiceEmpAdm(1);
			message.setAttachement("");
			
			messageMetier.EnvoyerMessageE(message);
			notifMetier.changeNotif(messageMetier.getNbreNotif()+"");
            System.out.println("la derniere ligne de servlet Envoyer msg");
			this.getServletContext().getRequestDispatcher("/HomeEmploye.jsp").forward(request, response);
			
		}
		
	//Liste des messages	
		if(request.getServletPath().equals("/listeMessageA")) {
			
			request.setAttribute("messages", messageMetier.ListeMessagesA());
			
			
			this.getServletContext().getRequestDispatcher("/ListeMessage.jsp").forward(request, response);
		}
if(request.getServletPath().equals("/listeMessageE")) {
	IAdminDAO adminMetier = new IAdminImplDAO();
			request.setAttribute("Admin", adminMetier.getAdmin());
			request.setAttribute("messages", messageMetier.ListeMessagesE());
			this.getServletContext().getRequestDispatcher("/ListeMessage.jsp").forward(request, response);
		}
		
    //Afficher le message
		
		if (request.getServletPath().equals("/afficherMessage")) {
			IEmployeDAO employeMetier = new IEmployeImplDAO();
			int idMessage = Integer.parseInt(request.getParameter("idMessage"));
			messageMetier.eteindreNotif(idMessage);
			MessageEmploye message = messageMetier.get_Message(idMessage);
			Employes employe=employeMetier.getEmploye(message.getNomEmploye());
			System.out.println("nom attachement : "+messageMetier.get_Message(idMessage).getAttachement());
			request.setAttribute("message", messageMetier.get_Message(idMessage));
			request.setAttribute("employe", employe);
			request.getSession().setAttribute("notif", notifMetier.getNotif().getNomNotif());
			notifMetier.changeNotif(notifMetier.getNotif().getNomNotif());
			request.getSession().setAttribute("Messagenotif", messageMetier.ListeMessagesAnotif());
			this.getServletContext().getRequestDispatcher("/AfficherMessage.jsp").forward(request, response);
			request.setAttribute("idMessage", idMessage);
			System.out.println(idMessage);
            
		}
		if (request.getServletPath().equals("/afficherMessageE")) {
			
			int idMessage = Integer.parseInt(request.getParameter("idMessage"));
			MessageEmploye message=messageMetier.get_Message(idMessage);
			messageMetier.eteindreNotif(idMessage);
			request.setAttribute("message", messageMetier.get_Message(idMessage));
			int nbreNotif=messageMetier.getNbreNotif(request.getParameter("nomEmploye"));
			request.getSession().setAttribute("nbreNotif", nbreNotif);
			request.setAttribute("message", message);
			request.setAttribute("Admin", adminMetier.getAdmin());
			this.getServletContext().getRequestDispatcher("/AfficherMessageEmploye.jsp").forward(request, response);
			
            
		}
		
	//Supprimer le message
		if (request.getServletPath().equals("/supprimerMessage")) {
			int idMessage = Integer.parseInt(request.getParameter("idMessage"));
			messageMetier.supprimerMessage(idMessage);
			request.getSession().setAttribute("Messagenotif", messageMetier.ListeMessagesAnotif());
			this.getServletContext().getRequestDispatcher("/listeMessageA").forward(request, response);
		}
		if (request.getServletPath().equals("/supprimerMessageE")) {
			int idMessage = Integer.parseInt(request.getParameter("idMessage"));
			request.setAttribute("nomEmploye", request.getParameter("nomEmploye"));
			messageMetier.supprimerMessage(idMessage);
			this.getServletContext().getRequestDispatcher("/HomeEmploye").forward(request, response);
		}
		
		
		//---------------------------------------------------Supprimer tout les messages-------------------------------//
		if(request.getServletPath().equals("/supprimerToutMessage")) {
			messageMetier.supprimerToutMessage();

			this.getServletContext().getRequestDispatcher("/HomeAdmin").forward(request, response);
		}
		
		
	}
		}

}
