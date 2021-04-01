package web;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
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

import beans.Admin;
import beans.Employes;
import dao.IAbsenceDAO;
import dao.IAbsenceImplDAO;
import dao.IAdminDAO;
import dao.IAdminImplDAO;
import dao.ICaseTabDAO;
import dao.ICaseTabImplDAO;
import dao.IEmployeDAO;
import dao.IEmployeImplDAO;
import dao.IEmployesAttenteDAO;
import dao.IEmployesAttenteImplDAO;
import dao.IMessageEmployeDao;
import dao.IMessageEmployeImpl;
import dao.INotifDAO;
import dao.INotifImplDAO;
import dao.IPosteDAO;
import dao.IPosteImplDAO;
import dao.IdateSemaineDAO;
import dao.IdateSemaineImplDAO;


/**
 * Servlet implementation class ServletAdmin
 */
@WebServlet(urlPatterns = {"/SupprimerSupp","/AjouterSupp","/AjouterSuppPage","/SupprimerAjouterSupp","/editAdmin","/updateAdmin","/ProfilAdmin","/HomeAdmin","/editphotoA","/SupportEmploye","/modifierphotoA","/AutoMvtTab","/ChoixIntervalle","/VoirHistorique"})
public class ServletAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IAdminDAO adminMetier = new IAdminImplDAO();
	private IEmployeDAO employeMetier = new IEmployeImplDAO();
	private IdateSemaineDAO dateSemaineMetier = new IdateSemaineImplDAO();
	private IEmployeDAO employeMetierG = new IEmployeImplDAO();
	private ICaseTabDAO caseTabMetier=new ICaseTabImplDAO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletAdmin() {
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
		if(request.getServletPath().equals("/editAdmin")) {
			
			String loginAdmin = (request.getParameter("loginAdmin"));
			request.setAttribute("admin", adminMetier.chercherAdmin(loginAdmin));
			this.getServletContext().getRequestDispatcher("/ModifierAdmin.jsp").forward(request, response);
		}
		 //Editer un Admin
		if(request.getServletPath().equals("/updateAdmin")) {
			Admin ad = new Admin();
			request.getSession().setAttribute("Admin", adminMetier.chercherAdmin(request.getParameter("ld")));
			
			ad.setLoginAdmin(request.getParameter("loginAdmin"));
			ad.setMdpAdmin(request.getParameter("mdpAdmin"));
			
			
			adminMetier.modifierAdmin(ad);
			
			request.getRequestDispatcher("/HomeAdmin").forward(request, response); 
		}
		//Afficher les infos d'admin
		if(request.getServletPath().equals("/ProfilAdmin")) {
			String loginAdmin = (request.getParameter("loginAdmin"));
			
			request.setAttribute("admin", adminMetier.chercherAdmin(loginAdmin));
			this.getServletContext().getRequestDispatcher("/ProfilAdmin.jsp").forward(request, response);
		}
		
		//satistiques homeAdmin
		if(request.getServletPath().equals("/HomeAdmin")) {
			if(dateSemaineMetier.auto()==1) {
				if(!(dateSemaineMetier.PreviousFriday().equals(dateSemaineMetier.MyFriday()))) {
					dateSemaineMetier.autoRotation();
					dateSemaineMetier.ModifierFriday();
				}
			}
			IEmployeDAO employeMetier=new IEmployeImplDAO();
			IAbsenceDAO absenceMetier=new IAbsenceImplDAO();
			IMessageEmployeDao messageMetier=new IMessageEmployeImpl();
			INotifDAO notifMetier=new INotifImplDAO();
			IEmployesAttenteDAO emMetier=new IEmployesAttenteImplDAO();
			int nbrEmployes=employeMetier.getNbrEmployes();
		    int nbrAbsences=absenceMetier.getNbreAbsences();
		    int nbrMessages=messageMetier.getNbreMessages();
		    int nbrDemandes=emMetier.getNbreEmployeAttente();
		    String notif=notifMetier.getNotif().getNomNotif();
		    request.getSession().setAttribute("Admin", adminMetier.getAdmin());
		    request.setAttribute("nbrEmployes",nbrEmployes);
		    request.setAttribute("nbrAbsences",nbrAbsences);
		    request.setAttribute("nbrMessages",nbrMessages);
		    request.setAttribute("nbrPostes",15-nbrEmployes);
		    request.getSession().setAttribute("notif", notif);
		    request.getSession().setAttribute("notifDemandes", nbrDemandes);
			request.getRequestDispatcher("/HomeAdmin.jsp").forward(request, response); 
		}
		//partie photo admin
		if(request.getServletPath().equals("/editphotoA")) {
			
			String loginAdmin = request.getParameter("loginAdmin").trim();
			request.setAttribute("admin", adminMetier.chercherAdmin(loginAdmin));
			this.getServletContext().getRequestDispatcher("/ModifierPhotoA.jsp").forward(request, response);
			
		}
		
		
		
		
		//modifier photo de l'admin
		if(request.getServletPath().contentEquals("/modifierphotoA")) {
			System.out.println(1);

			try {
				System.out.println(1);

               String loginAdmin = request.getParameter("loginAdmin2").trim();
				System.out.println(loginAdmin);

				Admin ad=adminMetier.chercherAdmin(loginAdmin);
				ServletFileUpload sf = new ServletFileUpload(new DiskFileItemFactory());
				List<FileItem> fi = sf.parseRequest(request);
				System.out.println(1);
				System.out.println(fi);
				for (FileItem item : fi) {
					InputStream ips = item.getInputStream();
					byte [] bytephoto = new byte[ips.available()];
					ips.read(bytephoto);
					byte[] encodeBase64Document1 = Base64.encodeBase64(bytephoto);
					String base64Encoded = new String(encodeBase64Document1, "UTF-8");
					ad.setPhotoAdmin(base64Encoded);
				}
				System.out.println(2);
				
				
				
			adminMetier.modifierAdmin(ad);
				request.getRequestDispatcher("/HomeAdmin").forward(request, response);
			} catch (Exception e) {
				
				e.getStackTrace();

			}
			
			
			
		}
		
		if(request.getServletPath().equals("/AutoMvtTab")) {
			String checkedS = request.getParameter("checked").trim();
			int checked=Integer.parseInt(checkedS);
			dateSemaineMetier.setAuto(checked);
			request.getRequestDispatcher("/consempAGeneral").forward(request, response);
		}
		
		if(request.getServletPath().equals("/ChoixIntervalle")) {
			IEmployeDAO employeMetier=new IEmployeImplDAO();
			request.setAttribute("employes", employeMetier.listeEmployes());
			this.getServletContext().getRequestDispatcher("/ChoixIntervalle.jsp").forward(request, response);
		}
		
		//---------------------------------------------calcul historique-----------------------------------------------------------//
		if(request.getServletPath().equals("/VoirHistorique")) {
			IPosteDAO posteMetier=new IPosteImplDAO();
			IEmployeDAO employeMetier=new IEmployeImplDAO();
			String nomEmploye = request.getParameter("nomEmploye");
			Employes employe=employeMetierG.getEmploye(nomEmploye);
			int numT=employe.getNumT();
			String intervalle=request.getParameter("Intervalle");
			String aux[]=intervalle.trim().split("-");
			String date1[]=new String[3];
			String date2[]=new String[3];
			for (int i = 0; i < date2.length; i++) {
				date1[i]=aux[i].trim();
				date2[i]=aux[i+3].trim();
			}
			numT=posteMetier.getNumTCorr(numT, date2[0]+"-"+date2[1]+"-"+date2[2]);
			int resteSup=posteMetier.getNbrJrLundi(date2[0]+"-"+date2[1]+"-"+date2[2]);
			int resteInf=7-posteMetier.getNbrJrLundi(date1[0]+"-"+date1[1]+"-"+date1[2]);
			int nbrJrAnSup=posteMetier.getNbrJrAnP(date2[0]+"-"+date2[1]+"-"+date2[2]);
			int nbrJrAnInf=posteMetier.getNbrJrAnN(date1[0]+"-"+date1[1]+"-"+date1[2]);
			int nbreSemaine=(nbrJrAnSup-nbrJrAnInf)/7;
			int tabFinal[]= {0,0,0,0};
			for (int i = resteSup; i >= 1; i--) {
				for (int j = 0; j < tabFinal.length; j++) {
					tabFinal[j]+=posteMetier.getNbrPosteJr(i, numT)[j];
					}
			}
			/////////////////////////////////////////////////////////////////////////////
			for (int i = 0; i < nbreSemaine; i++) {
				numT--;
				if(numT==0) {
					numT=employeMetier.getNbrEmployes();
				}
				for (int j = 0; j < tabFinal.length; j++) {
				tabFinal[j]+=posteMetier.getNbrSemaine(numT)[j];
				}
			}
			numT--;
			if(numT==0) {
				numT=employeMetier.getNbrEmployes();
			}
			for (int i = resteInf; i >= 1; i--) {
				for (int j = 0; j < tabFinal.length; j++) {
					tabFinal[j]+=posteMetier.getNbrPosteJr(i, numT)[j];
					}
			}
			request.setAttribute("Postes", tabFinal);
			request.setAttribute("nomEmploye", nomEmploye);
			request.setAttribute("intervalle", intervalle);
			this.getServletContext().getRequestDispatcher("/Historique.jsp").forward(request, response);
		}
		//-------------------------------------------Support Employe-----------------------------------------------------//
		if(request.getServletPath().equals("/SupportEmploye")){
			String nomEmploye=request.getParameter("nomEmploye");
			int idcaseTab =Integer.parseInt(request.getParameter("idcaseTab"));
			caseTabMetier.setCaseFull(idcaseTab, nomEmploye);
			this.getServletContext().getRequestDispatcher("/consempAGeneral").forward(request, response);
		}
		//------------------------Menu choix------------------//
		if(request.getServletPath().equals("/SupprimerAjouterSupp")) {
			int idcaseTab=Integer.parseInt(request.getParameter("idcaseTab"));
			boolean bool =caseTabMetier.isCaseNull(idcaseTab);
			request.setAttribute("idcaseTab", idcaseTab);
			request.setAttribute("bool", bool);
			this.getServletContext().getRequestDispatcher("/SupprimerAjouterSupp.jsp").forward(request, response);
		}
		//-------------------------Supprimer -----------------//
		if(request.getServletPath().equals("/SupprimerSupp")) {
			int idcaseTab=Integer.parseInt(request.getParameter("idcaseTab"));
			caseTabMetier.setCaseNull(idcaseTab);
			this.getServletContext().getRequestDispatcher("/consempAGeneral").forward(request, response);
		}
		//-------------------------Ajouter--------------------//
		if(request.getServletPath().equals("/AjouterSuppPage")) {
			int idcaseTab=Integer.parseInt(request.getParameter("idcaseTab"));
			List<Employes> emp=employeMetier.listeEmployesNumT();
			request.setAttribute("emp", emp);
			request.setAttribute("idcaseTab", idcaseTab);
			this.getServletContext().getRequestDispatcher("/AjouterSuppPage.jsp").forward(request, response);
		}
		if(request.getServletPath().equals("/AjouterSupp")) {
			int idcaseTab=Integer.parseInt(request.getParameter("idcaseTab"));
			String nomEmploye = request.getParameter("nomEmploye");
			caseTabMetier.setCaseFull(idcaseTab, nomEmploye);
			this.getServletContext().getRequestDispatcher("/consempAGeneral").forward(request, response);
		}
		}
	}

}
