package controller;

import model.facility.Facility;
import model.facility.FacilityType;
import model.facility.RentType;
import service.facility.IFacilityService;
import service.facility.IFacilityTypeService;
import service.facility.IRentTypeService;
import service.facility.impl.FacilityService;
import service.facility.impl.FacilityTypeService;
import service.facility.impl.RentTypeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "FacilityServlet", urlPatterns = "/facility")
public class FacilityServlet extends HttpServlet {

    private IFacilityService facilityService = new FacilityService();
    private IFacilityTypeService facilityTypeService = new FacilityTypeService();
    private IRentTypeService rentTypeService = new RentTypeService();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "create":
                showFormCreate(request,response);
                break;
            case "update":
//                showFormUpdate(request,response);
                break;
            default:
                showFacilityList(request,response);
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "create":
                save(request,response);
                break;
            case "update":
//                update(request,response);
                break;
            case "delete":
//                delete(request,response);
                break;
            case "search":
//                search(request,response);
                break;
        }
    }



    private void showFacilityList(HttpServletRequest request, HttpServletResponse response) {
        List<Facility> facilityList = facilityService.selectAllFacility();
//        Map<Integer, String> mapFacilityType = facilityTypeService.selectFacilityType();
//        Map<Integer, String> mapRentType = rentTypeService.selectRentType();

        request.setAttribute("facilityList",facilityList);
//        request.setAttribute("mapRentType",mapRentType);
//        request.setAttribute("mapFacilityType",mapFacilityType);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/facility/list.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        List<RentType> rentTypeList = rentTypeService.selectAll();
        List<FacilityType> facilityTypeList = facilityTypeService.selectAll();
        request.setAttribute("rentTypeList",rentTypeList);
        request.setAttribute("serviceTypeList",facilityTypeList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/facility/add.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void save(HttpServletRequest request, HttpServletResponse response) {
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
        Facility facility = new Facility(facilityName, facilityArea, facilityCost, facilityMaxPeople, rentTypeId,
                facilityTypeId, standardRoom, description, poolArea, numberOfFloor);
        Map<String, String> validate = facilityService.save(facility);
        if (validate.isEmpty()){
            request.setAttribute("message","Thêm mới thành công");
        }else {
            request.setAttribute("message","Thêm mới không thành công");
            request.setAttribute("error",validate);
            request.setAttribute("facility",facility);
        }
        showFormCreate(request,response);
    }
}
