/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBTools;

import Models.User;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Michail Sitmalidis
 */
@Repository
public class UserDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public boolean userExists(String email) {
        String sql = "SELECT count(*) FROM customer WHERE email_identifier = ?";

        int count = jdbcTemplate.queryForObject(sql, new Object[]{email}, Integer.class);
        return count > 0;

    }

    public void registerUser(User user, String token, String url) {
        String user_query = "INSERT INTO customer (email_identifier, password, status) VALUES(?,?,?)";
        String token_query = "INSERT INTO verification_token (email, token, status, url) VALUES(?,?,?,?)";
        jdbcTemplate.update(user_query, user.getEmailIdentifier(), user.getPassword(), "pending");
        jdbcTemplate.update(token_query, user.getEmailIdentifier(), token, "letter_pending", url);
    }

    public boolean registrationPending(String email, String token) {
        String sql = "SELECT count(*) FROM verification_token WHERE email=? and token = ? ";

        int count = jdbcTemplate.queryForObject(sql, new Object[]{email, token}, Integer.class);
        return count > 0;
    }

    public void confirmRegistration(String email) {

        String confirmation_query = "UPDATE customer SET status='activated' where email_identifier=?";
        String delete_token_query = "DELETE FROM  verification_token WHERE email=?";
        jdbcTemplate.update(confirmation_query, email);
        jdbcTemplate.update(delete_token_query, email);
    }

    public boolean validPassword(User user) {

        String query = "SELECT password FROM customer WHERE email_identifier=?";
        String stored_hash = jdbcTemplate.queryForObject(query, new Object[]{user.getEmailIdentifier()}, String.class);
        return BCrypt.checkpw(user.getPassword(), stored_hash);

    }

    public User getUser(String email) {
        String sql = "SELECT * FROM customer WHERE email_identifier = ? ";

        User user = (User) jdbcTemplate.queryForObject(sql, new Object[]{email}, new CustomerRowMapper());
        return user;
    }
    public User getUser(int id) {
        String sql = "SELECT * FROM customer WHERE id = ? ";

        User user = (User) jdbcTemplate.queryForObject(sql, new Object[]{id}, new CustomerRowMapper());
        return user;
    }

    public void updateUser(User user) {
        String updateQuery = "UPDATE customer SET street = ?, district=?, floor=?, postal_code=?, doorbell_name=?, landline_phone=?, mobile_phone=?, latitude=?, longitude=? WHERE id = ?";
        String street = user.getStreet();
        String district = user.getDistrict();
        String floor = user.getFloor();
        String postal_code = user.getPostalCode();
        String doorbellName = user.getDoorbellName();
        String lat = user.getLatitude();
        String longitude = user.getLongitude();
        String landlinePhone = user.getLandlinePhone();
        String mobilePhone = user.getMobilePhone();
        int id = user.getId();
        System.out.println("ID IS"+id);
        jdbcTemplate.update(updateQuery, street, district, floor, postal_code, doorbellName, landlinePhone, mobilePhone, lat, longitude,id);

    }

    private class CustomerRowMapper implements RowMapper {

        public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
            User user = new User();
            user.setId(rs.getInt("id"));
            user.setEmailIdentifier(rs.getString("email_Identifier"));
            user.setPassword(rs.getString("password"));
            user.setStatus(rs.getString("status"));
            user.setFirstName(rs.getString("first_name"));
            user.setLandlinePhone(rs.getString("landline_phone"));
            user.setMobilePhone(rs.getString("mobile_phone"));
            user.setStreet(rs.getString("street"));
            user.setDistrict(rs.getString("district"));

            user.setFloor(rs.getString("floor"));
            user.setPostalCode(rs.getString("postal_code"));
            user.setDoorbellName(rs.getString("doorbell_name"));
            user.setNote(rs.getString("note"));
            user.setLatitude("latitude");
            user.setLongitude("longitude");

            return user;
        }

    }
}
