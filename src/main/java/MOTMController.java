import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("motm")
public class MOTMController extends HttpServlet {

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


        System.out.println("note: " + note);
        System.out.println("comment: " + comment);
        System.out.println("Public: " + checkbox);

        // do some processing here...

        // get response writer
        PrintWriter writer = resp.getWriter();

        // build HTML code
        String htmlResponse = "<html>";
        htmlResponse += "<h2>Your mood: " + note + "<br/>";
        htmlResponse += "Your comment: " + comment + "<br/>";
        if (checkbox != null) {
            htmlResponse += "Your comment will be public <h2/>";
        }
        else {
            htmlResponse += "Your comment will be private";
        }

        htmlResponse += "</html>";

        // return response
        writer.println(htmlResponse);

    }
}
