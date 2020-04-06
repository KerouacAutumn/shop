package com.shop.po;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.io.Serializable;

/**
 * (Comment)实体类
 *
 * @author makejava
 * @since 2020-04-03 01:08:48
 */
public class Comment implements Serializable {
    private static final long serialVersionUID = -87509520423001471L;
    
    private Integer id;
    
    private Integer pid;
    
    private Integer uid;
    
    private String savetime;
    
    private String replycontent;

    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getSavetime() {
        return savetime;
    }

    public void setSavetime(String savetime) {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        this.savetime = sdf.format(date);
    }

    public String getReplycontent() {
        return replycontent;
    }

    public void setReplycontent(String replycontent) {
        this.replycontent = replycontent;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", pid=" + pid +
                ", uid=" + uid +
                ", savetime=" + savetime +
                ", replycontent='" + replycontent + '\'' +
                '}';
    }
}