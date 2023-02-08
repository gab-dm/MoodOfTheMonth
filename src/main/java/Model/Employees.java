package Model;

import java.util.Date;

public class Employees {

  private Integer uuid;
  private String name;
  private String email;
  private Date birthDate;

  public Employees(String name, String email, Date birthDate) {
    this.name = name;
    this.email = email;
    this.birthDate = birthDate;
  }

  public Employees() {
  }

  public Date getBirthDateEmployee() {
    return birthDate;
  }

  public Integer getUuidEmployee() {
    return uuid;
  }

  public String getNameEmployee() {
    return name;
  }

  public String getEmailEmployee() {
    return email;
  }

  public void setBirthDateEmployee(Date date) {
    birthDate = date;
  }

  public void setUuidEmployee(Integer integer) {
    uuid = integer;
  }

  public void setNameEmployee(String string) {
    name = string;
  }

  public void setEmailEmployee(String string) {
    email = string;
  }
}