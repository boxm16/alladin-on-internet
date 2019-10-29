/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBTools;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Michail Sitmalidis
 */
@Repository
public class AddressDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public ArrayList<String> getDistricts() {
        String sql = "SELECT district FROM post_box GROUP BY district ORDER BY district ASC;";
        ArrayList<String> districts;
      
        return districts = (ArrayList<String>) jdbcTemplate.queryForList(sql, String.class);

    }

    public List<String> getPostalCodes(String district) {

        String sql = "SELECT postal_code FROM post_box WHERE district='" + district + "' GROUP BY postal_code ORDER BY postal_code ASC;";

        return jdbcTemplate.queryForList(sql, String.class);
    }

    public List<String> getPostalCodes(int postalCode) {
        String sql = "SELECT street FROM post_box WHERE postal_code=" + postalCode + " GROUP BY street ORDER BY street ASC;";

        return jdbcTemplate.queryForList(sql, String.class);
    }

}
