package Controller;

import Service.MoodService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("motm")
public class MOTMController extends HttpServlet {

    MoodService moodService = new MoodService();

    @Override
    public void init() {
        System.out.println("Servlet initialized successfully");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        RequestDispatcher dispatcher = req.getRequestDispatcher("/MOTM.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // read form fields
        String note = req.getParameter("note");
        String comment = req.getParameter("content");
        String checkbox = req.getParameter("public");
        String publicly = "no";
        if (checkbox != null) {
            publicly = "yes";
        }

        try {
            moodService.addMood(note, comment, publicly);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        resp.sendRedirect("/helloworld/dashboard");
    }
}
