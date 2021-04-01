package web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Absences;
import dao.IAbsenceDAO;
import dao.IAbsenceImplDAO;


/**
 * Servlet implementation class ServletAbsence
 */
@WebServlet(urlPatterns = {"/modifierAbsencePage","/modifierAbsence","/supprimerAbsenceGeneral","/supprimerAbsenceEmploye","/ajouterAbsence","/afficherAbsenceE","/listeAbsence","/supprimerAbsence","/afficherAbsence"})
public class ServletAbsence extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IAbsenceDAO absenceMetier = new IAbsenceImplDAO();
	 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletAbsence() {
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
			
		// Ajouter une absence :
		if(request.getServletPath().equals("/ajouterAbsence")){	 
			
				System.out.println(3);
				Absences ab1 = new Absences();
				ab1.setMotifAbsences(request.getParameter("motifAbsence"));
				ab1.setNatureAbsences(request.getParameter("natureAbsence"));
				ab1.setDateAbsences(request.getParameter("dateAbsence"));
				ab1.setNomEmploye(request.getParameter("nomEmploye"));
				
				absenceMetier.ajouterAbsence(ab1);
				System.out.println(11);
				this.getServletContext().getRequestDispatcher("/HomeAdmin").forward(request, response);
			}
		// Lister les Absences
				if (request.getServletPath().equals("/listeAbsence")) { 
					
					System.out.println(4);
					request.setAttribute("absences", absenceMetier.listeAbsences());
					this.getServletContext().getRequestDispatcher("/ListeAbsence.jsp").forward(request, response);
				}
		//Supprimer une absence
				if (request.getServletPath().equals("/supprimerAbsence")) {
					int idAbsence = Integer.parseInt(request.getParameter("idAbsence"));
					absenceMetier.supprimerAbsence(idAbsence);
					this.getServletContext().getRequestDispatcher("/HomeAdmin").forward(request, response);
				}
		//afficher absence d'un employer
				if(request.getServletPath().equals("/afficherAbsence")) {
					
					String nomEmploye = request.getParameter("nomEmploye");
					request.setAttribute("absences", absenceMetier.listeAbsences1(nomEmploye));
					request.setAttribute("nomEmploye",nomEmploye);
					this.getServletContext().getRequestDispatcher("/AfficherAbsence.jsp").forward(request, response);
				}
				
				
           if(request.getServletPath().equals("/afficherAbsenceE")) {
					
					String nomEmploye = request.getParameter("nomEmploye");
					request.setAttribute("absences", absenceMetier.listeAbsences1(nomEmploye));
					request.setAttribute("nomEmploye",nomEmploye);
					this.getServletContext().getRequestDispatcher("/AbsenceEmploye.jsp").forward(request, response);
				}


          //---------------------------------------Suppression message--------------------------------------
		
           if(request.getServletPath().equals("/supprimerAbsenceEmploye")) {
        	   String nomEmploye=request.getParameter("nomEmploye").trim();
        	   System.out.println("------------------"+nomEmploye);
        	   absenceMetier.supprimerAbsenceEmploye(nomEmploye);
        	   this.getServletContext().getRequestDispatcher("/listeAbsence").forward(request, response);
           }
           
           if(request.getServletPath().equals("/supprimerAbsenceGeneral")) {
        	   absenceMetier.supprimerAbsenceGeneral();
        	   this.getServletContext().getRequestDispatcher("/HomeAdmin").forward(request, response);
           }
           
           //---------------------------------------------modifier Absence--------------------------------------------//
           if(request.getServletPath().equals("/modifierAbsencePage")) {
        	   int idAbsence = Integer.parseInt(request.getParameter("idAbsence"));
        	   Absences absence = absenceMetier.getAbsence(idAbsence);
        	   request.setAttribute("absence", absence);
        	   this.getServletContext().getRequestDispatcher("/ModifierAbsence.jsp").forward(request, response);
           }
           if(request.getServletPath().equals("/modifierAbsence")) {
        	   int idAbsence = Integer.parseInt(request.getParameter("idAbsence"));
        	   Absences ab1 = new Absences();
        	   ab1.setIdAbsences(idAbsence);
				ab1.setMotifAbsences(request.getParameter("motifAbsence"));
				ab1.setNatureAbsences(request.getParameter("natureAbsence"));
				ab1.setDateAbsences(request.getParameter("dateAbsence"));
				ab1.setNomEmploye(request.getParameter("nomEmploye"));
				absenceMetier.modifierAbsence(ab1);
				this.getServletContext().getRequestDispatcher("/HomeAdmin").forward(request, response);
           }
		}
	}

}
