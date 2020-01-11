/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import DBTools.UserDao;
import Models.User;
import Service.Mail;
import Service.TokenFactory;
import Validation.LoginValidator;
import Validation.RegistrationValidator;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
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
public class AccountController {

    @Autowired
    private UserDao userDao;

    @Autowired
    private RegistrationValidator registrationValidator;

    @Autowired
    private Mail mail;

    @Autowired
    private TokenFactory tokenFactory;

    @Autowired
    private LoginValidator loginValidator;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String login(ModelMap model) {
        User user = new User();
        model.addAttribute(user);

        return "index";

    }

    @RequestMapping(value = "/registrationForm", method = RequestMethod.GET)
    public String registrationForm(ModelMap model) {
        User user = new User();
        model.addAttribute("user", user);
        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute User user, BindingResult bindingResult, ModelMap model, HttpSession session, HttpServletRequest request) {
        registrationValidator.validate(user, bindingResult);
        if (bindingResult.hasErrors()) {
            return "registration";
        } else {
            String token = tokenFactory.createToken();
            user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt()));
            userDao.registerUser(user, token);
            String URL_Path = request.getScheme()
                    + "://" + request.getServerName()
                    + ":" + request.getServerPort()
                    + "/confirmRegistration.htm?email=" + user.getEmail()
                    + "&token=" + token;

            mail.confirmationMail(URL_Path, user.getEmail());
            String messageHead = "Congratulations, your registration was successful";
            String messageBody = "An e-mail has been sent to your e-mail address, with instruction on what you will need to do next.";
            model.addAttribute("messageHead", messageHead);
            model.addAttribute("messageBody", messageBody);
            return "message";
        }

    }

    @RequestMapping(value = "/confirmRegistration", method = RequestMethod.GET)
    public String confirmRegistration(@RequestParam("email") String email, @RequestParam("token") String token, ModelMap model) {

        if (userDao.registrationPending(email, token)) {
            userDao.confirmRegistration(email, token);
            return "data";
        } else {
            if (userDao.userExists(email)) {
                String messageHead = "OOPS, something went wrong";
                String messageBody = "It seems you have already confirmed your registration, try to log in.";
                model.addAttribute("messageHead", messageHead);
                model.addAttribute("messageBody", messageBody);
            } else {
                String messageHead = "OOPS, something went wrong";
                String messageBody = "Something went wrong with your registration, please try again.";
                model.addAttribute("messageHead", messageHead);
                model.addAttribute("messageBody", messageBody);
            }
            return "message";
        }

    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(HttpSession session, @ModelAttribute User user, ModelMap model, BindingResult bindingResult) {

        loginValidator.validate(user, bindingResult);

        if (bindingResult.hasErrors()) {
            return "index";
        } else {
            session.setAttribute("user", user);
            user.setPassword("");
            return "mainPage";

        }

    }
}