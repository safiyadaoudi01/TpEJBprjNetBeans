package controllers;

import java.io.IOException;
import java.util.List;

import dao.IDaoLocalHotel;
import dao.IDaoLocalVille;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entities.Hotel;
import entities.Ville;
@WebServlet("/HotelController")
public class HotelController extends HttpServlet  {
    private static final long serialVersionUID = 1L;
    @EJB
    private IDaoLocalHotel hdao;
    @EJB
    private IDaoLocalVille vdao;


    public HotelController() {
        super();   
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String action = request.getParameter("action");
            if ("delete".equals(action)) {

                int HotelId = Integer.parseInt(request.getParameter("id"));
                System.out.print("-----------------------------------");
                if(hdao.findById(HotelId)!=null) {
                    Hotel Hoteldelete =  hdao.findById(HotelId);
                    Hoteldelete.setVille(null);
                    Hotel updated = hdao.update(Hoteldelete);

                    if (updated !=null) {
                        hdao.delete(updated);
                        boolean deleted = true;
                        if (deleted) {
                            response.sendRedirect(request.getContextPath() + "/HotelController");
                        } else {
                            response.sendRedirect(request.getContextPath() + "/HotelController?deleteFailed=true");
                        }
                    }
                }
            }
            List<Hotel> HotelList = hdao.findAll();

            List<Ville> villesList = vdao.findAll();
            System.out.println("liste : "+villesList);
            request.setAttribute("hotels", HotelList);
            request.setAttribute("villes", villesList);
            request.getRequestDispatcher("/Hotel.jsp").forward(request, response);
    }	

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            String action = request.getParameter("action");		

            if("edit".equals(action)) {
                       System.out.print("-----------------------------------");
                System.out.print("edit DoPOST");
                System.out.print("-----------------------------------");
            int id = Integer.parseInt(request.getParameter("id"));
            String adresse = request.getParameter("adresse");
                    String nom = request.getParameter("nom");
                    String tele = request.getParameter("telephone");
                    int ville_id =Integer.parseInt(request.getParameter("ville")) ;
                    Ville ville = vdao.findById(ville_id);
            Hotel HotelToEdit = hdao.findById(id);
            if (HotelToEdit != null) {
                    HotelToEdit.setAdresse(adresse);
                    HotelToEdit.setNom(nom);
                    HotelToEdit.setTelephone(tele);
                    HotelToEdit.setVille(ville);
                hdao.update(HotelToEdit);
            }
            response.sendRedirect(request.getContextPath() + "/HotelController");
        }
        else if("addVille".equals(action)) {
            int etdId = Integer.parseInt(request.getParameter("studentId"));
            int VilleId = Integer.parseInt(request.getParameter("Ville"));
            Hotel etd = hdao.findById(etdId);
            Ville Ville = vdao.findById(VilleId);
            System.out.println(etd);
            System.out.println(Ville);

            //etd.getVille().add(Ville);
            hdao.update(etd);
            response.sendRedirect(request.getContextPath() + "/HotelController");
        }else {

            String adresse = request.getParameter("adresse");
            String nom = request.getParameter("nom");

            String telephone = request.getParameter("telephone");
            int villeId = Integer.parseInt(request.getParameter("ville"));

            Ville v = vdao.findById(villeId);
            Hotel newHotel = new Hotel(adresse, nom, telephone, v);

            Hotel hotelStopcreate =hdao.create(newHotel);
            if (hotelStopcreate !=null) {

                List<Hotel> HotelList = hdao.findAll();
                        List<Ville> villesList = vdao.findAll();
                        System.out.println("liste : "+HotelList);
                        request.setAttribute("hotels", HotelList);

                        request.setAttribute("villes", villesList);
                        request.getRequestDispatcher("/Hotel.jsp").forward(request, response);
            } else {
                System.out.println("Failure: Hotel not created.");
            }
        }
    }
	
}
