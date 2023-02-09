package Controller.Employees;

import DAO.EmployeesDAO;
import Model.Employees;
import Service.EmployeeService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/deleteUser")
public class DeleteUserController extends HttpServlet {

    EmployeesDAO employeesDAO = new EmployeesDAO();
    @Override
    public void init() {
        System.out.println("Servlet initialized successfully");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Integer id = Integer.valueOf(req.getParameter("id"));
        try {
            employeesDAO.deleteEmployees(id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        resp.sendRedirect("/MoodOfTheMonth/adminPanel");
    }
}
