package com.limdaram.ticketing.controller.customer;

import com.limdaram.ticketing.domain.customer.CustomerDto;
import com.limdaram.ticketing.service.customer.CustomerService;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.HashMap;
import java.util.Map;


@Controller
@RequestMapping("customer")
public class CustomerController {

    @Setter(onMethod_ = @Autowired)
    private CustomerService customerService;

    @RequestMapping("get")
    @PreAuthorize("@customerSecurity.checkCustomerId(authentication.name, #customerId)")
    public void method(String customerId, Model model) {
        CustomerDto customer = customerService.getByCustomerId(customerId);
        System.out.println(customer);

        model.addAttribute("customer", customer);

    }

    @GetMapping("signup")
    public void signup() {

    }

    @PostMapping("signup")
    public String signup(CustomerDto customer, RedirectAttributes rttr) {
        customerService.insert(customer);

        rttr.addFlashAttribute("message", "회원가입이 완료되었습니다");
        return "redirect:/customer/signup";
    }

    @GetMapping({ "modify"})
    @PreAuthorize("@customerSecurity.checkCustomerId(authentication.name, #customerId)")
    public void customer(String customerId, Model model) {
        model.addAttribute("customer", customerService.getByCustomerId(customerId));
    }

    @PostMapping("remove")
    @PreAuthorize("@customerSecurity.checkCustomerId(authentication.name, #customer.customerId)")
    public String remove(CustomerDto customer, String oldPassword, RedirectAttributes rttr) {

        CustomerDto oldCustomer = customerService.getByCustomerId(customer.getCustomerId());

        if (oldCustomer.getCustomerPassword().equals(oldPassword)) {
            int cnt = customerService.remove(customer);

            rttr.addFlashAttribute("message", "회원 탈퇴하였습니다.");

            return "redirect:/customer/get";

        } else {
            rttr.addAttribute("customerId", customer);
            rttr.addFlashAttribute("message", "암호가 일치하지 않습니다.");
            return "redirect:/customer/get";
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
            map.put("message", "사용 가능한 이메일입니다");
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

    @PostMapping("passwordModify")
    @PreAuthorize("@customerSecurity.checkCustomerId(authentication.name, #customerId)")
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
    @PreAuthorize("@customerSecurity.checkCustomerId(authentication.name, #customerId)")
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
    @PreAuthorize("@customerSecurity.checkCustomerId(authentication.name, #customerId)")
    public String addressModify(String customerId, String customerAddress, RedirectAttributes rttr) {
        int cnt = customerService.addressModify(customerId, customerAddress);
        String newAddress = customerService.getByCustomerId(customerId).getCustomerAddress();
        System.out.println(customerId);

        if (cnt == 1) {
            System.out.println(customerAddress);
            rttr.addFlashAttribute("message",  newAddress + " 주소로 수정되었습니다");
            return "redirect:/customer/modify?customerId=" + customerId;
        } else {
            System.out.println(customerAddress);
            rttr.addFlashAttribute("message", "주소가 수정되지 않았습니다");
            return "redirect:/customer/modify?customerId=" + customerId;
        }
    }
}
