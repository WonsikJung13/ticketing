package com.limdaram.ticketing.config;

import com.limdaram.ticketing.domain.customer.GoogleUser;
import lombok.Getter;

import java.io.Serializable;

@Getter
public class SessionUser implements Serializable {
    private String name, email;

    public SessionUser(GoogleUser user) {
        this.name = user.getName();
        this.email = user.getEmail();
    }
}
