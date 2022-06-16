/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.BlogDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author To Quyen Phan
 */
public class BlogDAO {

    private static final String GET_ALL_BLOGS = "SELECT blogID,Blog.userID,userApproveID,subjectID,title,content,date, Blog.image,video,"
            + "numberOfVotes,numberOfComments,Blog.status, fullName FROM Blog JOIN [USER] ON Blog.userID = [User].userID "
            + "WHERE Blog.status LIKE 'approved'";
    private static final String SEARCH = "SELECT blogID,Blog.userID,userApproveID,subjectID,title,content,date, Blog.image,video,"
            + "numberOfVotes,numberOfComments,Blog.status, fullName FROM Blog JOIN [USER] ON Blog.userID = [User].userID "
            + "WHERE title LIKE ? AND Blog.status LIKE 'approved'";
    private static final String BLOG_DETAIL = "SELECT blogID,Blog.userID,userApproveID,subjectID,title,content,date, Blog.image,video,"
            + "numberOfVotes,numberOfComments,Blog.status, fullName FROM Blog JOIN [USER] ON Blog.userID = [User].userID "
            + "WHERE blogID = ? ";
    private static final String POST_BLOG = "INSERT INTO [Blog](userID, userApproveID, subjectID, title, content, date, image, video, numberOfVotes, numberOfComments, status)"
            + "VALUES( ?,null,?,?,?,?,?,null,0,0,'waiting')";
    private static final String UPDATE_VOTE = "UPDATE Blog SET numberOfVotes = ? WHERE blogID = ?";
    private static final String GET_ALL_APPROVE_BLOGS = "SELECT blogID,Blog.userID,userApproveID,subjectID,title,content,date, Blog.image,video,"
            + "numberOfVotes,numberOfComments,Blog.status, fullName FROM Blog JOIN [USER] ON Blog.userID = [User].userID "
            + "WHERE Blog.status LIKE 'waiting' AND Blog.userID != ?";
    private static final String DELETE_BLOG = "UPDATE Blog SET status = 'disable' WHERE blogID = ?";
    private static final String EDIT_BLOG = "UPDATE Blog  \n"
            + "set subjectID=?, title=? , content=?,date=?,image=?, video=?\n"
            + "where blogID=?";
    private static final String APPROVE_BLOG = "UPDATE Blog SET status= 'approved' WHERE blogID = ?";
    private static final String REJECT_BLOG = "UPDATE Blog SET status= 'rejected' WHERE blogID = ?";

    public List<BlogDTO> getAllBlogs() throws SQLException {
        List<BlogDTO> listAllBlogs = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_ALL_BLOGS);
                rs = psm.executeQuery();
                while (rs.next()) {
                    int blogID = rs.getInt("blogID");
                    int userID = rs.getInt("userID");
                    int userApproveID = rs.getInt("userApproveID");
                    int subjectID = rs.getInt("subjectID");
                    String title = rs.getString("title");
                    String content = rs.getString("content");
                    String date = rs.getString("date");
                    String image = rs.getString("image");
                    String video = rs.getString("video");
                    int numberOfVotes = rs.getInt("numberOfVotes");
                    int numberOfComments = rs.getInt("numberOfComments");
                    String status = rs.getString("status");
                    String fullName = rs.getString("fullName");
                    listAllBlogs.add(new BlogDTO(blogID, userID, userApproveID, subjectID, title, content,
                            date, image, video, numberOfVotes, numberOfComments, status, fullName));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (psm != null) {
                psm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listAllBlogs;
    }

    public List<BlogDTO> searchByTitle(String search) throws SQLException {
        List<BlogDTO> listAllBlogs = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int blogID = rs.getInt("blogID");
                    int userID = rs.getInt("userID");
                    int userApproveID = rs.getInt("userApproveID");
                    int subjectID = rs.getInt("subjectID");
                    String title = rs.getString("title");
                    String content = rs.getString("content");
                    String date = rs.getString("date");
                    String image = rs.getString("image");
                    String video = rs.getString("video");
                    int numberOfVotes = rs.getInt("numberOfVotes");
                    int numberOfComments = rs.getInt("numberOfComments");
                    String status = rs.getString("status");
                    String fullName = rs.getString("fullName");
                    listAllBlogs.add(new BlogDTO(blogID, userID, userApproveID, subjectID, title, content,
                            date, image, video, numberOfVotes, numberOfComments, status, fullName));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listAllBlogs;
    }

    public BlogDTO BlogDetail(int blogID) throws SQLException {
        BlogDTO blogDetail = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(BLOG_DETAIL);
                ptm.setInt(1, blogID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    int userID = rs.getInt("userID");
                    int userApproveID = rs.getInt("userApproveID");
                    int subjectID = rs.getInt("subjectID");
                    String title = rs.getString("title");
                    String content = rs.getString("content");
                    String date = rs.getString("date");
                    String image = rs.getString("image");
                    String video = rs.getString("video");
                    int numberOfVotes = rs.getInt("numberOfVotes");
                    int numberOfComments = rs.getInt("numberOfComments");
                    String status = rs.getString("status");
                    String fullName = rs.getString("fullName");
                    blogDetail = new BlogDTO(blogID, userID, userApproveID, subjectID, title, content,
                            date, image, video, numberOfVotes, numberOfComments, status, fullName);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return blogDetail;
    }

    public boolean postBlog(int userID, int subjectID, String title, String content, String date, String image) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(POST_BLOG);
                ptm.setInt(1, userID);
                ptm.setInt(2, subjectID);
                ptm.setString(3, title);
                ptm.setString(4, content);
                ptm.setString(5, date);
                ptm.setString(6, image); //?
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public BlogDTO getBlogByID(int blogID) throws SQLException, ClassNotFoundException {
        BlogDTO blog = null;
        Connection conn = null;
        conn = DBUtils.getConnection();
        if (conn != null) {
            PreparedStatement pst = conn.prepareStatement(BLOG_DETAIL);
            pst.setInt(1, blogID);
            ResultSet rs = pst.executeQuery();
            if (rs != null && rs.next()) {
                int userID = rs.getInt("userID");
                int userApproveID = rs.getInt("userApproveID");
                int subjectID = rs.getInt("subjectID");
                String title = rs.getString("title");
                String content = rs.getString("content");
                String date = rs.getString("date");
                String image = rs.getString("image");
                String video = rs.getString("video");
                int numberOfVotes = rs.getInt("numberOfVotes");
                int numberOfComments = rs.getInt("numberOfComments");
                String status = rs.getString("status");
                String fullName = rs.getString("fullName");
                blog = new BlogDTO(blogID, userID, userApproveID, subjectID, title, content,
                        date, image, video, numberOfVotes, numberOfComments, status, fullName);
            }

            conn.close();
        }

        return blog;
    }

    public boolean updateVote(int blogID, int numberOfVotes) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(UPDATE_VOTE);
                psm.setInt(1, numberOfVotes);
                psm.setInt(2, blogID);
                check = psm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (psm != null) {
                psm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public List<BlogDTO> getAllApproveBlogs(int loginUserID) throws SQLException {
        List<BlogDTO> listAllApproveBlogs = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_ALL_APPROVE_BLOGS);
                psm.setInt(1, loginUserID);
                rs = psm.executeQuery();
                while (rs.next()) {
                    int blogID = rs.getInt("blogID");
                    int userID = rs.getInt("userID");
                    int userApproveID = rs.getInt("userApproveID");
                    int subjectID = rs.getInt("subjectID");
                    String title = rs.getString("title");
                    String content = rs.getString("content");
                    String date = rs.getString("date");
                    String image = rs.getString("image");
                    String video = rs.getString("video");
                    int numberOfVotes = rs.getInt("numberOfVotes");
                    int numberOfComments = rs.getInt("numberOfComments");
                    String status = rs.getString("status");
                    String fullName = rs.getString("fullName");
                    listAllApproveBlogs.add(new BlogDTO(blogID, userID, userApproveID, subjectID, title, content,
                            date, image, video, numberOfVotes, numberOfComments, status, fullName));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (psm != null) {
                psm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listAllApproveBlogs;
    }

    public boolean deleteBlog(int blogID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE_BLOG);
                ptm.setInt(1, blogID);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public static int editBlog(int blogID, int subjectID, String title, String content, String date, String image, String video) throws ClassNotFoundException, SQLException {
        Connection cn = null;
        PreparedStatement ptm = null;
        int rs = 0;
        cn = DBUtils.getConnection();
        if (cn != null) {
            ptm = cn.prepareStatement(EDIT_BLOG);
            ptm.setInt(1, subjectID);
            ptm.setString(2, title);
            ptm.setString(3, content);
            ptm.setString(4, date);
            ptm.setString(5, image);
            ptm.setString(6, video);
            ptm.setInt(7, blogID);
            rs = ptm.executeUpdate();

        }

        cn.close();
        return rs;
    }

    public boolean approveBlog(int blogID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(APPROVE_BLOG);
                psm.setInt(1, blogID);
                check = psm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (psm != null) {
                psm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    
    public boolean rejectBlog(int blogID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(REJECT_BLOG);
                psm.setInt(1, blogID);
                check = psm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (psm != null) {
                psm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
}
