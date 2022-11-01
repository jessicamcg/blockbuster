package model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Customer {
  private int id;
  private String firstName;
  private String lastName;
  private int phone;
  private String address;
  private String email;
  private String password;

  public Customer(String firstName, String lastName, int phone, String address, String email, String password) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.phone = phone;
    this.address = address;
    this.email = email;
    this.password = password;
  }

  public boolean validate(String inputName, String inputPassword) {
    if(inputName.equals(email)&& inputPassword.equals(password)) {
      return true;
    } else {
      return false;
    }
  }
}
