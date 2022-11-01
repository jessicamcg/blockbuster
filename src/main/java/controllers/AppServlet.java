package controllers;

import dao.AdminDAO;
import dao.CustomerDAO;
import dao.MovieDAO;
import model.Admin;
import model.Customer;
import model.Movie;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/")
public class AppServlet extends HttpServlet {
  private CustomerDAO CDAO;
  private AdminDAO ADAO;
  private MovieDAO MDAO;

  public void init() {
    CDAO = new CustomerDAO();
    ADAO = new AdminDAO();
    MDAO = new MovieDAO();
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    doGet(request, response);
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    String action = request.getServletPath();

    try {
      switch (action) {
        case "/":
          renderHome(request, response);
          break;
        case "/login":
          renderLogin(request, response);
          break;
        case "/signup":
          renderSignup(request, response);
          break;
        case "/auth" :
          auth(request, response);
          break;
        case "/newcustomer" :
          insertNewCustomer(request, response);
          break;
        case "/movies" :
          renderMovies(request, response);
          break;
        default:
          renderHome(request, response);
          break;
      }
    } catch (Exception ex) {
      ex.printStackTrace();
    }
  }

  private void renderMovies(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session=request.getSession();
    if (session.getAttribute("auth") == null) {
      renderLogin(request, response);
    } else {
      List<Movie> movies = MDAO.selectAllTitles();
      request.setAttribute("movies", movies);
      RequestDispatcher dispatcher = request.getRequestDispatcher("movies.jsp");
      dispatcher.forward(request, response);
    }
  }

  private void renderSignup(HttpServletRequest request, HttpServletResponse response) throws IOException {
    response.sendRedirect("signup.jsp");
  }

  private void renderLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
    response.sendRedirect("login.jsp");
  }

  private void renderHome(HttpServletRequest request, HttpServletResponse response) throws IOException {
    response.sendRedirect("index.jsp");
  }

  private void auth (HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {

    String email=request.getParameter("email");
    String password=request.getParameter("password");

    if (ADAO.getAdmin(email) != null) {
      Admin admin = ADAO.getAdmin(email);
      if(email.equals(admin.getEmail())&& password.equals(admin.getPassword())) {
        HttpSession session=request.getSession();
        session.setAttribute("auth", admin);
        response.sendRedirect("movies");
      } else {
        loginError(request,response);
      }
    } else if (CDAO.getCustomer(email) != null){
      Customer customer = CDAO.getCustomer(email);
      if (email.equals(customer.getEmail())&& password.equals(customer.getPassword())){
        HttpSession session=request.getSession();
        session.setAttribute("auth", customer);
        response.sendRedirect("movies");
      } else {
        loginError(request,response);
      }
    } else {
      loginError(request,response);
    }
  }

  private void loginError(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    response.setContentType("text/html");
    PrintWriter pw=response.getWriter();

    pw.print("<div class=\"alert alert-danger\" role=\"alert\">\n" +
            "  Invalid Email/Password\n" +
            "</div>");

    RequestDispatcher rd=request.getRequestDispatcher("/login.jsp");
    rd.include(request, response);
  }

  private void insertNewCustomer(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
    String firstName = request.getParameter("firstname");
    String lastName = request.getParameter("lastname");
    int phone = Integer.parseInt(request.getParameter("phone"));
    String address = request.getParameter("address");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    Customer newCustomer = new Customer(firstName,lastName,phone,address,email,password);
    CDAO.insertCustomer(newCustomer);

    Customer customer = CDAO.getCustomer(email);
    HttpSession session=request.getSession();
    session.setAttribute("auth", customer);
    response.sendRedirect("titles");

  }
}