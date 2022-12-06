package com.limdaram.ticketing.config;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

@Log4j2
@Configuration
@MapperScan(value = "com.limdaram.ticketing.mapper")
@EnableGlobalMethodSecurity(prePostEnabled = true)
@RequiredArgsConstructor
public class CustomSecurityConfig {

    private final AuthenticationFailureHandler customFailureHandler;

//    private final DataSource dataSource;
//    private final CustomUserDetailsService userDetailsService;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws  Exception {
        log.info("-----------configure----------");

        // 커스텀 로그인 페이지
        http.formLogin().loginPage("/member/login").failureHandler(customFailureHandler);

        // CSRF 토큰 비활성화
        http.csrf().disable();

        http.rememberMe();
//                .key("12345678")
//                .tokenRepository(persistentTokenRepository())
//                .userDetailsService(userDetailsService)
//                .tokenValiditySeconds(60*60*24*30);

        http.oauth2Login().loginPage("/member/login");

//        http.oauth2Login().

        return http.build();

    }

//    @Bean
//    public WebSecurityCustomizer webSecurityCustomizer() {
//        log.info("----------web configure-------------");
//
//        return (web) -> web.ignoring().requestMatchers(PathRequest.
//                toStaticResources().atCommonLocations());
//    }
//
//
//    @Bean
//    public PersistentTokenRepository persistentTokenRepository() {
//        JdbcTokenRepositoryImpl repo = new JdbcTokenRepositoryImpl();
//        repo.setDataSource(dataSource);
//        return repo;
//    }

}
