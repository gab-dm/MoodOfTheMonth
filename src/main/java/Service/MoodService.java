package Service;

import DAO.MoodDao;

import java.sql.Date;
import java.sql.SQLException;

public class MoodService {

    private MoodDao moodDao = new MoodDao();
    public MoodService() {

    }

    public void addMood(String note, String comment, String publicly) throws SQLException {
        moodDao.addMood(note, publicly, comment);
        //employeesDAO.addEmployees(name, email, birthDate);
    }
}
