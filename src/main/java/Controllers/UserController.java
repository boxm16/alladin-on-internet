/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import DBTools.AddressDao;
import DBTools.UserDao;
import Models.User;
import Service.Mail;
import Service.TokenFactory;
import Validation.RegistrationValidator;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Michail Sitmalidis
 */
@Controller
public class UserController {

    @Autowired
    private UserDao userDao;

    @Autowired
    private AddressDao addressDao;

    @Autowired
    private RegistrationValidator userValidator;

    @Autowired
    private Mail mail;

    @RequestMapping(value = "/data", method = RequestMethod.GET)

    public String data() {

        return "data";
    }

    @RequestMapping(value = "/map3", method = RequestMethod.GET)

    public String map23() {

        return "map3";
    }

}
