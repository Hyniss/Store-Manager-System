/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author DELL
 */
public class Feedback {
    private String name;
    private String email;
    private String phone;
    private String fback;

    public Feedback() {
    }

    public Feedback(String name, String email, String phone, String fback) {
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.fback = fback;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getFback() {
        return fback;
    }

    public void setFback(String fback) {
        this.fback = fback;
    }
    
    
}
