package com.codeup.adlister.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class Email {
    public static final Pattern VALID_EMAIL_ADDRESS_REGEX =
            Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE);

    public static boolean validate(String emailStr) {
        Matcher matcher = VALID_EMAIL_ADDRESS_REGEX.matcher(emailStr);
        return matcher.find();
    }

    public static void main(String[] args) {
        String email = "john123@gmail.com";
        System.out.println("The E-mail ID is: " + email);
        System.out.println("Is the above E-mail ID valid? " + validate(email));
    }

}


