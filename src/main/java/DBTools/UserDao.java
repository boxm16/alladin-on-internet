/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBTools;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Michail Sitmalidis
 */
@Repository
public class UserDao {

    public void insert() {
        String query = "INSERT INTO user (username) VALUES('BUBU');";
        try (Connection connection = DataBaseConnection.getInitConnection()) {
            Statement statement = connection.createStatement();
            statement.execute(query);
            statement.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);

        }

    }

}
