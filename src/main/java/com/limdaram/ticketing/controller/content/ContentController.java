package com.limdaram.ticketing.controller.content;

import com.limdaram.ticketing.domain.content.ContentDto;
import com.limdaram.ticketing.service.content.ContentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("content")
public class ContentController {

    @Autowired
    private ContentService service;

    @GetMapping("register")
    public void register() {

    }

    @PostMapping("register")
    public String register(ContentDto content) {
        System.out.println(content);

        service.register(content);

        return "redirect:/content/list";
    }

    @GetMapping("list")
    public void list(Model model) {
        List<ContentDto> list = service.listContent();

        model.addAttribute("contentList", list);
    }
}
