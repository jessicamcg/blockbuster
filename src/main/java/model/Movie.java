package model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Movie {

  private int id;
  private String title;
  private String summary;
  private float price;
  private int stock;
  private String imageURL;
  private int categoryID;


  public Movie(String title, String summary, float price, int stock, String imageURL, int categoryID) {
    this.title = title;
    this.summary = summary;
    this.price = price;
    this.stock = stock;
    this.imageURL = imageURL;
    this.categoryID = categoryID;
  }
}
