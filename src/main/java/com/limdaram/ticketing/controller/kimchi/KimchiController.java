package com.limdaram.ticketing.controller.kimchi;

import com.limdaram.ticketing.domain.content.ContentDto;
import com.limdaram.ticketing.domain.kimchi.KimchiDto;
import com.limdaram.ticketing.domain.reply.ReplyDto;
import com.limdaram.ticketing.service.kimchi.KimchiService;
import com.limdaram.ticketing.service.reply.ReplyService;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("kimchi")
public class KimchiController {

    @Setter(onMethod_ = @Autowired)
    private KimchiService kimchiService;

    @Setter(onMethod_ = @Autowired)
    private ReplyService replyService;

    @RequestMapping("list")
    public void list(Model model) {
        List<KimchiDto> kimchi = kimchiService.selectContent();
        model.addAttribute("kimchi", kimchi);
    }

    @GetMapping("get")
    public void get(int contentId, Model model) {
//        List<KimchiDto> kimchi = kimchiService.getDetailName(contentId);
        KimchiDto kimchi = kimchiService.get(contentId);
        List<ReplyDto> reply = replyService.getContentId(contentId);
        model.addAttribute("kimchi", kimchi);
        model.addAttribute("replyy", reply);
    }

    @GetMapping("modify")
//    @PreAuthorize("authentication.name == 'admin'")
    public void modify(
            int contentId,
            Model model) {

        KimchiDto kimchi = kimchiService.get(contentId);
        model.addAttribute("kimchi", kimchi);
    }

    //    수정
    @PostMapping("modify")
//    @PreAuthorize("authentication.name == 'admin'")
    public String modify(
            KimchiDto kimchi,
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

        int cnt = kimchiService.update(kimchi, addPosterFile, addDetailFiles, removePosterName, removeDetailNames);
        System.out.println("수정완료 " + kimchi);

        if (cnt == 1) {
            rttr.addFlashAttribute("message", "상품 수정 완료");
        } else {
            rttr.addFlashAttribute("message", "상품 수정 실패");
        }

        return "redirect:/kimchi/list";
    }
}
