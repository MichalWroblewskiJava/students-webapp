package pl.sda.javagdy2.servlets;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/grade/add")
public class GradeAddServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // muszę wiedzieć któremu studentowi dodajemy ocenę
        // z tego względu przesłaliśmy sobie studenta (jego identyfikator) w parametrze zapytania
        String studentId = req.getParameter("studentId");
        if(studentId == null || studentId.isEmpty()){
            resp.sendRedirect("/student/list");
            return;
        }
        req.setAttribute("student_identifier", studentId);
        // chcemy wyświetlić użytkownikowi formularz dodawania nowej oceny
        req.getRequestDispatcher("/grade_form.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


    }
}
