import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DiscountServlet", value = "/display-discount")
public class DiscountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float price = Float.parseFloat(request.getParameter("PRICE"));
        float percent = Float.parseFloat(request.getParameter("PERCENT"));

        float amount = (float) (price * percent * 0.01);
        float discount_price = price - amount;
        RequestDispatcher dispatcher = request.getRequestDispatcher("result.jsp");
        request.setAttribute("discount_amount",amount);
        request.setAttribute("discount_price",discount_price);
        dispatcher.forward(request,response);
    }
}
