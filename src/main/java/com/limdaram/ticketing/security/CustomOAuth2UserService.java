package com.limdaram.ticketing.security;

import com.limdaram.ticketing.domain.customer.CustomerDto;
import com.limdaram.ticketing.mapper.customer.CustomerMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.client.registration.ClientRegistration;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import java.util.*;


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
        log.info("userRequest.....");
        log.info(userRequest);

        log.info("oauth2 user.............................");

        ClientRegistration clientRegistration = userRequest.getClientRegistration();
        String clientName = clientRegistration.getClientName();

        log.info("NAME : " + clientName);

        OAuth2User oAuth2User = super.loadUser(userRequest);
        Map<String, Object> paramMap = oAuth2User.getAttributes();

        String email = null;

        String name = null;


        switch (clientName) {
            case "kakao":
                email = getKakaoEmail(paramMap);
                name = getKakaoNickname(paramMap);
                break;

            case "Google":
                email = getGoogleEmail(paramMap);
                name = getGoogleName(paramMap);
                break;

            case "Naver":
                email = getNaverEmail(paramMap);
                name = getNaverName(paramMap);
                break;
        }
        log.info("=========================");
        log.info(email);
        log.info("=========================");

        return generateDTO(email, name, paramMap);
    }

    private MemberSecurityDTO generateDTO(String email, String name, Map<String, Object> params) {
        // 소셜로그인으로 받아온 이메일로 중복 체크 with 우리 DB
        CustomerDto result = customerMapper.getByCustomerId(email);

        if (result == null) {
            CustomerDto customerDto = new CustomerDto();

            customerDto.setCustomerName(name);
            customerDto.setCustomerEmail(email);
            customerDto.setCustomerPassword(passwordEncoder.encode("1111"));
            customerDto.setSocial("true");
            customerDto.setCustomerId(email);
            customerDto.setAuth(List.of("user"));

            customerMapper.insert(customerDto);
            customerMapper.authAdd(email);

            List<SimpleGrantedAuthority> authorityList = new ArrayList<>();

            if (customerDto.getAuth() != null) {
                for (String auth : customerDto.getAuth()) {
                    authorityList.add(new SimpleGrantedAuthority(auth));
                }
            }

            MemberSecurityDTO memberSecurityDTO =
                    new MemberSecurityDTO(email, "1111", email, "true", name, authorityList);
            memberSecurityDTO.setProps(params);

            return memberSecurityDTO;

        } else {
            CustomerDto customerDto = result;

            List<SimpleGrantedAuthority> authorityList = new ArrayList<>();

            if (customerDto.getAuth() != null) {
                for (String auth : customerDto.getAuth()) {
                    authorityList.add(new SimpleGrantedAuthority(auth));
                }
            }
            MemberSecurityDTO memberSecurityDTO =
                    new MemberSecurityDTO(
                            customerDto.getCustomerId(),
                            customerDto.getCustomerPassword(),
                            customerDto.getCustomerEmail(),
                            customerDto.getSocial(),
                            customerDto.getCustomerName(),
                            authorityList
                    );

            return memberSecurityDTO;
        }
    }

    // 카카오 이메일 추출
    private String getKakaoEmail(Map<String, Object> paramMap) {


        Object value = paramMap.get("kakao_account");


        LinkedHashMap accountMap = (LinkedHashMap) value;

        String email = (String) accountMap.get("email");


        return email;
    }

    private String getKakaoNickname(Map<String, Object> paramMap) {


        Object value = paramMap.get("kakao_account");

        LinkedHashMap accountMap = (LinkedHashMap) value;


        Object nickname = accountMap.get("profile");

        LinkedHashMap nickname1 = (LinkedHashMap) nickname;



        String name = (String) nickname1.get("nickname");


        return name;
    }

    // 구글 이메일 추출
    private String getGoogleEmail(Map<String, Object> paramMap) {
        String email = (String) paramMap.get("email");

        return email;
    }

    private String getGoogleName(Map<String, Object> paramMap) {
        String name = (String) paramMap.get("name");

        return name;
    }

    // 네이버 이메일 추출
    private String getNaverEmail(Map<String, Object> paramMap) {


        Object value = paramMap.get("response");


        LinkedHashMap accountMap = (LinkedHashMap) value;

        String email = (String) accountMap.get("email");


        return email;
    }

    // 네이버 이름 

    private String getNaverName(Map<String, Object> paramMap) {


        Object value = paramMap.get("response");


        LinkedHashMap accountMap = (LinkedHashMap) value;

        String name = (String) accountMap.get("name");


        return name;
    }

}


