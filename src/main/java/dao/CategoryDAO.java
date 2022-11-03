package dao;

import model.Category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO {
  public CategoryDAO() { }

  private static final String SELECT_ALL_CATEGORIES = "select * from category";
  private static final String SELECT_CATEGORY_BY_ID = "select * from category where id =?;";
  private static final String UPDATE_CATEGORY_BY_ID = "update category set category_name = ? where id = ?;";
  private static final String INSERT_CATEGORY = "insert into category (category_name) values (?)";
  private static final String DELETE_CATEGORY = "delete from category where id=?;";

  public void insertCategory(Category cat) throws SQLException {
    try (java.sql.Connection connection = dao.Connection.getConnection();
         PreparedStatement ps = connection.prepareStatement(INSERT_CATEGORY);) {
      ps.setString(1, cat.getName());
      ps.executeUpdate();
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }

  public Category selectCat(int id) {
    Category cat = null;
    try (java.sql.Connection connection = dao.Connection.getConnection();
         PreparedStatement ps = connection.prepareStatement(SELECT_CATEGORY_BY_ID);) {
      ps.setInt(1, id);
      ResultSet rs = ps.executeQuery();

      while (rs.next()) {
        String name = rs.getString("category_name");
        cat = new Category(id, name);
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return cat;
  }

  public void updateCat(Category cat) throws SQLException {
    try (java.sql.Connection connection = dao.Connection.getConnection();
         PreparedStatement ps = connection.prepareStatement(UPDATE_CATEGORY_BY_ID);) {
      ps.setString(1, cat.getName());
      ps.setInt(2, cat.getId());

      ps.executeUpdate();
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }

  public boolean deleteCat(int id) throws SQLException {
    boolean rowDeleted;
    try (java.sql.Connection connection = dao.Connection.getConnection();
         PreparedStatement ps = connection.prepareStatement(DELETE_CATEGORY);) {
      ps.setInt(1, id);
      rowDeleted = ps.executeUpdate() > 0;
    }
    return rowDeleted;
  }

  public List<Category> selectAllCats() {

    List <Category> cats = new ArrayList< >();
    try (java.sql.Connection connection = dao.Connection.getConnection();
         PreparedStatement ps = connection.prepareStatement(SELECT_ALL_CATEGORIES);) {
      ResultSet rs = ps.executeQuery();

      while (rs.next()) {
        int id = rs.getInt("id");
        String name = rs.getString("category_name");
        cats.add(new Category(id,name));
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return cats;
  }
}
