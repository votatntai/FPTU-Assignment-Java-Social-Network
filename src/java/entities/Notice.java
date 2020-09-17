/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

/**
 *
 * @author Vo Tan Tai
 */
public class Notice {

    private int id;
    private String email;
    private int postId;
    private String content;
    private String date;

    public Notice() {
    }

    public Notice(String email, int postId, String content) {
        this.email = email;
        this.postId = postId;
        this.content = content;
    }

    public Notice(String email, int postId, String content, String date) {
        this.email = email;
        this.postId = postId;
        this.content = content;
        this.date = date;
    }

    public Notice(int id, String email, int postId, String content, String date) {
        this.id = id;
        this.email = email;
        this.postId = postId;
        this.content = content;
        this.date = date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

}
