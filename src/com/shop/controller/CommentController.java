package com.shop.controller;

import com.shop.Utils.PageBean;
import com.shop.po.Comment;
import com.shop.po.Message;
import com.shop.po.Product;
import com.shop.po.User;
import com.shop.service.CommentService;
import com.shop.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * (Comment)表控制层
 *
 * @author makejava
 * @since 2020-04-03 01:09:01
 */
@Controller
public class CommentController {
    /**
     * 服务对象
     */
    @Resource
    private CommentService commentService;

    @Resource
    private ProductService productService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @RequestMapping("selectOne")
    public Comment selectOne(Integer id) {
        return this.commentService.queryById(id);
    }

//    @RequestMapping(value = "/commentList")
//    public String commenglist(@RequestParam int page, Model model,
//                              HttpServletRequest request) throws Exception {
//        System.out.println(page);
//        PageBean<Comment> pageBean = commentService.findAllCommentByPage(page);
//        model.addAttribute("pageBean", pageBean);
//        return "product";
//    }

    @RequestMapping("/saveComment")
    public String saveMessage(@RequestParam String commentinfo,HttpServletRequest request,Model model) throws Exception {
        Comment comment = new Comment();

        User loginUser = (User) request.getSession().getAttribute("loginUser");

        if(loginUser==null){
            model.addAttribute("message", "对不起您还没有登录");
            return "msg";
        }
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        comment.setPid(57);
        comment.setReplycontent(commentinfo);
        comment.setUid(loginUser.getUid());
        comment.setSavetime(sdf.format(new Date()));

        Comment insert = commentService.insert(comment);
        System.out.println(insert);
        request.getSession().setAttribute("Comment", comment);
//        return "saveComment";
        return "redirect:/productFindByPid.action?page=1&pid=57";
    }
}