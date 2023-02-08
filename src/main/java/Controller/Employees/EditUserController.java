package Controller.Employees;

import Service.EmployeeService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/updateUser")
public class EditUserController extends HttpServlet {
    EmployeeService employeeService = new EmployeeService();

    @Override
    public void init() {
        System.out.println("Servlet initialized successfully");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        RequestDispatcher dispatcher = req.getRequestDispatcher("/add-user.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {

        // read form fields
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String birthdate = request.getParameter("date");
        SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
        try {
            Date date = format.parse(birthdate);
            //appel de la méthode addEmployees de la classe Service.EmployeeService
            //employeeService.updateEmployees(name, email, date);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }

        // get response writer
        PrintWriter writer = response.getWriter();

    }
}
