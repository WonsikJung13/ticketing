package com.limdaram.ticketing.controller.customer;

import com.limdaram.ticketing.domain.customer.CustomerDto;
import com.limdaram.ticketing.service.customer.CustomerService;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
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
    public void method(@RequestParam(name = "customerUniqueNumber", defaultValue = "1") int customerUniqueNumber, Model model) {
        CustomerDto customer = customerService.getCustomer(customerUniqueNumber);
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
    public void customer(int customerUniqueNumber, Model model) {
        model.addAttribute("customer", customerService.getByCustomerUniqueNumber(customerUniqueNumber));
    }

//    @PostMapping("modify")
//    public String modify(CustomerDto customer, String oldPassword, RedirectAttributes rttr) {
//
//        CustomerDto oldCustomer = customerService.getByCustomerUniqueNumber(customer.getCustomerUniqueNumber());
//
//        rttr.addAttribute("customerUniqueNumber", customer.getCustomerUniqueNumber());
//        if (oldCustomer.getCustomerPassword().equals(oldPassword)) {
//            int cnt = customerService.modify(customer);
//
//            if (cnt == 1) {
//                rttr.addFlashAttribute("message", oldCustomer.getCustomerName() + "님의 정보가 수정되었습니다");
//                return "redirect:/customer/get";
//            } else {
//                rttr.addFlashAttribute("message", oldCustomer.getCustomerName() + "님의 정보가 수정되지 않았습니다");
//                return "redirect:/customer/modify";
//            }
//        } else {
//            rttr.addFlashAttribute("message", oldCustomer.getCustomerName() + "님의 정보가 수정되지 않았습니다.");
//            return "redirect:/customer/modify";
//        }
//    }

    @PostMapping("remove")
    public String remove(CustomerDto customer, String oldPassword, RedirectAttributes rttr) {

        CustomerDto oldCustomer = customerService.getByCustomerUniqueNumber(customer.getCustomerUniqueNumber());

        if (oldCustomer.getCustomerPassword().equals(oldPassword)) {
            int cnt = customerService.remove(customer);

            rttr.addFlashAttribute("message", "회원 탈퇴하였습니다.");

            return "redirect:/customer/get";

        } else {
            rttr.addAttribute("customerUniqueNumber", customer);
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
    public String passwordModify(int customerUniqueNumber, String customerPassword, RedirectAttributes rttr) {
        int cnt = customerService.passwordModify(customerUniqueNumber, customerPassword);

        if (cnt == 1) {
            rttr.addFlashAttribute("message",  "비밀번호가 수정되었습니다");
            return "redirect:/customer/modify?customerUniqueNumber=" + customerUniqueNumber;
        } else {
            rttr.addFlashAttribute("message", "비밀번호가 수정되지 않았습니다");
            return "redirect:/customer/modify?customerUniqueNumber=" + customerUniqueNumber;
        }
    }
}
