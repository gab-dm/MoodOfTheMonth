package Controller.Employees;

import Model.Employees;
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
import java.sql.Date;

@WebServlet("/updateUser")
public class EditUserController extends HttpServlet {
    EmployeeService employeeService = new EmployeeService();

    Employees employ = new Employees();

    @Override
    public void init() {
        System.out.println("Servlet initialized successfully");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        employ.setNameEmployee(req.getParameter("name"));
        employ.setEmailEmployee(req.getParameter("email"));
        employ.setBirthDateEmployee(java.sql.Date.valueOf(req.getParameter("birthdate")));
        employ.setUuidEmployee(Integer.valueOf(req.getParameter("uuid")));
        req.setAttribute("employ", employ);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/edit-user.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request2,
                          HttpServletResponse response) throws ServletException, IOException {

        String name2 = request2.getParameter("name2");
        String email2= request2.getParameter("email2");
        String birthdate2 = request2.getParameter("date2");

        Date date2 = Date.valueOf(birthdate2);

        try {
            employeeService.updateEmployees(employ.getUuidEmployee(), name2, email2, date2);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        response.sendRedirect("/MoodOfTheMonth/adminPanel");

    }
}
