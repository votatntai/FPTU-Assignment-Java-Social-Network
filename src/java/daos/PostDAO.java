/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import entities.Comment;
import entities.Post;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import utils.MyConnection;

/**
 *
 * @author Vo Tan Tai
 */
public class PostDAO {

    private Connection conn;
    private PreparedStatement stm;
    private ResultSet rs;

    private void closeConnection() throws SQLException {
        if (rs != null) {
            rs.close();
        }
        if (stm != null) {
            stm.close();
        }
        if (conn != null) {
            conn.close();
        }
    }

    public int createPost(Post post) throws SQLException, NamingException {
        int result = 0;
        try {
            conn = MyConnection.getConnection();
            stm = conn.prepareCall("{Call CreatePost(?, ?, ?, ?)}");
            stm.setString(1, post.getTitle());
            stm.setString(2, post.getContent());
            stm.setString(3, post.getImage());
            stm.setString(4, post.getEmail());
            result = stm.executeUpdate();
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<Post> searchPostByContent(String search, int pageNumber, int rowOfpage) throws SQLException, NamingException {
        List<Post> list = null;
        Post post;
        try {
            conn = MyConnection.getConnection();
            stm = conn.prepareCall("{Call Search(?, ?, ?)}");
            stm.setString(1, search);
            stm.setInt(2, pageNumber);
            stm.setInt(3, rowOfpage);
            rs = stm.executeQuery();
            list = new ArrayList<>();
            while (rs.next()) {
                post = new Post(rs.getInt("Id"),
                        rs.getString("Title"),
                        rs.getString("Content"),
                        rs.getString("Image"),
                        rs.getString("Email"),
                        rs.getString("Date"));
                list.add(post);
            }
        } finally {
            closeConnection();
        }
        return list;
    }

    public Post getPostById(int id) throws SQLException, NamingException {
        Post post = null;
        try {
            conn = MyConnection.getConnection();
            stm = conn.prepareCall("{Call GetPostById(?)}");
            stm.setInt(1, id);
            rs = stm.executeQuery();
            if (rs.next()) {
                post = new Post(id,
                        rs.getString("Title"),
                        rs.getString("Content"),
                        rs.getString("Image"),
                        rs.getInt("Likes"),
                        rs.getInt("Dislikes"),
                        rs.getString("Email"),
                        rs.getString("Date"),
                        true);
            }
        } finally {
            closeConnection();
        }
        return post;
    }

    public List<Comment> getComment(int id) throws SQLException, NamingException {
        List<Comment> list = null;
        try {
            conn = MyConnection.getConnection();
            stm = conn.prepareStatement("Select Id, Email, Comment, Date From Comments Where PostId = ? Order By Date DESC;");
            stm.setInt(1, id);
            rs = stm.executeQuery();
            list = new ArrayList<>();
            Comment comment;
            while (rs.next()) {
                comment = new Comment(
                        rs.getInt("Id"),
                        rs.getString("Email"),
                        rs.getString("Comment"),
                        id,
                        rs.getString("Date")
                );
                list.add(comment);
            }
        } finally {
            closeConnection();
        }
        return list;
    }

    public int createComment(Comment comment) throws SQLException, NamingException {
        int result = 0;
        try {
            conn = MyConnection.getConnection();
            stm = conn.prepareStatement("Insert Into Comments (Email, Comment, PostId) Values (?, ?, ?)"
                    + "Insert Into Notices (Email, PostId, Content, Author) Values (?, ?, ?, (Select Email From Posts Where Posts.Id = ?))");
            stm.setString(1, comment.getEmail());
            stm.setString(2, comment.getContent());
            stm.setInt(3, comment.getPostId());
            stm.setString(4, comment.getEmail());
            stm.setInt(5, comment.getPostId());
            stm.setString(6, "đã bình luận về bài viết của bạn");
            stm.setInt(7, comment.getPostId());
            result = stm.executeUpdate();
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean likePost(String email, int postId) throws SQLException, NamingException {
        boolean result = false;
        try {
            conn = MyConnection.getConnection();
            stm = conn.prepareCall("{Call LikePost(?, ?)}");
            stm.setString(1, email);
            stm.setInt(2, postId);
            result = stm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean disLikePost(String email, int postId) throws SQLException, NamingException {
        boolean result = false;
        try {
            conn = MyConnection.getConnection();
            stm = conn.prepareCall("{Call DislikePost(?, ?)}");
            stm.setString(1, email);
            stm.setInt(2, postId);
            result = stm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }

}
