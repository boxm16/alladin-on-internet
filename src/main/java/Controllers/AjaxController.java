/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import DBTools.AddressDao;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Michail Sitmalidis
 */
@RestController
public class AjaxController {

    @Autowired
    private AddressDao addressDao;

    @RequestMapping(value = "/getPostalCodes.htm", method = RequestMethod.GET, headers = "Accept=*/*", produces = "application/json")
    public @ResponseBody
    String findAvaliablePlayersForThisGame(@RequestParam(value = "district") String district) throws JsonProcessingException {

        List<String> postalCodes = addressDao.getPostalCodes(district);
        System.out.println(district);
        ObjectMapper mapper = new ObjectMapper();
        return mapper.writeValueAsString(postalCodes);

    }
}
