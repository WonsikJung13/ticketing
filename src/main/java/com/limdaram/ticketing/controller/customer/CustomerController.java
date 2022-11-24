package com.limdaram.ticketing.controller.customer;

import com.limdaram.ticketing.domain.customer.CustomerDto;
import com.limdaram.ticketing.service.customer.CustomerService;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("customer")
public class CustomerController {

    @Setter(onMethod_ = @Autowired)
    private CustomerService customerService;

    @RequestMapping("get")
    public void method(@RequestParam(name = "customerUniqueNumber", defaultValue = "1") int customerUniqueNumber, Model model) {
        String customer = customerService.getCustomer(customerUniqueNumber);
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



}
