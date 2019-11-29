/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Service;

import java.util.UUID;
import org.springframework.stereotype.Service;

/**
 *
 * @author Michail Sitmalidis
 */
@Service
public class TokenFactory {

    public static String createToken() {
        String token = UUID.randomUUID().toString();
        return token;
    }

}
