package com.limdaram.ticketing.config;

import com.limdaram.ticketing.security.GoogleOauth2UserService;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

public class GoogleSecurityConfig extends WebSecurityConfigurerAdapter {

    private final GoogleOauth2UserService googleOauth2UserService;

    public GoogleSecurityConfig(GoogleOauth2UserService googleOauth2UserService) {
        this.googleOauth2UserService = googleOauth2UserService;
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                //csrf 차단 해제
                .csrf().disable()
                .headers().frameOptions().disable()
                .and()
                .authorizeRequests()
                .antMatchers(
                        "/error",
                        "/favicon.ico",
                        "/**/*.png",
                        "/**/*.gif",
                        "/**/*.svg",
                        "/**/*.jpg",
                        "/**/*.html",
                        "/**/*.css",
                        "/**/*.js",
                        "/",
                        "/home/**",
                        "/test/**")
                                .permitAll()
                                .anyRequest().authenticated()
                                .and()
                                .logout().logoutSuccessUrl("/")
                                .and()
                                .oauth2Login().userInfoEndpoint().userService(googleOauth2UserService);
    }
}
