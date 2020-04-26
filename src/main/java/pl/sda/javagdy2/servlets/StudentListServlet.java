package pl.sda.javagdy2.servlets;

import pl.sda.javagdy2.database.EntityDao;
import pl.sda.javagdy2.database.model.Student;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Comparator;
import java.util.List;


@WebServlet("/student/list")
public class StudentListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        EntityDao dao = new EntityDao();
        List<Student> lista = dao.list(Student.class);

        lista.sort(new Comparator<Student>() {
            @Override
            public int compare(Student o1, Student o2) {
//                return o1.getId().compareTo(o2.getId());
                return Long.compare(o1.getId(), o2.getId());
            }
        });

        req.setAttribute("students",lista);

        RequestDispatcher dispatcher= req.getRequestDispatcher("/student_list.jsp");
        dispatcher.forward(req,resp);

    }
}
