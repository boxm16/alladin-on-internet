/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Validation;

import DBTools.UserDao;
import Models.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 *
 * @author boxm1
 */
@Component
public class LoginValidator implements Validator {

    @Autowired
    private UserDao userDao;

    @Override
    public boolean supports(Class<?> type) {
        return User.class.equals(type);
    }

    @Override
    public void validate(Object o, Errors errors) {
        User logingUser = (User) o;
        String emailIdentifier = logingUser.getEmailIdentifier().trim();
        //i will rewrite this all
        if (!userDao.userExists(emailIdentifier)) {
            errors.rejectValue("email", "email.notExists");
        } else {
            User registeredUser = userDao.getUser(emailIdentifier);
            if (!BCrypt.checkpw(logingUser.getPassword(), registeredUser.getPassword())) {
                errors.rejectValue("password", "password.wrongPassword");
            }
            if (!registeredUser.getStatus().equals("activated")) {
                errors.rejectValue("email", "email.notActivated");
            }
        }
    }

}
