package web;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import beans.Admin;
import dao.IAbsenceDAO;
import dao.IAbsenceImplDAO;
import dao.IAdminDAO;
import dao.IAdminImplDAO;
import dao.IEmployeDAO;
import dao.IEmployeImplDAO;
import dao.IEmployesAttenteDAO;
import dao.IEmployesAttenteImplDAO;
import dao.IMessageEmployeDao;
import dao.IMessageEmployeImpl;
import dao.INotifDAO;
import dao.INotifImplDAO;
import dao.IdateSemaineDAO;
import dao.IdateSemaineImplDAO;
import beans.Employes;

/**
 * Servlet implementation class ServletLogin
 */
@WebServlet(urlPatterns = {"/ConnexionAdmin","/logout","/connexionEm","/login"})
public class ServletLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private IAdminDAO adminMetier = new IAdminImplDAO();
	private IEmployeDAO employeMetier = new IEmployeImplDAO();
	private INotifDAO notifMetier = new INotifImplDAO();
	private IMessageEmployeDao messageMetier=new IMessageEmployeImpl();
	private IAbsenceDAO absenceMetier =new IAbsenceImplDAO();
	private IdateSemaineDAO dateSemaineMetier = new IdateSemaineImplDAO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletLogin() {
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
		HttpSession session =request.getSession(); 
		session.setMaxInactiveInterval(3600);
		System.out.println(1);

		
		if(request.getServletPath().equals("/logout")) {
			System.out.println(00);
			session.removeAttribute("Employe");
			session.invalidate();
			System.out.println(99);
			response.sendRedirect("Login.jsp");
		
	}
		
		 
		 
		 
		 
//--------------------------------------------------login General------------------------------------------------------------------//
		 if(request.getServletPath().equals("/login")){
			 String nom=request.getParameter("nom");
			 String mdp=request.getParameter("mdp");
			 if(dateSemaineMetier.auto()==1) {
					if(!(dateSemaineMetier.PreviousFriday().equals(dateSemaineMetier.MyFriday()))) {
						dateSemaineMetier.autoRotation();
						dateSemaineMetier.ModifierFriday();
					}
				}
//------------------------------------------------------Admin------------------------------------------------//			 
			 //le nom existe dans la table admin
			 if(adminMetier.login(nom)) {
				
				 
				 //tout est juste
				 if(adminMetier.loginMdp(nom).equals(mdp)) {
					 
					 session.setAttribute("admin", nom);
						session.setAttribute("Admin", adminMetier.chercherAdmin(nom));
						session.setAttribute("notif", notifMetier.getNotif().getNomNotif());
						session.setAttribute("Messagenotif", messageMetier.ListeMessagesAnotif());
						session.setAttribute("messageMetier",messageMetier);
						notifMetier.changeNotif(notifMetier.getNotif().getNomNotif());
						System.out.println("hey");
						IEmployeDAO employeMetier=new IEmployeImplDAO();
						IAbsenceDAO absenceMetier=new IAbsenceImplDAO();
						IMessageEmployeDao messageMetier=new IMessageEmployeImpl();
						IEmployesAttenteDAO emMetier=new IEmployesAttenteImplDAO();

						int nbrEmployes=employeMetier.getNbrEmployes();
					    int nbrAbsences=absenceMetier.getNbreAbsences();
					    int nbrMessages=messageMetier.getNbreMessages();
					    int nbrDemandes=emMetier.getNbreEmployeAttente();
					    request.setAttribute("nbrEmployes",nbrEmployes);
					    request.setAttribute("nbrAbsences",nbrAbsences);
					    request.setAttribute("nbrMessages",nbrMessages);
					    request.setAttribute("nbrPostes",15-nbrEmployes);
					    request.getSession().setAttribute("notifDemandes", nbrDemandes);

						request.getRequestDispatcher("/HomeAdmin.jsp").forward(request, response); 	
						
				 }
				 //mdp incorrecte
				 else {
					 
					 Admin admin=adminMetier.getAdmin(nom, adminMetier.loginMdp(nom));
					 request.setAttribute("admin", admin);
					 request.getRequestDispatcher("/MdpIncorrecte.jsp").forward(request, response);
				 }
				 
			 }
				 
//----------------------------------------------Employé-------------------------------------------------------------------//
			 else { 
				 //chercher nomEmploye dans la bd
				 if(employeMetier.login1(nom)) {
					 
					 
					 //mdp aussi est juste
					 if(employeMetier.login1Mdp(nom).equals(mdp)) {
						 
						 int nbreAbsencesEmpl=absenceMetier.getNbreAbsences(nom);
							int nbreNotif=messageMetier.getNbreNotif(nom);
							int nbreMessage=messageMetier.getNbreMessages(nom);
							Employes em= employeMetier.getEmploye(nom, mdp);
							session.setAttribute("nomEmploye", nom);
							session.setAttribute("Employe", em);
							session.setAttribute("nbreAbsence", nbreAbsencesEmpl);
							session.setAttribute("nbreNotif", nbreNotif);
							session.setAttribute("nbreMessage", nbreMessage);

							
							request.getRequestDispatcher("/HomeEmploye.jsp").forward(request, response); 	 
						 
					 }
					 
					 //mdp incorrecte
					 
					 else {
						 Employes employe=employeMetier.getEmploye(nom);
						 request.setAttribute("employe", employe);
						 
						 request.getRequestDispatcher("/MdpIncorrecte.jsp").forward(request, response);
					 }
				 }
				 //le cas echeant
				 else {
					 request.setAttribute("test1", 1);
					 request.getRequestDispatcher("/Login.jsp").forward(request, response);
				 }
			 }
		 }
		 
	}

}
