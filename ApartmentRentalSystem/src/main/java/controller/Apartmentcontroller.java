package controller;

import dao.ApartmentDAO;
import model.Apartment;

import java.util.List;

public class Apartmentcontroller {

    private final ApartmentDAO apartmentDAO = new ApartmentDAO();

   
    public List<Apartment> getAllApartments() {
        return apartmentDAO.getAllApartments();
    }

    
    public Apartment getApartmentById(int id) {
        return apartmentDAO.getApartmentById(id);
    }

    
    public void updateApartment(Apartment apartment) {
        apartmentDAO.updateApartment(apartment);
    }
}
