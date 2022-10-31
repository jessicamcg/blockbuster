package dao;

import lombok.NoArgsConstructor;

import java.sql.DriverManager;
import java.sql.SQLException;

@NoArgsConstructor
public class Connection {
  private String jdbcURL = "jdbc:mysql://localhost:3306/blockbuster?useSSL=false";
  private String jdbcUsername = "root";
  private String jdbcPassword = "";

  protected java.sql.Connection getConnection() {
    java.sql.Connection connection = null;
    try {
      Class.forName("com.mysql.cj.jdbc.Driver");//MySQL database version 8.0
      connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    } catch (SQLException e) {
      e.printStackTrace();
    } catch (ClassNotFoundException e) {
      e.printStackTrace();
    }
    return connection;
  }

}
