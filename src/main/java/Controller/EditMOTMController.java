package Controller;

import Model.Motm;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/editMOTM")
public class EditMOTMController extends HttpServlet {

    private Motm motmTemplate = new Motm();
    @Override
    public void init() {
        System.out.println("Servlet initialized successfully");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        RequestDispatcher dispatcher = req.getRequestDispatcher("/edit-MOTM.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {

        // read form fields
        String subject = request.getParameter("name");
        String content = request.getParameter("email-template");
        String motm = request.getParameter("motm-template");

        motmTemplate.setSubject(subject);
        motmTemplate.setContent(content);
        motmTemplate.setMotm(motm);

        response.sendRedirect("/MoodOfTheMonth/template");
    }
}
