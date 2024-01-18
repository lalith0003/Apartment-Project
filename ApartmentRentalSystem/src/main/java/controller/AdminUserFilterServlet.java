package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ApartmentDAO;
import model.Apartment;

/**
 * Servlet implementation class AdminUserFilterServlet
 */
@WebServlet("/AdminUserFilterServlet")
public class AdminUserFilterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
    	List<Integer> FloorNoValues = ApartmentDAO.getDistinctFloorNo();
    	List<Integer> DoorNoValues = ApartmentDAO.getDistinctDoorNoValues();
    	List<String> AdvanceCostValues = ApartmentDAO.getDistinctAdvanceCostValues();
        List<String> rentalCostValues = ApartmentDAO.getDistinctRentalCostValues();
        List<String> floorSpaceValues = ApartmentDAO.getDistinctFloorSpaceValue();
        List<String> statusValues = ApartmentDAO.getDistinctStatusValue();
        List<String> bedroomValues = ApartmentDAO.getDistinctBedroomValue();
        List<String> NoticePeriodValues = ApartmentDAO.getDistinctNoticePeriod();

        request.setAttribute("FloorNoValuess", FloorNoValues);
        request.setAttribute("DoorNoValues", DoorNoValues);
        request.setAttribute("AdvanceCostValues", AdvanceCostValues);
        request.setAttribute("rentalCostValues", rentalCostValues);
        request.setAttribute("floorSpaceValues", floorSpaceValues);
        request.setAttribute("statusValues", statusValues);
        request.setAttribute("bedroomValues", bedroomValues);
        request.setAttribute("NoticePeriodValues", NoticePeriodValues);

        request.getRequestDispatcher("AdminPage.jsp").forward(request, response);
        
    }
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String floorNoParam = request.getParameter("floor_no");
        String doorNoParam = request.getParameter("door_no");

        int floor_no = (floorNoParam != null && !floorNoParam.isEmpty()) ? Integer.parseInt(floorNoParam) : 0;
        int door_no = (doorNoParam != null && !doorNoParam.isEmpty()) ? Integer.parseInt(doorNoParam) : 0;

        String advanceCost = request.getParameter("advance_cost");
        String rentalCost = request.getParameter("rental_cost");
        String floorSpace = request.getParameter("floor_space");
        String status = request.getParameter("status");
        String bedroom = request.getParameter("bedroom");
        String noticeperiod = request.getParameter("notice_period");

        boolean filtersProvided = advanceCost!=null || rentalCost != null || floorSpace != null || status != null || bedroom != null || noticeperiod!=null;

        List<Apartment> filteredApartments;
        ApartmentDAO apartmentDAO = new ApartmentDAO();

        if (filtersProvided) {
            filteredApartments = apartmentDAO.filterApartments(floor_no, door_no, advanceCost, rentalCost,
                    floorSpace, status, bedroom, noticeperiod);
        } else {
            filteredApartments = apartmentDAO.getAllApartments();
        }
     
        request.setAttribute("filteredApartments", filteredApartments);
        request.getRequestDispatcher("AdminPage.jsp").forward(request, response);
    }


}
