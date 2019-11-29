/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBTools;

import Models.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
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
        String sql = "SELECT count(*) FROM user WHERE email = ?";

        int count = jdbcTemplate.queryForObject(sql, new Object[]{email}, Integer.class);
        return count > 0;

    }

    public void registerUser(User user, String token) {
        String user_query = "INSERT INTO user (email, password, status) VALUES(?,?,?)";
        String token_query = "INSERT INTO verification_token (email, token) VALUES(?,?)";
        jdbcTemplate.update(user_query, user.getEmail(), user.getPassword(), "pending");
        jdbcTemplate.update(token_query, user.getEmail(), token);
    }

    public boolean registrationPending(String email, String token) {
        String sql = "SELECT count(*) FROM verification_token WHERE email = ? and token=?";

        int count = jdbcTemplate.queryForObject(sql, new Object[]{email, token}, Integer.class);
        return count > 0;
    }

    public void confirmRegistration(String email, String token) {

        String confirmation_query = "UPDATE user SET status='active' where email=?";
        String delete_token_query = "DELETE FROM  verification_token WHERE token=?";
        jdbcTemplate.update(confirmation_query, email);
        jdbcTemplate.update(delete_token_query, token);
    }
}
