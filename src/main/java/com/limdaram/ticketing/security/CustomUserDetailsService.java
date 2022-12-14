package com.limdaram.ticketing.security;

import com.limdaram.ticketing.domain.customer.CustomerDto;
import com.limdaram.ticketing.mapper.customer.CustomerMapper;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Log4j2
@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private CustomerMapper customerMapper;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        CustomerDto customerDto = customerMapper.getByCustomerId(username);

        if (customerDto == null) {
            return null;
        }

        if (customerDto.getSocial().equals("true")) {
            return null;
        }

        List<SimpleGrantedAuthority> authorityList = new ArrayList<>();

        if (customerDto.getAuth() != null) {
            for (String auth : customerDto.getAuth()) {
                authorityList.add(new SimpleGrantedAuthority(auth));
            }
        }

        User user = new User(customerDto.getCustomerId(), customerDto.getCustomerPassword(), authorityList);
        return user;
    }
}
