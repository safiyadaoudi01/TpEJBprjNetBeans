package controllers;

import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import dao.IDaoLocale;
import dao.IDaoLocalHotel;
import dao.IDaoLocalVille;
import entities.Hotel;
import entities.Ville;


@WebServlet("/HotelVilleController")
public class HotelVilleController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB
	private IDaoLocalHotel ejb;
	
	@EJB
	private IDaoLocalVille ejbv;
	

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HotelVilleController() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String villeStr = request.getParameter("ville");
		if (villeStr != null) {
			int id = Integer.parseInt(villeStr);
			Ville v = ejbv.findById(id);
			List<Hotel> hotels = ejb.findByVille(v);
			request.setAttribute("hotels", hotels);
		}

		// Fetch the list of cities after processing the operation
        List<Ville> villes = ejbv.findAll();
        request.setAttribute("villes", villes);
		
		// Forward the request to the JSP page
		RequestDispatcher dispatcher = request.getRequestDispatcher("HotelparVille.jsp");
		dispatcher.forward(request, response);
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

}