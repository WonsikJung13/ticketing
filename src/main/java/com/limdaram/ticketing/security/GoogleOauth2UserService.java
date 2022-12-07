package com.limdaram.ticketing.security;

import com.limdaram.ticketing.config.OAuthAttributes;
import com.limdaram.ticketing.config.SessionUser;
import com.limdaram.ticketing.domain.customer.CustomerDto;
import com.limdaram.ticketing.domain.customer.GoogleUser;
import com.limdaram.ticketing.mapper.customer.CustomerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserService;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.security.oauth2.core.user.OAuth2User;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

public class GoogleOauth2UserService implements OAuth2UserService<OAuth2UserRequest, OAuth2User> {

    @Autowired
    private CustomerMapper customerMapper;

    @Autowired
    private HttpSession httpSession;

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        OAuth2UserService<OAuth2UserRequest, OAuth2User> delegate = new DefaultOAuth2UserService();
        OAuth2User oAuth2User = delegate.loadUser(userRequest);
        // 현재 로그인 진행 중인 서비스를 구분하는 코드
        String registrationId = userRequest
                .getClientRegistration()
                .getRegistrationId();
        // oauth2 로그인 진행 시 키가 되는 필드값
        String userNameAttributeName = userRequest.getClientRegistration()
                .getProviderDetails()
                .getUserInfoEndpoint()
                .getUserNameAttributeName();
        // OAuthAttributes: attribute를 담을 클래스 (개발자가 생성)
        OAuthAttributes attributes = OAuthAttributes
                .of(registrationId, userNameAttributeName, oAuth2User.getAttributes());
        GoogleUser user = saveOrUpdate(attributes);
        // SessioUser: 세션에 사용자 정보를 저장하기 위한 DTO 클래스 (개발자가 생성)
        httpSession.setAttribute("user", new SessionUser(user));
        List<SimpleGrantedAuthority> authorityList = new ArrayList<>();

        CustomerDto customerDto = customerMapper.getByCustomerId(user.getName());

        if (customerDto.getAuth() != null) {
            for (String auth : customerDto.getAuth()) {
                authorityList.add(new SimpleGrantedAuthority(auth));
            }
        }
        return new DefaultOAuth2User(
                authorityList,
                attributes.getAttributes(),
                attributes.getNameAttributeKey()
        );
    }
    private GoogleUser saveOrUpdate(OAuthAttributes attributes) {
        GoogleUser user;
        if(customerMapper.getByCustomerEmail(attributes.getEmail())!=null){
            CustomerDto customerDto = new CustomerDto();
            customerDto.setCustomerEmail(attributes.getEmail());
        }
        return null;
    }
}
