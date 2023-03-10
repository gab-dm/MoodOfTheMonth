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

    public Integer getNumberOfEmployees() {
        String sql = "SELECT COUNT(*) AS count FROM employees";
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            int count = rs.getInt("count");
            rs.close();
            return count;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ResultSet getEmployees() {
        String sql = "SELECT * FROM employees";
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            return rs;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
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

    public void updateEmployees(Integer id, String nom, String email, Date date) throws SQLException {
        String sql = "UPDATE employees SET name = ?, email = ?, birthdate = ? WHERE uuid = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, nom);
            statement.setString(2, email);
            statement.setDate(3, date);
            statement.setInt(4, id);
            statement.executeUpdate();
        }
    }

    public void deleteEmployees(int id) throws SQLException {
        String sql = "DELETE FROM employees WHERE uuid = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        }
    }
    }