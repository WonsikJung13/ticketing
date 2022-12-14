package com.limdaram.ticketing.controller.admin;

import com.limdaram.ticketing.domain.admin.GradeDto;
import com.limdaram.ticketing.domain.customer.CustomerDto;
import com.limdaram.ticketing.service.admin.AdminService;
import com.limdaram.ticketing.service.customer.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @Autowired
    private CustomerService customerService;

    @GetMapping("customerList")
    @PreAuthorize("authentication.name == 'admin'")
    public void getCustomerList(Model model) {
        List<CustomerDto> customerList = adminService.getCustomerList();

        model.addAttribute("customerList", customerList);

    }

    @RequestMapping("front")
    public void front(Model model) {
        int gradeCountForSilver = adminService.getGradeCountForSilver();
        int gradeCountForGold = adminService.getGradeCountForGold();
        model.addAttribute("gradeCountForSilver", gradeCountForSilver);
        model.addAttribute("gradeCountForGold", gradeCountForGold);
    }

    @RequestMapping("customerManage")
    @PreAuthorize("authentication.name == 'admin'")
    public void method(@RequestParam(name = "customerId", defaultValue = "0") String customerId, Model model) {
        List<GradeDto> gradeList = adminService.getGradeList();

        CustomerDto customer = customerService.getByCustomerId(customerId);

        model.addAttribute("customer", customer);
        model.addAttribute("gradeList", gradeList);

    }

    @PutMapping("updateGrade")
    @ResponseBody
    @PreAuthorize("authentication.name == 'admin'")
    public Map<String, Object> updateGrade(@RequestBody CustomerDto customer) {

        int updateGrade = adminService.updateGrade(customer.getCustomerId(), customer.getCustomerGrade());


        Map<String, Object> map = new HashMap<>();


        if (updateGrade == 1) {
            map.put("status", "success");
            map.put("message", "등급 반영이 완료되었습니다");
        } else {
            map.put("status", "fail");
            map.put("message", "등급 반영이 완료되지 않았습니다");
        }

        System.out.println(map);

        return map;
    }
}
