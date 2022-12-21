package com.limdaram.ticketing.controller.customer;

import com.limdaram.ticketing.domain.customer.CustomerDto;
import com.limdaram.ticketing.mapper.customer.CustomerMapper;
import com.limdaram.ticketing.service.customer.CustomerService;
import com.limdaram.ticketing.service.customer.EmailService;
import com.limdaram.ticketing.service.customer.EmailServiceImpl;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;


@Controller
@RequestMapping("customer")
public class CustomerController {

    @Setter(onMethod_ = @Autowired)
    private CustomerService customerService;

    @Setter(onMethod_ = @Autowired)
    private EmailService emailService;

    @Setter(onMethod_ = @Autowired)
    private CustomerMapper customerMapper;

    @Setter(onMethod_ = @Autowired)
    private EmailServiceImpl emailServiceImpl;

    @Setter(onMethod_ = @Autowired)
    private PasswordEncoder passwordEncoder;


    @RequestMapping("get")
    @PreAuthorize("authentication.name == #customerId")
    public void method(String customerId, Model model) {
        CustomerDto customer = customerService.getByCustomerId(customerId);

        model.addAttribute("customer", customer);
    }

    @GetMapping("signup")
    public void signup() {

    }

    @PostMapping("signup")
    public String signup(CustomerDto customer, RedirectAttributes rttr, String customerId) {
        customerService.insert(customer);

        customerMapper.authAdd(customerId);

        rttr.addFlashAttribute("message", "회원가입이 완료되었습니다");
        return "redirect:/member/login";
    }

    @GetMapping({ "modify"})
    @PreAuthorize("authentication.name == #customerId")
    public void customer(String customerId, Model model) {
        model.addAttribute("customer", customerService.getByCustomerId(customerId));
    }

    @PostMapping("remove")
    @PreAuthorize("authentication.name == #customer.customerId")
    public String remove(CustomerDto customer, String oldPassword, RedirectAttributes rttr, HttpServletRequest request) throws ServletException {

        CustomerDto oldCustomer = customerService.getByCustomerId(customer.getCustomerId());

        boolean passwordMatch = passwordEncoder.matches(oldPassword, oldCustomer.getCustomerPassword());

        if (passwordMatch) {
            customerService.remove(customer);
            request.logout();
//            rttr.addFlashAttribute("message", "회원 탈퇴하였습니다.");

            return "redirect:/";

        } else {
//            rttr.addAttribute("customerId", customer);
            rttr.addFlashAttribute("message", "암호가 일치하지 않습니다.");
            return "redirect:/customer/get?customerId=" + customer.getCustomerId();
        }
    }

    @GetMapping("checkId/{customerId}")
    @ResponseBody
    public Map<String, Object> checkId(@PathVariable String customerId) {
        Map<String, Object> map = new HashMap<>();

        CustomerDto customer = customerService.getByCustomerId(customerId);

        if (customer == null) {
            map.put("statusId", "not exist");
            map.put("message", "사용 가능한 아이디입니다");
        } else {
            map.put("statusId", "exist");
            map.put("message", "이미 존재하는 아이디입니다");
        }

        return map;
    }

    @GetMapping("checkEmail/{customerEmail}")
    @ResponseBody
    public Map<String, Object> checkEmail(@PathVariable String customerEmail) {
        Map<String, Object> map = new HashMap<>();
        CustomerDto customer = customerService.getByCustomerEmail(customerEmail);

        if (customer == null) {
            map.put("statusEmail", "not exist");
            map.put("message", "사용 가능한 이메일입니다. 이메일 인증해주세요.");
        } else {
            map.put("statusEmail", "exist");
            map.put("message", "이미 존재하는 이메일입니다");
        }
        return map;
    }

    @GetMapping("jusoPopup")
    public void jusoPopup1() {

    }

    @PostMapping("jusoPopup")
    public void jusoPopup2() {

    }

    @PostMapping("nameModify")
    @PreAuthorize("authentication.name == #customerId")
    public String nameModify(String customerId, String customerName, RedirectAttributes rttr) {
        int cnt = customerService.nameModify(customerId, customerName);

        if (cnt == 1) {
            rttr.addFlashAttribute("message",  "이름이 수정되었습니다");
            return "redirect:/customer/modify?customerId=" + customerId;
        } else {
            rttr.addFlashAttribute("message", "이름이 수정되지 않았습니다");
            return "redirect:/customer/modify?customerId=" + customerId;
        }
    }

    @PostMapping("birthModify")
    @PreAuthorize("authentication.name == #customerId")
    public String birthModify(String customerId, String customerBirth, RedirectAttributes rttr) {
//        System.out.println("고객생년월일 : " + customerBirth);
        int cnt = customerService.birthModify(customerId, customerBirth);

        if (cnt == 1) {
            rttr.addFlashAttribute("message",  "생년월일이 수정되었습니다");
            return "redirect:/customer/modify?customerId=" + customerId;
        } else {
            rttr.addFlashAttribute("message", "생년월일이 수정되지 않았습니다");
            return "redirect:/customer/modify?customerId=" + customerId;
        }
    }

    @PostMapping("passwordModify")
    @PreAuthorize("authentication.name == #customerId")
    public String passwordModify(String customerId, String customerPassword, RedirectAttributes rttr) {
        int cnt = customerService.passwordModify(customerId, customerPassword);

        if (cnt == 1) {
            rttr.addFlashAttribute("message",  "비밀번호가 수정되었습니다");
            return "redirect:/customer/modify?customerId=" + customerId;
        } else {
            rttr.addFlashAttribute("message", "비밀번호가 수정되지 않았습니다");
            return "redirect:/customer/modify?customerUId=" + customerId;
        }
    }

    @PostMapping("phoneNumberModify")
    @PreAuthorize("authentication.name == #customerId")
    public String phoneNumberModify(String customerId, String customerPhoneNumber, RedirectAttributes rttr) {
        int cnt = customerService.phoneNumberModify(customerId, customerPhoneNumber);

        if (cnt == 1) {
            rttr.addFlashAttribute("message",  "핸드폰 번호가 수정되었습니다");
            return "redirect:/customer/modify?customerId=" + customerId;
        } else {
            rttr.addFlashAttribute("message", "핸드폰 번호가 수정되지 않았습니다");
            return "redirect:/customer/modify?customerId=" + customerId;
        }
    }

    @PostMapping("addressModify")
    @PreAuthorize("authentication.name == #customerId")
    public String addressModify(String customerId, String customerAddress, RedirectAttributes rttr) {
        int cnt = customerService.addressModify(customerId, customerAddress);
        String newAddress = customerService.getByCustomerId(customerId).getCustomerAddress();
//        System.out.println(customerId);

        if (cnt == 1) {
//            System.out.println(customerAddress);
            rttr.addFlashAttribute("message",  "[" + newAddress + "]" + "</br>" + "주소로 수정되었습니다");
            return "redirect:/customer/modify?customerId=" + customerId;
        } else {
//            System.out.println(customerAddress);
            rttr.addFlashAttribute("message", "주소가 수정되지 않았습니다");
            return "redirect:/customer/modify?customerId=" + customerId;
        }
    }

    @PostMapping("emailConfirm")
    @ResponseBody
    public String emailConfirm(@RequestBody CustomerDto customerDto) throws Exception {

        return emailService.sendSimpleMessage(customerDto.getCustomerEmail());
    }

    @RequestMapping("verifyCode")
    @ResponseBody
    public int verifyCode(@RequestBody Map<String, Object> map) {
//        System.out.println("ePw : " + emailServiceImpl.ePw);


        int result = 0;
//        System.out.println("code : " + map.get("agreementEmailInput"));
//        System.out.println("code match : " + emailServiceImpl.ePw.equals(map.get("agreementEmailInput")));

        if(emailServiceImpl.ePw.equals(map.get("agreementEmailInput"))) {
            result = 1;
        }
        return result;
    }
}
