package DAO;

import Model.Employees;

import java.sql.Connection;
//import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.text.SimpleDateFormat;

public class EmployeesDAO {

    //private final Connection connection;
    private static ArrayList<Employees> employees = new ArrayList<Employees>();

    public EmployeesDAO(Connection connection) {
        //this.connection = connection;
    }

    public EmployeesDAO() {

    }

    public void addEmployees(String name, String email, Date birthDate) throws SQLException {
        employees.add(new Employees(name, email, birthDate));
//        String sql = "INSERT INTO employees (name, email, birth_date) VALUES (?, ?, ?)";
//        try (PreparedStatement statement = connection.prepareStatement(sql)) {
//            statement.setString(1, name);
//            statement.setString(2, email);
//            statement.setDate(3, (java.sql.Date) birthDate);
//            statement.executeUpdate();
//        }
    }
    public static ArrayList<Employees> getListOfEmployees() {
        return employees;
    }
//    public Employees getEmployees(int id) throws SQLException {
//        String sql = "SELECT * FROM users WHERE id = ?";
////        try (PreparedStatement statement = connection.prepareStatement(sql)) {
////            statement.setInt(1, id);
////            try (ResultSet resultSet = statement.executeQuery()) {
////                if (resultSet.next()) {
////                    String name = resultSet.getString("name");
////                    String email = resultSet.getString("email");
////                    Date birthDate = resultSet.getDate("birth_date");
////                    return new Employees(name, email, birthDate);
////                } else {
////                    return null;
////                }
////            }
////        }
//    }

//    public void updateEmployees(Employees employees) throws SQLException {
//        String sql = "UPDATE users SET name = ?, email = ?, birth_date = ? WHERE id = ?";
//        try (PreparedStatement statement = connection.prepareStatement(sql)) {
//            statement.setString(1, employees.getNameEmployee());
//            statement.setString(2, employees.getEmailEmployee());
//            statement.setDate(3, (java.sql.Date) employees.getBirthDateEmployee());
//            statement.setInt(4, employees.getUuidEmployee());
//            statement.executeUpdate();
//        }
//    }

//    public void deleteEmployees(int id) throws SQLException {
//        String sql = "DELETE FROM users WHERE id = ?";
//        try (PreparedStatement statement = connection.prepareStatement(sql)) {
//            statement.setInt(1, id);
//            statement.executeUpdate();
//        }
//    }
    }