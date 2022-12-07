package com.limdaram.ticketing.config;

import com.limdaram.ticketing.domain.customer.GoogleUser;
import lombok.Builder;
import lombok.Getter;

import java.util.Map;

@Getter
public class OAuthAttributes {

    private Map<String, Object> attributes;
    private String nameAttributeKey, name, email;

    @Builder
    public OAuthAttributes(Map<String, Object> attributes,
                           String nameAttributeKey,
                           String name,
                           String email) {
        this.attributes=attributes;
        this.nameAttributeKey=nameAttributeKey;
        this.name=name;
        this.email=email;
    }

    public static OAuthAttributes of (String registrationId,
                                      String userNameAttributeName,
                                      Map<String, Object> attributes) {
        return ofGoogle(userNameAttributeName, attributes);
    }

    public static OAuthAttributes ofGoogle(String userNameAttributeName,
                                           Map<String, Object> attributes) {
        return OAuthAttributes.builder()
                .name((String) attributes.get("name"))
                .email((String) attributes.get("email"))
                .nameAttributeKey(userNameAttributeName)
                .build();
    }

    public GoogleUser toEntity() {
        return GoogleUser.builder()
                .name(name)
                .email(email)
                .build();
    }
}
