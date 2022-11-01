package dao;

import model.Movie;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MovieDAO {
  public MovieDAO() { }
  private static final String SELECT_ALL_MOVIES = "select * from movie;";

  public List<Movie> selectAllTitles() {

    List<Movie> movies = new ArrayList< >();
    try (java.sql.Connection connection = dao.Connection.getConnection();
         PreparedStatement ps = connection.prepareStatement(SELECT_ALL_MOVIES);) {
      ResultSet rs = ps.executeQuery();

      while (rs.next()) {
        int id = rs.getInt("id");
        String title = rs.getString("title");
        String summary = rs.getString("summary");
        float price = rs.getFloat("price");
        int stock = rs.getInt("stock");
        String imageURL = rs.getString("image_url");
        int categoryID = rs.getInt("category_id");
        movies.add(new Movie(id, title, summary, price, stock, imageURL,categoryID));
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return movies;
  }

}
