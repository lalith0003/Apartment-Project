package controller;

import dao.ApartmentDAO;
import model.Apartment;

import java.util.List;

public class Apartmentcontroller {

    private final ApartmentDAO apartmentDAO = new ApartmentDAO();

    // Get all apartments
    public List<Apartment> getAllApartments() {
        return apartmentDAO.getAllApartments();
    }

    // Get apartment by ID
    public Apartment getApartmentById(int id) {
        return apartmentDAO.getApartmentById(id);
    }

    // Update apartment
    public void updateApartment(Apartment apartment) {
        apartmentDAO.updateApartment(apartment);
    }
}
