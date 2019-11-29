/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Validation;

import DBTools.UserDao;
import Models.User;
import org.springframework.beans.factory.annotation.Autowired;
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
        User user = (User) o;
        String email = user.getEmail().trim();
        if (!userDao.userExists(email)) {
            errors.rejectValue("email", "email.notExists");
        } else {
            if (!userDao.validPassword(user)) {
                errors.rejectValue("password", "password.wrongPassword");
            }
        }
    }

}
