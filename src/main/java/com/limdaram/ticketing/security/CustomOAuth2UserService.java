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
        String name = null;

        switch (clientName) {
            case "kakao" :
                email = getKakaoEmail(paramMap);
                break;
            case "Google" :
                email = getGoogleEmail(paramMap);
                break;
            case "Naver" :
                email = getNaverEmail(paramMap);
                name = getNaverName(paramMap);
                break;
        }

        log.info("====================");
        log.info(email);
        log.info(name);
        log.info(oAuth2User.getName());
        log.info("====================");

        if (clientName.equals("kakao")  && customerMapper.getByCustomerId(oAuth2User.getName()) == null) {
            CustomerDto customerDto = new CustomerDto();

            customerDto.setCustomerEmail(email);
            customerDto.setCustomerPassword(passwordEncoder.encode("1111"));
            customerDto.setSocial("true");
            customerDto.setCustomerId(oAuth2User.getName());

            customerMapper.insert(customerDto);

        }
        if (clientName.equals("Google")  && customerMapper.getByCustomerId(oAuth2User.getName()) == null) {
            CustomerDto customerDto = new CustomerDto();

            customerDto.setCustomerEmail(email);
            customerDto.setCustomerPassword(passwordEncoder.encode("1111"));
            customerDto.setSocial("true");
            customerDto.setCustomerId(oAuth2User.getName());

            customerMapper.insert(customerDto);
        }
        if (clientName.equals("Naver") && customerMapper.getByCustomerId(getNaverId(paramMap)) == null) {
            CustomerDto customerDto = new CustomerDto();

            customerDto.setCustomerEmail(email);
            customerDto.setCustomerPassword(passwordEncoder.encode("1111"));
            customerDto.setSocial("true");
            customerDto.setCustomerId(getNaverId(paramMap));
            customerDto.setCustomerName(name);

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

    private String getGoogleEmail(Map<String, Object> paramMap) {

        String email = (String) paramMap.get("email");

        return email;
    }

    private String getNaverEmail(Map<String, Object> paramMap) {
        Object value = paramMap.get("response");
        LinkedHashMap responseMap = (LinkedHashMap) value;
        String email = (String) responseMap.get("email");

        return email;
    }

    private String getNaverName(Map<String, Object> paramMap) {
        Object value = paramMap.get("response");
        LinkedHashMap responseMap = (LinkedHashMap) value;
        String name = (String) responseMap.get("name");

        return name;
    }

    private String getNaverId(Map<String, Object> paramMap) {
        Object value = paramMap.get("response");
        LinkedHashMap responseMap = (LinkedHashMap) value;
        String id = (String) responseMap.get("id");

        return id;
    }

}
