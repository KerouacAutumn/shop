package com.shop.serviceImpl;

import com.shop.Utils.PageBean;
import com.shop.mapper.CommentMapper;
import com.shop.po.Comment;
import com.shop.po.Message;
import com.shop.service.CommentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (Comment)表服务实现类
 *
 * @author makejava
 * @since 2020-04-03 01:09:01
 */
@Service("commentService")
public class CommentServiceImpl implements CommentService {
    @Resource
    private CommentMapper commentDao;

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public Comment queryById(Integer id) {
        return this.commentDao.queryById(id);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public PageBean<Comment> queryAllByLimit(int offset, int limit) {
        return this.commentDao.queryAllByLimit(offset, limit);
    }

    @Override
    public List<Comment> queryAll(Comment comment) {

        return commentDao.queryAll(comment);
    }

   /* @Override
    public List<Comment> queryAll(int pid) {
        return commentDao.queryAll(pid);
    }*/

    /**
     * 新增数据
     *
     * @param comment 实例对象
     * @return 实例对象
     */
    @Override
    public Comment insert(Comment comment) {
        this.commentDao.insert(comment);
        return comment;
    }

    /**
     * 修改数据
     *
     * @param comment 实例对象
     * @return 实例对象
     */
    @Override
    public Comment update(Comment comment) {
        this.commentDao.update(comment);
        return this.queryById(comment.getId());
    }

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer id) {
        return this.commentDao.deleteById(id) > 0;
    }

    @Override
    public PageBean<Comment> findAllCommentByPage(int page,int pid) throws Exception {
        PageBean<Comment> pageBean = new PageBean<>();
//		设置这是第几页
        pageBean.setPage(page);
//		设置10个
        int limitPage =4;
        pageBean.setLimitPage(limitPage);
//		设置一共多少页
        int totlePage = 0;
//		查询一共有多少页
        totlePage = commentDao.countAllComment();
        if(Math.ceil(totlePage % limitPage)==0){
            totlePage=totlePage / limitPage;
        }else{
            totlePage=totlePage / limitPage+1;
        }
        pageBean.setTotlePage(totlePage);
        int beginPage= (page-1)*limitPage;
        //商品集合
        List<Comment> list = commentDao.findAllCommentByPage(beginPage, limitPage,pid) ;
        pageBean.setList(list);
        return pageBean;
    }
}