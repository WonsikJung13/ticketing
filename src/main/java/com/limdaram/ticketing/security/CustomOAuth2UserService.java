package com.limdaram.ticketing.security;

import com.limdaram.ticketing.domain.customer.CustomerDto;
import com.limdaram.ticketing.mapper.customer.CustomerMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.client.registration.ClientRegistration;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import java.util.LinkedHashMap;
import java.util.Map;

@Log4j2
@Service
@RequiredArgsConstructor
public class CustomOAuth2UserService extends DefaultOAuth2UserService {

    @Autowired
    private CustomerMapper customerMapper;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        log.info("userRequest: ....");
        log.info(userRequest);

        log.info("oauth2 user ..................");

        ClientRegistration clientRegistration = userRequest.getClientRegistration();
        String clientName = clientRegistration.getClientName();

        log.info("NAME : " + clientName);

        OAuth2User oAuth2User = super.loadUser(userRequest);
        Map<String, Object> paramMap = oAuth2User.getAttributes();

        String email = null;
        String social = null;

        switch (clientName) {
            case "kakao" :
                email = getKakaoEmail(paramMap);
                break;
        }

        log.info("====================");
        log.info(email);
        log.info("====================");

        if (customerMapper.getByCustomerId(email) == null) {
            CustomerDto customerDto = new CustomerDto();

            customerDto.setCustomerEmail(email);
            customerDto.setCustomerPassword(passwordEncoder.encode("1111"));
            customerDto.setSocial("true");
            customerDto.setCustomerId(email);

            customerMapper.insert(customerDto);
        }

        return oAuth2User;

    }



    private String getKakaoEmail(Map<String, Object> paramMap) {
        log.info("KAKAO -------------------------");

        Object value = paramMap.get("kakao_account");

        log.info(value);

        LinkedHashMap accountMap = (LinkedHashMap) value;

        String email = (String) accountMap.get("email");

        log.info("email..." + email);

        return email;
    }
}
