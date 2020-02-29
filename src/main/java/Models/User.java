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

    private int id;

    private String emailIdentifier;
    private String password;

    private String passwordConfirmation;
    private String status;

    private String firstName;
    private String lastName;
    private String landlinePhone;
    private String mobilePhone;

    private String street;
    private String district;
    private String floor;
    private String postalCode;
    private String doorbellName;

    private String latitude;
    private String longitude;

    private String note;

    public void setId(int id) {
        this.id = id;
    }

    public void setEmailIdentifier(String emailIdentifier) {
        this.emailIdentifier = emailIdentifier;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setLandlinePhone(String landlinePhone) {
        this.landlinePhone = landlinePhone;
    }

    public void setMobilePhone(String mobilePhone) {
        this.mobilePhone = mobilePhone;
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

    public void setDoorbellName(String doorbellName) {
        this.doorbellName = doorbellName;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getId() {
        return id;
    }

    public String getEmailIdentifier() {
        return emailIdentifier;
    }

    public String getPassword() {
        return password;
    }

    public String getStatus() {
        return status;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getLandlinePhone() {
        return landlinePhone;
    }

    public String getMobilePhone() {
        return mobilePhone;
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

    public String getDoorbellName() {
        return doorbellName;
    }

    public String getLatitude() {
        return latitude;
    }

    public String getLongitude() {
        return longitude;
    }

    public String getNote() {
        return note;
    }

    public void setPasswordConfirmation(String passwordConfirmation) {
        this.passwordConfirmation = passwordConfirmation;
    }

    public String getPasswordConfirmation() {
        return passwordConfirmation;
    }

}
