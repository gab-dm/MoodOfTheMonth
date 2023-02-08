import java.sql.SQLException;
import java.util.Date;

public class UserService {

    private UserDAO userDAO;

    public UserService(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    public void addUser(String name, String email, Date birthDate) throws SQLException {
        userDAO.addUser(name, email, birthDate);
    }

    public User getUser(int id) throws SQLException {
        return userDAO.getUser(id);
    }

    public void updateUser(User user) throws SQLException {
        userDAO.updateUser(user);
    }

    public void deleteUser(int id) throws SQLException {
        userDAO.deleteUser(id);
    }
}
