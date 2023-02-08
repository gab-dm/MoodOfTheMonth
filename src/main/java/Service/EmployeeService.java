package Service;

import DAO.EmployeesDAO;
import Model.Employees;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

public class EmployeeService {

    private static ArrayList<Employees> employees = new ArrayList<Employees>();
    private EmployeesDAO employeesDAO;

    public EmployeeService() {
        //this.employeesDAO = employeesDAO;
    }

    public static ArrayList<Employees> getListOfEmployees() {
        return employees;
    }

    public void addEmployees(String name, String email, Date birthDate) throws SQLException {
        employees.add(new Employees(name, email, birthDate));
        //employeesDAO.addEmployees(name, email, birthDate);
    }

    public Employees getEmployees(int id) throws SQLException {
        return employeesDAO.getEmployees(id);
    }

    public void updateEmployees(Employees employees) throws SQLException {
        employeesDAO.updateEmployees(employees);
    }

    public void deleteEmployees(int id) throws SQLException {
        employeesDAO.deleteEmployees(id);
    }
}
