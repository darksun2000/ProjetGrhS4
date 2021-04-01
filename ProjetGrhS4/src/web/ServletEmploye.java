package web;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Month;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.time.temporal.TemporalAdjusters;
import java.util.ArrayList;
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

import beans.Absences;
import beans.Admin;
import beans.CaseTab;
import beans.Employes;
import beans.EmployesAttente;
import beans.MessageEmploye;
import dao.GmailEnvoieImplDAO;
import dao.IAbsenceDAO;
import dao.IAbsenceImplDAO;
import dao.IAdminDAO;
import dao.IAdminImplDAO;
import dao.ICaseTabDAO;
import dao.ICaseTabImplDAO;
import dao.IEmployeImplDAO;
import dao.IEmployesAttenteDAO;
import dao.IEmployesAttenteImplDAO;
import dao.IGmailEnvoieDAO;
import dao.IMessageEmployeDao;
import dao.IMessageEmployeImpl;
import dao.INotifDAO;
import dao.INotifImplDAO;
import dao.IdateSemaineDAO;
import dao.IdateSemaineImplDAO;

/**
 * Servlet implementation class ServletEmploye
 */
@WebServlet(urlPatterns = { "/ListeDemande", "/DeclinerDemande", "/ProfilListeDemande", "/AccepterDemande",
		"/DemandeAjout", "/EnvoyerDemande", "/AbsenceDocument", "/sauvegarde", "/mdpOublie", "/ajouterEmploye",
		"/ModifierMdpEmploye", "/afficherEmployeA", "/MessageEmploye", "/rotationLeft", "/AjouterAbsence",
		"/rotationLeftA", "/rotationLeftAview", "/rotationRightAview", "/rotationRightA", "/consempAARE",
		"/consempAAcceuil", "/consempAAutoEmploi", "/consempAEPSE", "/rotationRight", "/supprimerEmploye",
		"/listeEmploye", "/afficherEmploye", "/listeEmployeE", "/consemp", "/updateEmploye", "/consempAGeneral",
		"/edit", "/editphoto", "/modifierphoto", "/HomeEmploye", "/profilAdminE", "/rotationLeftEview",
		"/rotationRightEview" })
public class ServletEmploye extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IEmployeImplDAO employeMetier = new IEmployeImplDAO();
	private IMessageEmployeDao messageMetier = new IMessageEmployeImpl();
	private IAbsenceDAO absenceMetier = new IAbsenceImplDAO();
	private IdateSemaineDAO dateSemaineMetier = new IdateSemaineImplDAO();
	private ICaseTabDAO caseTabMetier = new ICaseTabImplDAO();
	private INotifDAO notifMetier = new INotifImplDAO();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletEmploye() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getServletPath() != null) {
			// Ajouter un employe
			if (request.getServletPath().equals("/ajouterEmploye")) {
				if (employeMetier.getNbrEmployes() >= 15) {
					request.getRequestDispatcher("/500.jsp").forward(request, response);
				} else {
					System.out.println(2);

					Employes em1 = new Employes();
					System.out.println(3);
					System.out.println(request.getParameter("nomEmploye"));
					em1.setNomEmploye(request.getParameter("nomEmploye"));
					em1.setEmailEmploye(request.getParameter("emailEmploye"));
					em1.setDateNaissanceEmploye(request.getParameter("dateNaissanceEmploye"));
					em1.setSalaireEmploye(Float.parseFloat(request.getParameter("salaireEmploye")));
					em1.setMdpEmploye(request.getParameter("mdpEmploye"));
					em1.setCniEmploye(request.getParameter("cniEmploye"));
					em1.setNumT(employeMetier.getNewNumT());
					em1.setPhotoEmploye("person.jpg");
					request.setAttribute("cond", 1);
					employeMetier.ajouterEmploye(em1);
					System.out.println(5);
					this.getServletContext().getRequestDispatcher("/HomeAdmin").forward(request, response);
				}
			}

			// Supprimer un Employe
			if (request.getServletPath().equals("/supprimerEmploye")) {
				int idEmploye = Integer.parseInt(request.getParameter("idEmploye"));
				employeMetier.supprimerEmploye(idEmploye);
				request.setAttribute("i", 1);
				this.getServletContext().getRequestDispatcher("/listeEmploye").forward(request, response);
			}

			// Lister les Employes
			if (request.getServletPath().equals("/listeEmploye")) {

				System.out.println(4);
				request.setAttribute("employes", employeMetier.listeEmployes());
				this.getServletContext().getRequestDispatcher("/ListeEmploye.jsp").forward(request, response);
				System.out.println("ster lekher");
			}

			if (request.getServletPath().equals("/listeEmployeE")) {

				String nomEmploye = request.getParameter("nomEmploye");
				request.setAttribute("em", employeMetier.listeEmployes(nomEmploye));
				this.getServletContext().getRequestDispatcher("/ListeEmployeE.jsp").forward(request, response);
				System.out.println("ster lekher");
			}

			if (request.getServletPath().equals("/AjouterAbsence")) {

				System.out.println(4);
				request.setAttribute("employes", employeMetier.listeEmployes());
				this.getServletContext().getRequestDispatcher("/AjouterAbsence.jsp").forward(request, response);
			}

			if (request.getServletPath().equals("/edit")) {

				int idEmploye = Integer.parseInt(request.getParameter("idEmploye"));
				request.setAttribute("idEmploye", employeMetier.chercherEmploye(idEmploye));
				this.getServletContext().getRequestDispatcher("/ModifierEmploye.jsp").forward(request, response);
			}
			if (request.getServletPath().equals("/editphoto")) {

				int idEmploye = Integer.parseInt(request.getParameter("id1").trim());
				request.setAttribute("idEmploye", employeMetier.chercherEmploye(idEmploye));
				System.out.println("test");
				this.getServletContext().getRequestDispatcher("/ModifierPhoto.jsp").forward(request, response);

			}
			// modifier photo de l'employer
			if (request.getServletPath().contentEquals("/modifierphoto")) {

				try {
					int idEmploye = Integer.parseInt(request.getParameter("id2").trim());
					Employes em = employeMetier.getEmploye(idEmploye);
					System.out.println("ba9i mawsel2");
					ServletFileUpload sf = new ServletFileUpload(new DiskFileItemFactory());
					System.out.println("ba9i mawsel1");
					List<FileItem> fi = sf.parseRequest(request);
					System.out.println("ba9i mawsel");
					for (FileItem item : fi) {
						InputStream ips = item.getInputStream();
						byte[] bytephoto = new byte[ips.available()];
						ips.read(bytephoto);
						byte[] encodeBase64Document1 = Base64.encodeBase64(bytephoto);
						String base64Encoded = new String(encodeBase64Document1, "UTF-8");
						em.setPhotoEmploye(base64Encoded);
					}

					employeMetier.modifierEmploye(em);
					request.getRequestDispatcher("/HomeAdmin").forward(request, response);
				} catch (Exception e) {
					System.out.println("error upload");
					e.getStackTrace();

				}

			}

			// Editer un employe
			if (request.getServletPath().equals("/updateEmploye")) {
				Employes em = new Employes();

				em.setNomEmploye(request.getParameter("nomEmploye"));
				em.setEmailEmploye(request.getParameter("emailEmploye"));
				em.setDateNaissanceEmploye(request.getParameter("dateNaissanceEmploye"));
				em.setSalaireEmploye(Float.parseFloat(request.getParameter("salaireEmploye")));
				em.setMdpEmploye(request.getParameter("mdpEmploye"));
				em.setCniEmploye(request.getParameter("cniEmploye"));
				em.setPhotoEmploye(request.getParameter("photoEmploye"));
				employeMetier.modifierEmploye(em);

				request.getRequestDispatcher("/HomeAdmin").forward(request, response);
			}

			if (request.getServletPath().equals("/ModifierMdpEmploye")) {
				Employes em = employeMetier.getEmploye(request.getParameter("nomEmploye"));

				em.setMdpEmploye(request.getParameter("mdpEmploye"));
				System.out.println("nouveau mot de passe : " + em.getMdpEmploye());

				employeMetier.modifierEmploye(em);

				request.getRequestDispatcher("/Login.jsp").forward(request, response);
			}

			// Afficher Employe
			if (request.getServletPath().equals("/afficherEmploye")) {

				System.out.println(5);

				int idEmploye = Integer.parseInt(request.getParameter("idEmploye"));
				request.setAttribute("idEmploye", employeMetier.chercherEmploye(idEmploye));
				System.out.println(6);
				this.getServletContext().getRequestDispatcher("/ProfilEmploye.jsp").forward(request, response);
				request.setAttribute("idEmploye", idEmploye);
				System.out.println(55);
			}
			if (request.getServletPath().equals("/afficherEmployeA")) {

				System.out.println(5);

				int idEmploye = Integer.parseInt(request.getParameter("idEmploye"));
				request.setAttribute("idEmploye", employeMetier.chercherEmploye(idEmploye));
				System.out.println(6);
				this.getServletContext().getRequestDispatcher("/AfficherEmploye.jsp").forward(request, response);
				request.setAttribute("idEmploye", idEmploye);
				System.out.println(55);
			}

			if (request.getServletPath().equals("/consemp")) {
				String[] emp = employeMetier.listeEmployes2();

				request.setAttribute("l", emp);
				int i = 1;
				CaseTab[] ct = caseTabMetier.getTabComplet();
				System.out.println(ct.length);
				CaseTab ct1 = new CaseTab();
				for (int j = 0; j < ct.length; j++) {

					try {
						ct1.setNomEmploye(" + " + ct[j].getNomEmploye().substring(3));
						System.out.println(ct1.getNomEmploye());
						ct1.setIdcaseTab(ct[j].getIdcaseTab());
						ct[j] = ct1;

					} catch (Exception e2) {
					}
				}
				request.setAttribute("caseTab", ct);
				request.setAttribute("i", i);
				this.getServletContext().getRequestDispatcher("/EmploiEmploye.jsp").forward(request, response);
			}

			if (request.getServletPath().equals("/consempAGeneral")) {
				int checked = dateSemaineMetier.auto();
				String ancienDate = dateSemaineMetier.MyFriday();

				
				String tabComp[] = ancienDate.split("-");
				System.out.println(tabComp[1]);
				Month mymonth = dateSemaineMetier.getMonth(Integer.parseInt(tabComp[1].trim()));

				System.out.println(mymonth);
				LocalDate dt = LocalDate.of(Integer.parseInt(tabComp[0]), mymonth, Integer.parseInt(tabComp[2]));
				String date = dt.with(TemporalAdjusters.next(DayOfWeek.MONDAY)) + "".trim();
				String[] emp = employeMetier.listeEmployes2();
				request.setAttribute("l", emp);
				int i = 1;

				
					//pour que l'absence apparaisse sur l'emploi
//				absenceMetier.absenceSurEmploi(date,1);

				CaseTab[] ct = caseTabMetier.getTabComplet();
				request.setAttribute("i", i);
				request.setAttribute("date", date);
				request.setAttribute("checked", checked);
				request.setAttribute("caseTab", ct);
				this.getServletContext().getRequestDispatcher("/GestionDeploiementGeneral.jsp").forward(request,
						response);
			}

			if (request.getServletPath().equals("/consempAAcceuil")) {
				CaseTab[] ct = caseTabMetier.getTabComplet();
				String[] emp = employeMetier.listeEmployes2();
				request.setAttribute("l", emp);
				int i = 1;
				request.setAttribute("i", i);
				request.setAttribute("caseTab", ct);
				this.getServletContext().getRequestDispatcher("/GestionDeploiementAcceuil.jsp").forward(request,
						response);
			}

			if (request.getServletPath().equals("/consempAEPSE")) {
				CaseTab[] ct = caseTabMetier.getTabComplet();
				String[] emp = employeMetier.listeEmployes2();
				request.setAttribute("l", emp);
				int i = 1;
				request.setAttribute("i", i);
				request.setAttribute("caseTab", ct);
				this.getServletContext().getRequestDispatcher("/GestionDeploiementEPSE.jsp").forward(request, response);
			}

			if (request.getServletPath().equals("/consempAAutoEmploi")) {

				String[] emp = employeMetier.listeEmployes2();
				CaseTab[] ct = caseTabMetier.getTabComplet();
				request.setAttribute("l", emp);
				int i = 1;
				request.setAttribute("i", i);
				request.setAttribute("caseTab", ct);
				this.getServletContext().getRequestDispatcher("/GestionDeploiementAutoEmploi.jsp").forward(request,
						response);
			}

			if (request.getServletPath().equals("/consempAARE")) {

				String[] emp = employeMetier.listeEmployes2();
				CaseTab[] ct = caseTabMetier.getTabComplet();
				request.setAttribute("l", emp);
				int i = 1;
				request.setAttribute("i", i);
				request.setAttribute("caseTab", ct);
				this.getServletContext().getRequestDispatcher("/GestionDeploiementARE.jsp").forward(request, response);
			}

//---------------------------------------------voir semaine suivante precedante-------------------------------------------------//

//--------------------------------------------------rotation à gauche view ADMIN----------------------------------------------------//
			if (request.getServletPath().equals("/rotationLeftAview")) {
				int checked = dateSemaineMetier.auto();
				int i = Integer.parseInt(request.getParameter("i"));
				i--;
				String emp[];
				String emp1[];
//------------------------------------correction poste vide-----------------------------------------------------//				
				if (employeMetier.getNbrEmployes() >= 10) {
					emp = employeMetier.listeEmployes2();
					emp1 = new String[emp.length];
				} else {
					emp = new String[10];
					for (int j = 0; j < employeMetier.getNbrEmployes(); j++) {

						emp[j] = employeMetier.listeEmployes2()[j];
					}
					for (int j = employeMetier.getNbrEmployes(); j < 10; j++) {

						emp[j] = "";
					}
					emp1 = new String[10];
				}
//------------------------------------fin correction poste vide-----------------------------------------------------//
				for (int j = 0; j < emp.length - i + 1; j++) {
					emp1[j + i - 1] = emp[j];
				}
				for (int j = 0; j < i - 1; j++) {
					emp1[j] = emp[emp.length - i + 1 + j];
				}

				String ancienDate = request.getParameter("date");
				String tabComp[] = ancienDate.split("-");
				Month mymonth = dateSemaineMetier.getMonth(Integer.parseInt(tabComp[1]));
				System.out.println(mymonth);
				LocalDate dt = LocalDate.of(Integer.parseInt(tabComp[0]), mymonth, Integer.parseInt(tabComp[2]));
				String date = dt.with(TemporalAdjusters.previous(DayOfWeek.MONDAY)) + "".trim();
				//pour que l'absence apparaisse sur l'emploi
//				absenceMetier.absenceSurEmploi(date,i);
				CaseTab[] ct = caseTabMetier.getTabComplet();

				request.setAttribute("date", date);
				request.setAttribute("l", emp1);
				request.setAttribute("i", i);
				request.setAttribute("caseTab", ct);
				request.setAttribute("checked", checked);
				this.getServletContext().getRequestDispatcher("/GestionDeploiementGeneral.jsp").forward(request,
						response);
			}
//--------------------------------------------------rotation à gauche view EMPLOYE----------------------------------------------------//
			if (request.getServletPath().equals("/rotationLeftEview")) {
				CaseTab[] ct = caseTabMetier.getTabComplet();
				int i = Integer.parseInt(request.getParameter("i"));
				i--;
				String emp[];
				String emp1[];
//------------------------------------correction poste vide-----------------------------------------------------//				
				if (employeMetier.getNbrEmployes() >= 10) {
					emp = employeMetier.listeEmployes2();
					emp1 = new String[emp.length];
				} else {
					emp = new String[10];
					for (int j = 0; j < employeMetier.getNbrEmployes(); j++) {

						emp[j] = employeMetier.listeEmployes2()[j];
					}
					for (int j = employeMetier.getNbrEmployes(); j < 10; j++) {

						emp[j] = "";
					}
					emp1 = new String[10];
				}
//------------------------------------fin correction poste vide-----------------------------------------------------//
				for (int j = 0; j < emp.length - i + 1; j++) {
					emp1[j + i - 1] = emp[j];
				}
				for (int j = 0; j < i - 1; j++) {
					emp1[j] = emp[emp.length - i + 1 + j];
				}

				// mise à jour algo
				// debut
				String nomEmploye = request.getParameter("nomEmploye");
				for (int l = 0; l < emp1.length; l++) {
					if (!emp1[l].equals(nomEmploye)) {
						emp1[l] = "";
						System.out.println(emp1[l] + "1");
					}
				}

				// fin
				//pour que l'absence apparaisse sur l'emploi
//				absenceMetier.absenceSurEmploi(date);
//				CaseTab[] ct = caseTabMetier.getTabComplet();

				request.setAttribute("l", emp1);
				request.setAttribute("caseTab", ct);
				request.setAttribute("i", i);
				this.getServletContext().getRequestDispatcher("/EmploiEmploye.jsp").forward(request, response);
			}

			// rotation à droite view
			if (request.getServletPath().equals("/rotationRightAview")) {
				int checked = dateSemaineMetier.auto();
				int i = Integer.parseInt(request.getParameter("i"));
				String emp[];
				String emp1[];
//------------------------------------correction poste vide-----------------------------------------------------//				
				if (employeMetier.getNbrEmployes() >= 10) {
					emp = employeMetier.listeEmployes2();
					emp1 = new String[emp.length];
				} else {
					emp = new String[10];
					for (int j = 0; j < employeMetier.getNbrEmployes(); j++) {

						emp[j] = employeMetier.listeEmployes2()[j];
					}
					for (int j = employeMetier.getNbrEmployes(); j < 10; j++) {

						emp[j] = "";
					}
					emp1 = new String[10];
				}
//------------------------------------fin correction poste vide-----------------------------------------------------//
				for (int j = 0; j < emp.length - i; j++) {
					emp1[j + i] = emp[j];
				}
				for (int j = 0; j < i; j++) {
					emp1[j] = emp[emp.length - i + j];
				}

				i++;
				String ancienDate = request.getParameter("date");
				String tabComp[] = ancienDate.split("-");
				Month mymonth = dateSemaineMetier.getMonth(Integer.parseInt(tabComp[1]));
				LocalDate dt = LocalDate.of(Integer.parseInt(tabComp[0]), mymonth, Integer.parseInt(tabComp[2]));
				String date = dt.with(TemporalAdjusters.next(DayOfWeek.MONDAY)) + "".trim();
				//pour que l'absence apparaisse sur l'emploi
//				absenceMetier.absenceSurEmploi(date,i);
				CaseTab[] ct = caseTabMetier.getTabComplet();
				request.setAttribute("date", date);
				request.setAttribute("l", emp1);
				request.setAttribute("i", i);
				request.setAttribute("caseTab", ct);
				request.setAttribute("checked", checked);
				this.getServletContext().getRequestDispatcher("/GestionDeploiementGeneral.jsp").forward(request,
						response);
			}
			// meme chose pour Employe
			if (request.getServletPath().equals("/rotationRightEview")) {
				CaseTab[] ct = caseTabMetier.getTabComplet();
				int i = Integer.parseInt(request.getParameter("i"));
				String emp[];
				String emp1[];
//------------------------------------correction poste vide-----------------------------------------------------//				
				if (employeMetier.getNbrEmployes() >= 10) {
					emp = employeMetier.listeEmployes2();
					emp1 = new String[emp.length];
				} else {
					emp = new String[10];
					for (int j = 0; j < employeMetier.getNbrEmployes(); j++) {

						emp[j] = employeMetier.listeEmployes2()[j];
					}
					for (int j = employeMetier.getNbrEmployes(); j < 10; j++) {

						emp[j] = "";
					}
					emp1 = new String[10];
				}
//------------------------------------fin correction poste vide-----------------------------------------------------//
				for (int j = 0; j < emp.length - i; j++) {
					emp1[j + i] = emp[j];
				}
				for (int j = 0; j < i; j++) {
					emp1[j] = emp[emp.length - i + j];
				}
				for (int j = 0; j < emp.length; j++) {
					System.out.println(emp1[j]);
				}
				// mise à jour algo
				// debut
				String nomEmploye = request.getParameter("nomEmploye");
				for (int l = 0; l < emp1.length; l++) {
					if (!emp1[l].equals(nomEmploye)) {
						emp1[l] = "";
						System.out.println(emp1[l] + "1");
					}
				}

				// fin
				i++;
				request.setAttribute("l", emp1);
				request.setAttribute("i", i);
				request.setAttribute("caseTab", ct);
				this.getServletContext().getRequestDispatcher("/EmploiEmploye.jsp").forward(request, response);
			}

			if (request.getServletPath().equals("/home")) {
				int i = Integer.parseInt(request.getParameter("i"));

				request.setAttribute("i", i);

			}

			if (request.getServletPath().equals("/MessageEmploye")) {
				IAdminDAO adminMetier = new IAdminImplDAO();
				String nomEmploye = request.getParameter("nomEmploye");
				List<MessageEmploye> lm = messageMetier.ListeMessagesE(nomEmploye);
				request.setAttribute("Admin", adminMetier.getAdmin());
				request.setAttribute("lm", lm);
				this.getServletContext().getRequestDispatcher("/MessageEmploye.jsp").forward(request, response);

			}

			if (request.getServletPath().equals("/HomeEmploye")) {
				int nbreAbsencesEmpl = absenceMetier.getNbreAbsences(request.getParameter("nomEmploye"));
				int nbreNotif = messageMetier.getNbreNotif(request.getParameter("nomEmploye"));
				int nbreMessage = messageMetier.getNbreMessages(request.getParameter("nomEmploye"));
				request.getSession().setAttribute("nbreNotif", nbreNotif);
				request.getSession().setAttribute("nbreMessage", nbreMessage);
				request.getSession().setAttribute("nbreAbsence", nbreAbsencesEmpl);
				request.getRequestDispatcher("/HomeEmploye.jsp").forward(request, response);
			}

			if (request.getServletPath().equals("/profilAdminE")) {
				IAdminDAO adminMetier = new IAdminImplDAO();
				Admin ad = adminMetier.getAdmin();
				request.setAttribute("ad", ad);
				this.getServletContext().getRequestDispatcher("/ProfilAdminE.jsp").forward(request, response);

			}

			// mdp oublié
			if (request.getServletPath().equals("/mdpOublie")) {
				IGmailEnvoieDAO gmailMetier = new GmailEnvoieImplDAO();
				String nom = request.getParameter("nomEmploye");
				String email1 = request.getParameter("emailEmploye");
				String from = "gressuorceshumaines@gmail.com";
				String pass = "demo@123456";
				String[] to = { email1 };
				String subject = "Email de récuperation mot de passe MR : " + nom;
				String body = "Voilà votre mot de passe, veuillez ne le pas oublier fréquement :-) : => mot de passe = "
						+ employeMetier.getEmploye(nom).getMdpEmploye();
				System.out.println(email1);
				if (employeMetier.getEmployeMdp(nom, email1)) {

					gmailMetier.sendFromGMail(from, pass, to, subject, body);
					this.getServletContext().getRequestDispatcher("/EmailEnvoye.jsp").forward(request, response);
				} else {
					request.getSession().setAttribute("Employe", null);

					request.getSession().setAttribute("admin", null);
					int testA = 1;
					String erreurA = "email ou nom d'utilisateur incorrect ! ";
					request.setAttribute("testA", testA);
					request.setAttribute("eA", erreurA);
					this.getServletContext().getRequestDispatcher("/forgot-password.jsp").forward(request, response);
				}

			}

//----------------------------------------------------------sauvegarder rotation-------------------------------------------------------------//				
			if (request.getServletPath().equals("/sauvegarde")) {
				int i = Integer.parseInt(request.getParameter("i"));
				i--;
				System.out.println("-----------------------" + i);
				String emp[] = employeMetier.listeEmployes2();

				String emp1[] = new String[emp.length];
				for (int j = 0; j < emp.length - i; j++) {
					emp1[j + i] = emp[j];
				}
				for (int j = 0; j < i; j++) {
					emp1[j] = emp[emp.length - i + j];
				}

				for (int j = 0; j < emp.length; j++) {
					System.out.println(emp[j]);
				}
				System.out.println("--------------");
				for (int j = 0; j < emp.length; j++) {
					System.out.println(emp1[j]);
				}
				Employes em = new Employes();
				for (int j = 0; j < emp1.length; j++) {
					em = employeMetier.getEmploye(emp1[j]);
					em.setNumT(j + 1);
					employeMetier.modifierEmployeNumT(em);
				}

				this.getServletContext().getRequestDispatcher("/HomeAdmin").forward(request, response);
			}

			// --------------------------Signalé faute
			// absence--------------------------------//
			if (request.getServletPath().equals("/AbsenceDocument")) {
				Absences absence = absenceMetier.getAbsence(Integer.parseInt(request.getParameter("IdAbsence").trim()));
				request.setAttribute("absence", absence);
				this.getServletContext().getRequestDispatcher("/AbsenceDocument.jsp").forward(request, response);
			}
			// -------------------------------------------------------------------------------------//

			if (request.getServletPath().equals("/EnvoyerDemande")) {
				Absences absence = absenceMetier.getAbsence(Integer.parseInt(request.getParameter("IdAbsence").trim()));
				String SujetMessage = "Probleme absence du : " + absence.getDateAbsences();
				String Message = "J'ai un probleme concernant l'absence du jour " + absence.getDateAbsences()
						+ " . Veuillez la reverifier .";
				try {
					ServletFileUpload sf = new ServletFileUpload(new DiskFileItemFactory());
					System.out.println("ba9i mawsel1");
					System.out.println(request.getParameter("nomEmploye"));
					List<FileItem> fi = sf.parseRequest(request);
					System.out.println(fi);
					MessageEmploye message = new MessageEmploye();
					message.setNomEmploye(request.getParameter("nomEmploye"));
					message.setSujetMessage(SujetMessage);
					System.out.println(fi);
					message.setMessage(Message);
					DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
					LocalDateTime now = LocalDateTime.now();
					String date = dtf.format(now);
					message.setDateMessage(date);
					message.setIndiceEmpAdm(1);
					System.out.println("imporant! : " + fi.get(0).getName());

					if (!fi.get(0).getName().equals("")) {
						InputStream ips = fi.get(0).getInputStream();
						byte[] bytephoto = new byte[ips.available()];
						ips.read(bytephoto);
						byte[] encodeBase64Document1 = Base64.encodeBase64(bytephoto);
						String base64Encoded = new String(encodeBase64Document1, "UTF-8");
						message.setAttachement(base64Encoded);
						String nom = fi.get(0).getName();
						File file = new File("WebContent\\dist\\img\\" + nom);
						message.setSizeAtt((file.length() / 1024.0) + "");
						message.setNomAttachement(nom);
						message.setType(fi.get(0).getContentType());
					} else {
						message.setAttachement("");
						message.setSizeAtt("");
						message.setNomAttachement("");
						message.setType("");
					}
					messageMetier.EnvoyerMessageE(message);
				}

				catch (Exception e) {
					e.getStackTrace();
					System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");

				}

				notifMetier.changeNotif(messageMetier.getNbreNotif() + "");
				System.out.println("la derniere ligne de servlet Envoyer msg");
				this.getServletContext().getRequestDispatcher("/HomeEmploye.jsp").forward(request, response);
			}
			// ------------------------------demande
			// d'ajout--------------------------------------//
			if (request.getServletPath().equals("/DemandeAjout")) {
				EmployesAttente em = new EmployesAttente();
				IEmployesAttenteDAO emMetier = new IEmployesAttenteImplDAO();
				em.setNomEmploye(request.getParameter("nomEmploye"));
				em.setEmailEmploye(request.getParameter("emailEmploye"));
				em.setMdpEmploye(request.getParameter("mdpEmploye"));
				em.setDateNaissanceEmploye(request.getParameter("dateNaissance"));
				em.setCniEmploye(request.getParameter("cniEmploye"));
				emMetier.ajouterEmploye(em);
				this.getServletContext().getRequestDispatcher("/demandeEnvoye.jsp").forward(request, response);
			}
			if (request.getServletPath().equals("/ListeDemande")) {
				IEmployesAttenteDAO emMetier = new IEmployesAttenteImplDAO();
				List<EmployesAttente> emListe = emMetier.listeEmployeAttente();
				System.out.println("-------------" + emListe);
				request.setAttribute("em", emListe);
				this.getServletContext().getRequestDispatcher("/ListeDemandes.jsp").forward(request, response);
			}
			if (request.getServletPath().equals("/ProfilListeDemande")) {
				IEmployesAttenteDAO emMetier = new IEmployesAttenteImplDAO();
				int idEmployesAttente = Integer.parseInt(request.getParameter("idEmployesAttente"));
				EmployesAttente em = emMetier.getEmploye(idEmployesAttente);
				request.setAttribute("idEmploye", em);
				this.getServletContext().getRequestDispatcher("/ProfilEmployeAttente.jsp").forward(request, response);
			}
			if (request.getServletPath().equals("/AccepterDemande")) {
				IEmployesAttenteDAO emMetier = new IEmployesAttenteImplDAO();
				int idEmployesAttente = Integer.parseInt(request.getParameter("idEmployesAttente"));
				emMetier.accepterEmploye(idEmployesAttente);
				int nbrDemandes = emMetier.getNbreEmployeAttente();
				request.getSession().setAttribute("notifDemandes", nbrDemandes);
				this.getServletContext().getRequestDispatcher("/ListeDemande").forward(request, response);
			}
			if (request.getServletPath().equals("/DeclinerDemande")) {
				IEmployesAttenteDAO emMetier = new IEmployesAttenteImplDAO();
				int idEmployesAttente = Integer.parseInt(request.getParameter("idEmployesAttente"));
				emMetier.declinerEmploye(idEmployesAttente);
				int nbrDemandes = emMetier.getNbreEmployeAttente();
				request.getSession().setAttribute("notifDemandes", nbrDemandes);
				this.getServletContext().getRequestDispatcher("/ListeDemande").forward(request, response);
			}
		}
	}

}
