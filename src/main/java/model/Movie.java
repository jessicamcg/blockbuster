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


}
