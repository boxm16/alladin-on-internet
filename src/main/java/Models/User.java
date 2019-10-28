/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

/**
 *
 * @author Michail Sitmalidis
 */
public class User {

    private String email;
    private String firstName;
    private String lastName;
    private String password;
    private String password_confirmation;

    private String landlinePhone;
    private String mobilePhone;

    private String district;
    private String street;
    private String streetNumber;

    private String floor;
    private String postalCode;
    private String bellName;
    private String note;

    public String getStreetNumber() {
        return streetNumber;
    }

    public void setStreetNumber(String streetNumber) {
        this.streetNumber = streetNumber;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setPassword_confirmation(String password_confirmation) {
        this.password_confirmation = password_confirmation;
    }

    public void setLandlinePhone(String landlinePhone) {
        this.landlinePhone = landlinePhone;
    }

    public void setMobilePhone(String mobilePhone) {
        this.mobilePhone = mobilePhone;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public void setFloor(String floor) {
        this.floor = floor;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    public void setBellName(String bellName) {
        this.bellName = bellName;
    }

    public String getEmail() {
        return email;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getPassword() {
        return password;
    }

    public String getPassword_confirmation() {
        return password_confirmation;
    }

    public String getLandlinePhone() {
        return landlinePhone;
    }

    public String getMobilePhone() {
        return mobilePhone;
    }

    public String getNote() {
        return note;
    }

    public String getStreet() {
        return street;
    }

    public String getDistrict() {
        return district;
    }

    public String getFloor() {
        return floor;
    }

    public String getPostalCode() {
        return postalCode;
    }

    public String getBellName() {
        return bellName;
    }

}
