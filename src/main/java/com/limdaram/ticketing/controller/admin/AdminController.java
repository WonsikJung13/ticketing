package com.limdaram.ticketing.controller.admin;

import com.limdaram.ticketing.domain.customer.CustomerDto;
import com.limdaram.ticketing.service.admin.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @GetMapping("customerList")
    public void getCustomerList(Model model) {
        List<CustomerDto> customerList = adminService.getCustomerList();
        List<CustomerDto> gradeList =  adminService.getGradeList();

        model.addAttribute("customerList", customerList);
        model.addAttribute("gradeList", gradeList);

    }

    @RequestMapping("front")
    public void front(Model model) {
        int gradeCountForSilver = adminService.getGradeCountForSilver();
        int gradeCountForGold = adminService.getGradeCountForGold();
        model.addAttribute("gradeCountForSilver", gradeCountForSilver);
        model.addAttribute("gradeCountForGold", gradeCountForGold);
    }
}
