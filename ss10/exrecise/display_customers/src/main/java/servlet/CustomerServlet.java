package servlet;

import model.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet",urlPatterns = {"/customer"})

public class CustomerServlet extends HttpServlet {

    private static List<Customer> customerList = new ArrayList<>();

    @Override
    public void init() throws ServletException{

        customerList.add(new Customer("Mai Văn Hoàn", "1983-08-20", "Hà Nội","img/duong.jpg" ));
        customerList.add(new Customer("Nguyễn Văn Nam", "1983-08-21", "Bắc Giang","img/hang.jpg"));
        customerList.add(new Customer("Nguyễn Thái Hoà", "1983-08-22", "Nam Định","img/lan.jpg"));
        customerList.add(new Customer("Trần Đăng Khoa", "1983-08-17", "Hà Tây","img/dung.jpg"));
        customerList.add(new Customer("Nguyễn Đình Thi", "1983-08-19", "Hà Nội","img/thuy.jpg"));

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/customer/listCus.jsp");
        request.setAttribute("customerList",customerList);
        requestDispatcher.forward(request,response);
    }
}
