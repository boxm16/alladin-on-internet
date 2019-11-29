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
import Validation.UserValidator;
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
    private UserValidator userValidator;

    @Autowired
    private Mail mail;

    @RequestMapping(value = "/login", method = RequestMethod.POST)

    public String customerMainPage(HttpSession session) {
        User user = new User();
        session.setAttribute("user", user);
        return "customerMainPage";
    }

    @RequestMapping(value = "/map", method = RequestMethod.GET)

    public String map() {

        return "map";
    }

    @RequestMapping(value = "/map3", method = RequestMethod.GET)

    public String map23() {

        return "map3";
    }

   
}
