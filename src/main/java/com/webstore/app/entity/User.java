package com.webstore.app.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "users")
public class User {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "user_id")
  private Long    id;

  @Column(name = "user_email")
  private String  userEmail;
  
  private String phone;

  @Column(name = "user_pass")
  private String  userPass;

  @Column(name = "user_role")
  private boolean userRole;

  @Column(name = "usergroup_id")
  private int     groupid;

  public User(Long id, String userEmail, String userPass, boolean userRole, int groupid, String phone) {
    this.id = id;
    this.userEmail = userEmail;
    this.userPass = userPass;
    this.userRole = userRole;
    this.groupid = groupid;
    this.phone = phone;
  }

  public User() {}

  
  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }

  public int getGroupid() {
    return groupid;
  }

  public void setGroupid(int groupid) {
    this.groupid = groupid;
  }

  public Long getId() {
    return this.id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getUserEmail() {
    return userEmail;
  }

  public void setUserEmail(String userEmail) {
    this.userEmail = userEmail;
  }

  public String getUserPass() {
    return userPass;
  }

  public void setUserPass(String userPass) {
    this.userPass = userPass;
  }

  public boolean isUserRole() {
    return userRole;
  }

  public void setUserRole(boolean userRole) {
    this.userRole = userRole;
  }

  @Override
  public String toString() {
    return "User [user_id=" + id + ", userEmail=" + userEmail + ", userPass=" + userPass
        + ", userRole=" + userRole + ", groupid=" + groupid + "]";
  }
}
