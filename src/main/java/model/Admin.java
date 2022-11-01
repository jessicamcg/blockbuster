package model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Admin {
  private int id;
  private String firstName;
  private String lastName;
  private String email;
  private String password;

  public boolean validate(String inputName, String inputPassword) {
    if(inputName.equals(email)&& inputPassword.equals(password)) {
      return true;
    } else {
      return false;
    }
  }

}
