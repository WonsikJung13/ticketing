package com.limdaram.ticketing.controller.content;

import com.limdaram.ticketing.domain.content.ContentDto;
import com.limdaram.ticketing.domain.customer.CustomerDto;
import com.limdaram.ticketing.domain.reply.ReplyDto;
import com.limdaram.ticketing.domain.reservation.reservationDto;
import com.limdaram.ticketing.service.content.ContentService;
import com.limdaram.ticketing.service.customer.CustomerService;
import com.limdaram.ticketing.service.reply.ReplyService;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("content")
public class ContentController {

    @Autowired
    private ContentService service;

    @Autowired
    private CustomerService customerService;

    @Setter(onMethod_ = @Autowired)
    private ReplyService replyService;

    @GetMapping("register")
    @PreAuthorize("authentication.name == 'admin'")
    public void register() {

    }

    @PostMapping("register")
    @PreAuthorize("authentication.name == 'admin'")
    public String register(
            ContentDto content,
            MultipartFile file1,
            MultipartFile[] file2,
            RedirectAttributes rttr) {

        int cnt = service.register(content, file1, file2);

        if (cnt == 1) {
            rttr.addFlashAttribute("message", "상품 등록 완료");
        } else {
            rttr.addFlashAttribute("message", "상품 등록 실패");
        }

        return "redirect:/content/list";
    }

    @GetMapping("list")
    public void list(Model model, ContentDto content) {
        List<ContentDto> list = service.listContent(content);

        model.addAttribute("contentList", list);
    }

    @GetMapping("get")
    @PreAuthorize("isAuthenticated()")
    public void get(int contentId,
                    Model model) {
        ContentDto content = service.get(contentId);
        List<ReplyDto> reply = replyService.getContentId(contentId);

        model.addAttribute("content", content);
        model.addAttribute("replyy", reply);
    }

    @GetMapping("modify")
    @PreAuthorize("authentication.name == 'admin'")
    public void modify(
            int contentId,
            Model model) {

        ContentDto content = service.get(contentId);
        model.addAttribute("content", content);
    }

//    수정
    @PostMapping("modify")
    @PreAuthorize("authentication.name == 'admin'")
    public String modify(
            ContentDto content,
            MultipartFile addPosterFile,
            MultipartFile[] addDetailFiles,
            @RequestParam(name = "removePosterName", required = false) String removePosterName,
            @RequestParam(name = "removeDetailNames", required = false) List<String> removeDetailNames,
            RedirectAttributes rttr) {

        int cnt = service.update(content, addPosterFile, addDetailFiles, removePosterName, removeDetailNames);

        if (cnt == 1) {
            rttr.addFlashAttribute("message", "상품 수정 완료");
        } else {
            rttr.addFlashAttribute("message", "상품 수정 실패");
        }

        return "redirect:/content/list";
    }


    @PostMapping("remove")
    @PreAuthorize("authentication.name == 'admin'")
    public String remove(int contentId, RedirectAttributes rttr) {
        int cnt = service.remove(contentId);

        if (cnt == 1) {
            rttr.addFlashAttribute("message", "상품 삭제 완료");
        } else {
            rttr.addFlashAttribute("message", "상품 삭제 실패");
        }

        return "redirect:/content/list";
    }

    @GetMapping("reservation")
    @PreAuthorize("authentication.name == 'admin'")
    public void reservation(int contentId, Model model, Authentication authentication){
        CustomerDto customerDto = customerService.getByCustomerId(authentication.getName());
        ContentDto content = service.get(contentId);
        model.addAttribute("content", content);
        model.addAttribute("customer", customerDto);

    }

    @PostMapping("reservation")
    @PreAuthorize("authentication.name == 'admin'")
    public String reservation(reservationDto reservDto) {
        System.out.println("Controller DTO: " + reservDto);
        service.reservation(reservDto);

        return "redirect:/content/list";

    }

    @RequestMapping("jusoPopup")
    public void jusoPopup() {

    }

    @GetMapping("indexRegister")
    @PreAuthorize("authentication.name == 'admin'")
    public void indexRegister() {

    }
    @PostMapping("indexRegister")
    @PreAuthorize("authentication.name == 'admin'")
    public String indexRegister(
            ContentDto content,
            MultipartFile file1,
            MultipartFile[] file2,
            RedirectAttributes rttr) {

        int cnt = service.register(content, file1, file2);

        if (cnt == 1) {
            rttr.addFlashAttribute("message", "상품 등록 완료");
        } else {
            rttr.addFlashAttribute("message", "상품 등록 실패");
        }

        return "redirect:/content/list";
    }

    //    삭제
    @GetMapping("indexModify")
    @PreAuthorize("authentication.name == 'admin'")
    public void indexModify(
            int contentId,
            Model model) {

        ContentDto content = service.get(contentId);
        model.addAttribute("content", content);
    }

    //    수정
    @PostMapping("indexModify")
    @PreAuthorize("authentication.name == 'admin'")
    public String indexModify(
            ContentDto content,
            MultipartFile addPosterFile,
            MultipartFile[] addDetailFiles,
            @RequestParam(name = "removePosterFile", required = false) String removePosterFile,
            @RequestParam(name = "removeDetailFiles", required = false) List<String> removeDetailFiles,
            RedirectAttributes rttr) {
        int cnt = service.update(content, addPosterFile, addDetailFiles, removePosterFile, removeDetailFiles);

        if (cnt == 1) {
            rttr.addFlashAttribute("message", "상품 수정 완료");
        } else {
            rttr.addFlashAttribute("message", "상품 수정 실패");
        }

        return "redirect:/";
    }
    @GetMapping("indexGet")
    public void indexGet(int contentId, Model model) {
        ContentDto content = service.get(contentId);
        model.addAttribute("content", content);


    }
}
