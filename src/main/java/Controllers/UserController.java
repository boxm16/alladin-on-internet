/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import DBTools.UserDao;
import Models.User;
import Validation.UserValidator;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Michail Sitmalidis
 */
@Controller
public class UserController {

    @Autowired
    private UserDao userDao;

    @Autowired
    private UserValidator userValidator;

    @RequestMapping(value = "/go", method = RequestMethod.GET)

    public String saveCustomerRating() {
        userDao.insert();
        return "register";
    }

    @RequestMapping(value = "/goToRegisterForm", method = RequestMethod.GET)
    public String registerUser(ModelMap model) {
        User user = new User();
        model.addAttribute("user", user);
        return "register";
    }

    @RequestMapping(value = "/registerFormHandling", method = RequestMethod.POST)
    public String registerFormHandling(@ModelAttribute User user, BindingResult bindingResult, ModelMap model, HttpSession session) {
        userValidator.validate(user, bindingResult);
        if (bindingResult.hasErrors()) {
            return "register";
        } else {

            userDao.registerUser(user);
            model.addAttribute("user", user);
            session.setAttribute("user", user);
            return "userData";
        }
    }
}
