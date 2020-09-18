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
public class Post {

    private int id;
    private String title;
    private String content;
    private String image;
    private int like;
    private int dislike;
    private String email;
    private String date;
    private boolean status;

    public Post() {
    }

    public Post(int like, int dislike) {
        this.like = like;
        this.dislike = dislike;
    }

    public Post(String title, String content, String image, String email) {
        this.title = title;
        this.content = content;
        this.image = image;
        this.email = email;
    }

    public Post(int id, String title, String content, String image, String email, String date, boolean status) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.image = image;
        this.email = email;
        this.date = date;
        this.status = status;
    }

    public Post(int id, String title, String content, String image, String email, String date) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.image = image;
        this.email = email;
        this.date = date;
    }

    public Post(int id, String title, String content, String image, int like, int dislike, String email, String date, boolean status) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.image = image;
        this.like = like;
        this.dislike = dislike;
        this.email = email;
        this.date = date;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getLike() {
        return like;
    }

    public void setLike(int like) {
        this.like = like;
    }

    public int getDislike() {
        return dislike;
    }

    public void setDislike(int dislike) {
        this.dislike = dislike;
    }

}
