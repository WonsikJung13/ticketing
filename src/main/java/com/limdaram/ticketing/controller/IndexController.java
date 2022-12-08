package com.limdaram.ticketing.controller;

import com.limdaram.ticketing.domain.content.ContentDto;
import com.limdaram.ticketing.service.content.ContentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class IndexController {

    @Autowired
    private ContentService service;

    @RequestMapping("")
    public String list(Model model) {
        List<ContentDto> content = service.selectContent();
        model.addAttribute("contentlist", content);
        return "index";
    }

}
