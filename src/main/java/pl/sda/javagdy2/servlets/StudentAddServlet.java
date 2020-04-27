package pl.sda.javagdy2.servlets;

import pl.sda.javagdy2.database.EntityDao;
import pl.sda.javagdy2.database.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/student/add")
public class StudentAddServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/student_form.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Student student = Student.builder()
                .imie(req.getParameter("imie"))
                .nazwisko(req.getParameter("nazwisko"))
                /* jeśli pełnoletni jest zaznaczone, to przyjmuje wartość "on" - text/String/on */
                .pelnoletni(req.getParameter("pelnoletni") != null)
                .wzrost(Double.parseDouble(req.getParameter("wzrost")))
                .build();
        EntityDao dao = new EntityDao();
        dao.saveOrUpdate(student);
        //response.sendRedirect("student_list.jsp");


        resp.sendRedirect(getServletContext().getContextPath()+"/student/list");

    }
}
