package com.limdaram.ticketing.controller.content;

import com.limdaram.ticketing.domain.content.ContentDto;
import com.limdaram.ticketing.domain.customer.CustomerDto;
import com.limdaram.ticketing.service.content.ContentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("content")
public class ContentController {

    @Autowired
    private ContentService service;

    @GetMapping("register")
    public void register() {

    }
    @Transactional
    @PostMapping("register")
    public String register(
            ContentDto content,
            MultipartFile file1,
            MultipartFile[] file2,
            RedirectAttributes rttr) {
//            @RequestParam(name = "removePosterName", required = false) String removePosterName,
//            @RequestParam(name = "removeDetailNames", required = false) List<String> removeDetailNames,
        System.out.println("등록" + content);
        System.out.println(content.getContentId());

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
        System.out.println("리스트"+list);
        System.out.println("content"+content);
        model.addAttribute("contentList", list);
    }

    @GetMapping("get")
    public void get(int contentId,
                    Model model) {
        ContentDto content = service.get(contentId);
        System.out.println("조회창 " + content);
        model.addAttribute("content", content);

    }

    @GetMapping("indexGet")
    public void indexGet(int contentId, Model model) {
        ContentDto content = service.get(contentId);
        model.addAttribute("content", content);
        System.out.println(content);

    }

    @GetMapping("modify")
    public void modify(
            int contentId,
            Model model) {

        ContentDto content = service.get(contentId);
        System.out.println("수정창 " + contentId);
        model.addAttribute("content", content);
    }

//    수정
    @PostMapping("modify")
    public String modify(
            ContentDto content,
            MultipartFile addPosterFile,
            MultipartFile[] addDetailFiles,
            @RequestParam(name = "removePosterName", required = false) String removePosterName,
            @RequestParam(name = "removeDetailNames", required = false) List<String> removeDetailNames,
            RedirectAttributes rttr) {

        // 지울 파일명 들어오는지 확인
        System.out.println("지울 파일명###");
        if (removePosterName != null) {
//            for(String name : removeDetailFiles) {
                System.out.println(removePosterName);
//            }
        }

        int cnt = service.update(content, addPosterFile, addDetailFiles, removePosterName, removeDetailNames);
        System.out.println("수정완료 " + content);

        if (cnt == 1) {
            rttr.addFlashAttribute("message", "상품 수정 완료");
        } else {
            rttr.addFlashAttribute("message", "상품 수정 실패");
        }

        return "redirect:/content/list";
    }

//    삭제
@GetMapping("indexModify")
public void indexModify(
        int contentId,
        Model model) {

    ContentDto content = service.get(contentId);
    model.addAttribute("content", content);
}

    //    수정
    @PostMapping("indexModify")
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

    @PostMapping("remove")
    public String remove(int contentId, RedirectAttributes rttr) {
        int cnt = service.remove(contentId);
        System.out.println("삭제완료 " + contentId);

        if (cnt == 1) {
            rttr.addFlashAttribute("message", "상품 삭제 완료");
        } else {
            rttr.addFlashAttribute("message", "상품 삭제 실패");
        }

        return "redirect:/content/list";
    }

    @GetMapping("reservation")
    public void reservation(int contentId, Model model, CustomerDto customer){
        ContentDto content = service.reservation(contentId);
//        CustomerDto customer = service.reservInfo(customerUniqueNumber);
        System.out.println("reservation : " + content);
        model.addAttribute("content", content);
//        model.addAttribute("customer", customer);
    }

    @RequestMapping("jusoPopup")
    public void jusoPopup() {

    }

}
