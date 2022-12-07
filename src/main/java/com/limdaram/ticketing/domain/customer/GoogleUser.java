package com.limdaram.ticketing.domain.customer;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class GoogleUser {
    private String name;
    private String email;

    @Builder
    public GoogleUser(String name, String email) {
        this.name = name;
        this.email = email;
    }
}
