package Service;

import DAO.EmployeesDAO;
import Model.Employees;

import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;

public class EmployeeService {


    private EmployeesDAO  employeesDAO= new EmployeesDAO();

    public EmployeeService() {
        //this.employeesDAO = employeesDAO;
    }



    public void addEmployees(String name, String email, Date birthDate) throws SQLException {

        employeesDAO.addEmployees(name, email, birthDate);
    }

//    public Employees getEmployees(int id) throws SQLException {
//        return employeesDAO.getEmployees(id);
//    }
////
//    public void updateEmployees(Employees employees) throws SQLException {
//        employeesDAO.updateEmployees(employees);
//    }
////
//    public void deleteEmployees(int id) throws SQLException {
//        employeesDAO.deleteEmployees(id);
//    }
}
