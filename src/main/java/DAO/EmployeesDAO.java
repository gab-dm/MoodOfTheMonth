package DAO;

import Model.Employees;

import java.sql.*;
//import java.sql.Date;
import java.util.ArrayList;


public class EmployeesDAO {

    private static ArrayList<Employees> employees = new ArrayList<Employees>();

    private final Connection connection;

    public EmployeesDAO() {
        String url = "jdbc:postgresql://localhost:5432/postgres";
        String password = "mypassword";
        String username = "myusername";

        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection(url, username, password);

        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void addEmployees(String name, String email, Date birthDate) throws SQLException {
        employees.add(new Employees(name, email, birthDate));
        String sql = "INSERT INTO employees (name, email, birthdate) VALUES (?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, name);
            statement.setString(2, email);
            statement.setDate(3, birthDate);
            statement.executeUpdate();
        }
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