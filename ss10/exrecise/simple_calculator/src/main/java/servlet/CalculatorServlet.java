package servlet;

import services.CalculatorServices;
import unit.CalculatorException;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", urlPatterns = "/calculator")

public class CalculatorServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float numberOne = Float.parseFloat(request.getParameter("numberOne"));
        float numberTwo = Float.parseFloat(request.getParameter("numberTwo"));
        char operator = request.getParameter("operator").charAt(0);
        String result = null;
        try {
            result = String.valueOf(CalculatorServices.calculate(numberOne,numberTwo,operator));
        } catch (CalculatorException e) {
            result = e.getMessage();
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/caculator/listCalcu.jsp");
        request.setAttribute("numberOne", numberOne);
        request.setAttribute("numberTwo", numberTwo);
        request.setAttribute("operator", operator);
        request.setAttribute("result",result);
        requestDispatcher.forward(request,response);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/caculator/listCalcu.jsp");
        requestDispatcher.forward(request,response);
    }
}
