package servlet;

import model.Calculator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CalculatorServlet", urlPatterns = "/calculator")

public class CalculatorServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float numberOne = Float.parseFloat(request.getParameter("numberOne"));
        float numberTwo = Float.parseFloat(request.getParameter("numberTwo"));
        char operator = request.getParameter("operator").charAt(0);
        float result = Calculator.calculate(numberOne,numberTwo,operator);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
        request.setAttribute("numberOne", numberOne);
        request.setAttribute("numberTwo", numberTwo);
        request.setAttribute("operator", operator);
        request.setAttribute("result",result);
        requestDispatcher.forward(request,response);
    }
}
