/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBTools;

import Models.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
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

    public void registerUser(User user) {
        String sql = "INSERT INTO user(email, password) VALUES(?,?)";
        jdbcTemplate.update(sql, user.getEmail(),user.getPassword());
    }

}
