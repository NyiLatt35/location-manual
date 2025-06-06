package com.jdc.locations;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/locations")

public class LocationServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Resource (name = "jdbc/LocationDB")
	private DataSource dataSource;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		var list = new ArrayList<>();

		try (var conn = dataSource.getConnection();
				var stmt = conn.prepareStatement("select * from state")) {

			var result = stmt.executeQuery();

			while (result.next()) {
				var data = new Location(
						result.getInt(1), 
						result.getString(2), 
						result.getString(3), 
						result.getString(4),
						result.getString(5), 
						result.getString(6)
					);
				list.add(data);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		req.setAttribute("list", list);
		req.getRequestDispatcher("index.jsp").forward(req, resp);
	}

}
