package com.shop.test;

import com.shop.mapper.CommentMapper;
import com.shop.po.Comment;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author JokerQ
 * @date 2020/4/3 - 23:24
 */
public class CommentTest {
    private ApplicationContext applicationContext;
    @Autowired
    private CommentMapper commentMapper;
    @Before
    public void before() {
        applicationContext = new ClassPathXmlApplicationContext(
                "classpath:spring/applicationContext-dao.xml");
        commentMapper = applicationContext.getBean(CommentMapper.class);
    }
    @Test
    public void test(){
        Comment comment = commentMapper.queryById(1);
        System.out.println(comment);
    }
    @Test
    public void t1(){
        Comment comment = new Comment();
//        comment.setId(Integer.parseInt("2"));
        comment.setPid(57);
        comment.setUid(14);
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        comment.setSavetime(sdf.format(date));
        comment.setReplycontent("qwe");
        System.out.println(comment);
        int i = commentMapper.insert(comment);

    }
    @Test
    public void t2(){
        Comment comment = new Comment();
        List<Comment> comments = commentMapper.queryAll(comment);
        for (Comment c: comments
             ) {
            System.out.println(c.getReplycontent());
        }
    }
}
