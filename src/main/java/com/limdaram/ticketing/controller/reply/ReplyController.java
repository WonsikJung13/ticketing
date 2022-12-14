package com.limdaram.ticketing.controller.reply;

import com.limdaram.ticketing.domain.reply.ReplyDto;
import com.limdaram.ticketing.service.reply.ReplyService;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;


@Controller
@RequestMapping("reply")
public class ReplyController {

    @Setter(onMethod_ = @Autowired)
    private ReplyService replyService;

    @GetMapping("list")
    @PreAuthorize("isAuthenticated()")
    public void list(Model model){
        List<ReplyDto> list = replyService.listReply();

        model.addAttribute("replyList", list);
    }

    @GetMapping("get")
    @PreAuthorize("isAuthenticated()")
    public void get(@RequestParam(name = "replyId") int replyId, Model model) {
        ReplyDto reply = replyService.get(replyId);
        model.addAttribute("Reply", reply);
    }

    @RequestMapping("register")
    @PreAuthorize("isAuthenticated()")
    public void register() {

    }

    @PostMapping("register")
    @PreAuthorize("isAuthenticated()")
    public String register(ReplyDto reply,
                           RedirectAttributes rttr) {
        int cnt = replyService.register(reply);
        if (cnt == 1) {
            rttr.addFlashAttribute("message", "새 게시물이 등록되었습니다.");
        } else {
            rttr.addFlashAttribute("message", "새 게시물이 등록되지 않았습니다.");
        }

        return "redirect:/reply/kkiimmcchhii";
    }

    @PostMapping("modify")
    @PreAuthorize("authentication.name == #replyDto.replyName")
    public String modify(ReplyDto replyDto, RedirectAttributes rttr) {

        int cnt = replyService.update(replyDto);

        if (cnt == 1) {
            rttr.addFlashAttribute("message", replyDto.getReplyId() + "번 게시물을 수정하였습니다.");
        } else {
            rttr.addFlashAttribute("message", replyDto.getReplyId() + "번 게시물을 수정하지 못했습니다.");
        }

        return "redirect:/reply/kkiimmcchhii";
    }

    @GetMapping("modify")
    @PreAuthorize("authentication.name == #replyName")
    public void modify(String replyName,int replyId, Model model) {
        ReplyDto replyDto = replyService.getDuo(replyName, replyId);

        model.addAttribute("Reply", replyDto);
    }

    @PostMapping("remove")
    public String remove(int replyId, RedirectAttributes rttr) {
        int cnt = replyService.remove(replyId);
        if (cnt == 1) {
            rttr.addFlashAttribute("message", replyId + "번 게시물이 삭제되었습니다.");
        } else {
            rttr.addFlashAttribute("message", replyId + "번 게시물이 삭제되지 않았습니다.");
        }
        return "redirect:/reply/kkiimmcchhii";
    }

    @RequestMapping("kkiimmcchhii")
    public void kkiimmcchhii(){

    }

    @RequestMapping("create")
    public void create(){

    }

    @RequestMapping("jusoPopup")
    public void jusoPopup() {

    }

}
