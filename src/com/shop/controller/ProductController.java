package com.shop.controller;

import com.shop.Utils.PageBean;
import com.shop.po.Comment;
import com.shop.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.po.Product;
import com.shop.service.ProductService;

import javax.annotation.Resource;

@Controller
public class ProductController {
	@Autowired
	private ProductService prodcutService;
	@Resource
	private CommentService commentService;

	@RequestMapping("/productFindByPid")
	public String productFindByPid(@RequestParam int pid,Model model) throws Exception {
			Product product = prodcutService.productFindByPid(pid);
			model.addAttribute("product", product);
			PageBean<Comment> pageBean = commentService.findAllCommentByPage(1,pid);
			model.addAttribute("pageBean", pageBean);
			return "product";
	}
}
