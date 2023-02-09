package DAO;

import Model.Employees;

import java.sql.*;

public class MoodDao {

    private final Connection connection;

    public MoodDao() {
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

    public void addMood(String mark, String name, String comment) throws SQLException {
        String sql = "INSERT INTO moods (mark, name, comment) VALUES (?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, Integer.parseInt(mark));
            statement.setString(2, name);
            statement.setString(3, comment);
            statement.executeUpdate();
        }
    }

    public ResultSet getMood() {
        String sql = "SELECT * FROM moods";
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            return rs;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public Integer getNumberOfMoods() {
        String sql = "SELECT COUNT(*) AS count FROM moods";
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
    


}
