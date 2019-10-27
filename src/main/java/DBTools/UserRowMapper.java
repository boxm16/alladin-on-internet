/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBTools;

import Models.User;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author Michail Sitmalidis
 */
public class UserRowMapper implements RowMapper<User>{

    @Override
    public User mapRow(ResultSet rs, int i) throws SQLException {
   User user=new User();
   user.setEmail(rs.getString("email"));
        System.out.println("you still need to map rows for user");
    
   return user;
    }
    
}
