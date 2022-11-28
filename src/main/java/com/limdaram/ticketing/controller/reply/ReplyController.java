package com.limdaram.ticketing.controller.reply;

import com.limdaram.ticketing.domain.reply.ReplyDto;
import com.limdaram.ticketing.mapper.reply.ReplyMapper;
import com.limdaram.ticketing.service.reply.ReplyService;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("reply")
public class ReplyController {

    @Setter(onMethod_ = @Autowired)
    private ReplyService replyService;

    @Setter(onMethod_ = @Autowired)
    private ReplyMapper replyMapper;

    @GetMapping("list")
    public void list(Model model){
        List<ReplyDto> list = replyService.listReply();

        model.addAttribute("replyList", list);
    }

    @GetMapping("get")
    public void get(@RequestParam(name = "id") int id, Model model) {
        // request param
        // business logic (게시물 db에서 가져오기)
        ReplyDto reply = replyService.get(id);
        // add attribute
        model.addAttribute("Reply", reply);
        // forward / redirect
    }

    @PostMapping("add")
    @ResponseBody
    public Map<String, Object> add (@RequestBody ReplyDto reply) {
         System.out.println(reply);
        Map<String, Object> map = new HashMap<>();
        int cnt = replyService.addReply(reply);
        if (cnt == 1) {
            map.put("message", "새 댓글이 등록되었습니다.");
        } else {
            map.put("message", "새 댓글이 등록되지 않았습니다.");
        }
        return map;
    }

    @RequestMapping("test")
    public void test(){
        System.out.println("게시판");
    }

    @RequestMapping("register")
    public void register() {
        System.out.println("register");
    }

    @PostMapping("register")
    public String register(ReplyDto reply,
                           RedirectAttributes rttr) {
        // * 파일업로드
        // 1. web.xml
        //    dispatcherServlet 설정에 multipart-config 추가
        // 2. form 에 enctype="multipart/form-data" 속성 추가
        // 3. Controller의 메소드 argument type : MultipartFile

        // request param 수집/가공
//        System.out.println(files.length);
//        for (MultipartFile file : files) {
//            System.out.println(file.getOriginalFilename());
//        }
        // busines  logic
        // int cnt = service.register(board, files);
        int cnt = replyService.register(reply);
        if (cnt == 1) {
            rttr.addFlashAttribute("message", "새 게시물이 등록되었습니다.");
        } else {
            rttr.addFlashAttribute("message", "새 게시물이 등록되지 않았습니다.");
        }

        // /board/list로 redirect
        return "redirect:/reply/list";
    }

}
