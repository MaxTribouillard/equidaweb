package servlet;

import java.io.*;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import database.DaoCheval;
import database.DaoVente;
import database.DaoRace;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Cheval;
import model.Lot;
import model.Race;
import model.Vente;
import java.time.LocalDate;

@WebServlet(name= "venteServlet", value="/vente-servlet/*")
public class VenteServlet extends HttpServlet {

    Connection cnx;

    public void init(){
        ServletContext servletContext = getServletContext();
        cnx = (Connection) servletContext.getAttribute("connection");
        try {
            System.out.println("INIT SERVLET=" + cnx.getSchema());
        } catch (SQLException ex) {
            Logger.getLogger(VenteServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String path = request.getPathInfo();
        System.out.println("PathInfo: " + path);

        if ("/list".equals(path)) {
            ArrayList<Vente> lesVentes = DaoVente.getLesVentes(cnx);
            request.setAttribute("pLesVentes", lesVentes);
            this.getServletContext().getRequestDispatcher("/WEB-INF/views/vente/list.jsp").forward(request, response);
        }
        if ("/show".equals(path)) {
            try {
                int idVente = Integer.parseInt(request.getParameter("idVente"));
                Lot lot = DaoVente.getLotByVenteId(cnx, idVente);

                if (lot != null) {
                    request.setAttribute("pLot", lot);
                    this.getServletContext().getRequestDispatcher("/WEB-INF/views/vente/show.jsp").forward(request, response);
                } else {
                    response.sendRedirect(request.getContextPath() + "/vente-servlet/lister");
                }
            } catch (NumberFormatException e) {
                System.out.println("Erreur : l'id de la vente n'est pas un nombre valide");
                response.sendRedirect(request.getContextPath() + "/vente-servlet/lister");
            }

        }

        if ("/add".equals(path)) {
            ArrayList<Race> lesRaces = DaoRace.getLesRaces(cnx);
            request.setAttribute("pLesRaces", lesRaces);
            this.getServletContext().getRequestDispatcher("/WEB-INF/views/vente/add.jsp").forward(request, response);
        }


    }

}
