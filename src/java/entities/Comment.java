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
public class Comment {

    private int id;
    private String email;
    private String content;
    private int postId;
    private String date;

    public Comment() {
    }

    public Comment(String email, String content, int postId) {
        this.email = email;
        this.content = content;
        this.postId = postId;
    }

    public Comment(int id, String email, String content, int postId, String date) {
        this.id = id;
        this.email = email;
        this.content = content;
        this.postId = postId;
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

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

}
