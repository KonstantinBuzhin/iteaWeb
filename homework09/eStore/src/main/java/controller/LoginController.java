package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.DBWorker;
import model.SignIn;


public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private SignIn signIn;
    private DBWorker dbWorker;

    public LoginController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/login.jsp");
		rd.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("login")!=null || request.getParameter("password") != null) {
			signIn = new SignIn(request.getParameter("login"), request.getParameter("password"));
			request.setAttribute("currentUser", signIn);
			dbWorker = new DBWorker(signIn);
			request.setAttribute("currentDB", dbWorker);
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/login.jsp");
			rd.forward(request, response);
		} else {
			doGet(request, response);
		}
	}

}
