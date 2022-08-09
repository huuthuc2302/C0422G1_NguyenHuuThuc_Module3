package controller;

import model.facility.Facility;
import model.facility.FacilityType;
import model.facility.RentType;
import service.facility.IFacilityService;
import service.facility.impl.FacilityService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "FacilityServlet", urlPatterns = "/facility")
public class FacilityServlet extends HttpServlet {

    private IFacilityService facilityService = new FacilityService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showFormCreate(request, response);
                break;
            case "update":
                showFormUpdate(request, response);
                break;
            default:
                showFacilityList(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                addFacility(request, response);
                break;
            case "update":
                updateFacility(request, response);
                break;
            case "delete":
                showDelete(request, response);
                break;
            case "search":
//                search(request,response);
                break;
        }
    }


    private void showDelete(HttpServletRequest request, HttpServletResponse response) {
        int facilityId = Integer.parseInt(request.getParameter("facilityId"));
        facilityService.deleteFacility(facilityId);
        List<Facility> facilityList = facilityService.selectAllFacility();
        request.setAttribute("facilityList", facilityList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/facility/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormUpdate(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("facilityID"));
        List<RentType> rentTypeList = facilityService.showRentFacility();
        List<FacilityType> facilityList = facilityService.showFacilityType();
        Facility facility = facilityService.findByIdFacility(id);
        request.setAttribute("facility", facility);
        request.setAttribute("facilityList", facilityList);
        request.setAttribute("rentTypeList", rentTypeList);
        try {
            request.getRequestDispatcher("view/facility/edit.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {

        List<FacilityType> facilityTypeList = facilityService.showFacilityType();
        List<RentType> rentTypeList = facilityService.showRentFacility();
        request.setAttribute("rentTypeList", rentTypeList);
        request.setAttribute("facilityTypeList", facilityTypeList);
        try {
            request.getRequestDispatcher("view/facility/add.jsp").forward(request, response);

        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFacilityList(HttpServletRequest request, HttpServletResponse response) {
        List<Facility> facilityList = facilityService.selectAllFacility();

        request.setAttribute("facilityList", facilityList);

        try {
            request.getRequestDispatcher("view/facility/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void updateFacility(HttpServletRequest request, HttpServletResponse response) {
        String facilityName = request.getParameter("facilityName");
        int facilityArea = Integer.parseInt(request.getParameter("facilityArea"));
        double facilityCost = Double.parseDouble(request.getParameter("facilityCost"));
        int facilityMaxPeople = Integer.parseInt(request.getParameter("facilityMaxPeople"));
        int rentTypeId = Integer.parseInt(request.getParameter("rentTypeId"));
        int facilityTypeId = Integer.parseInt(request.getParameter("facilityTypeId"));
        String standardRoom = request.getParameter("standardRoom");
        String description = request.getParameter("description");
        double poolArea = Double.parseDouble(request.getParameter("poolArea"));
        int numberOfFloor = Integer.parseInt(request.getParameter("numberOfFloor"));
        String facilityFree = request.getParameter("facilityFree");
        int facilityId = Integer.parseInt(request.getParameter("facilityId"));
        Facility facility = new Facility(facilityId,
                facilityName,
                facilityArea,
                facilityCost,
                facilityMaxPeople,
                rentTypeId,
                facilityTypeId,
                standardRoom,
                description,
                poolArea,
                numberOfFloor,
                facilityFree);
        showFacilityList(request, response);
        facilityService.updateFacility(facility);
        showFacilityList(request, response);
    }

    private void addFacility(HttpServletRequest request, HttpServletResponse response) {
        String facilityName = request.getParameter("facilityName");
        int facilityArea = Integer.parseInt(request.getParameter("facilityArea"));
        double facilityCost = Double.parseDouble(request.getParameter("facilityCost"));
        int facilityMaxPeople = Integer.parseInt(request.getParameter("facilityMaxPeople"));
        int rentTypeId = Integer.parseInt(request.getParameter("rentTypeId"));
        int facilityTypeId = Integer.parseInt(request.getParameter("facilityTypeId"));
        String standardRoom = request.getParameter("standardRoom");
        String description = request.getParameter("description");
        double poolArea = Double.parseDouble(request.getParameter("poolArea"));
        int numberOfFloor = Integer.parseInt(request.getParameter("numberOfFloor"));
        String facilityFree = request.getParameter("facilityFree");

        switch (facilityTypeId) {
            case 1:
                facilityFree = "";
                break;
            case 2:
                poolArea = 0;
                facilityFree = "";
                break;
            case 3:
                standardRoom = "";
                description = "";
                numberOfFloor = 0;
                poolArea = 0;
                break;
        }
        Facility facility = new Facility(facilityName,
                facilityArea,
                facilityCost,
                facilityMaxPeople,
                rentTypeId,
                facilityTypeId,
                standardRoom,
                description,
                poolArea,
                numberOfFloor,
                facilityFree);
        facilityService.insertFacility(facility);
        showFacilityList(request, response);

    }
}
