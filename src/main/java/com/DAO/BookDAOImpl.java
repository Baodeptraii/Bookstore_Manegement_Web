package com.DAO;

import com.entity.Book_data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BookDAOImpl implements BookDAO {

    private Connection conn;

    public BookDAOImpl(Connection conn) {
        this.conn = conn;
    }

    @Override
    public boolean addBook(Book_data book_data) {
        boolean f = false;
        try {

            String sql = "insert into book(bookName, author, price, category, status, photo, user_email) values(?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, book_data.getBookName());
            ps.setString(2, book_data.getAuthor());
            ps.setString(3, book_data.getPrice());
            ps.setString(4, book_data.getCategory());
            ps.setString(5, book_data.getStatus());
            ps.setString(6, book_data.getPhoto());
            ps.setString(7, book_data.getUser_email());

            int i = ps.executeUpdate();

            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    @Override
    public List<Book_data> getAllBooks() {

        List<Book_data> list = new ArrayList<Book_data>();
        Book_data b = null;

        try {
            String sql = "select * from book";
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new Book_data();
                b.setBookID(rs.getInt("bookID"));
                b.setBookName(rs.getString("bookName"));
                b.setAuthor(rs.getString("author"));
                b.setPrice(rs.getString("price"));
                b.setCategory(rs.getString("category"));
                b.setStatus(rs.getString("status"));
                b.setPhoto(rs.getString("photo"));
                b.setUser_email(rs.getString("user_email"));
                list.add(b);
            }


        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public Book_data getBookById(int bookID) {

        Book_data b = null;

        try {
            String sql = "select * from book where bookID=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, bookID);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new Book_data();
                b.setBookID(rs.getInt("bookID"));
                b.setBookName(rs.getString("bookName"));
                b.setAuthor(rs.getString("author"));
                b.setPrice(rs.getString("price"));
                b.setCategory(rs.getString("category"));
                b.setStatus(rs.getString("status"));
                b.setPhoto(rs.getString("photo"));
                b.setUser_email(rs.getString("user_email"));
            }


        } catch (Exception e) {
            e.printStackTrace();
        }

        return b;

    }

    @Override
    public boolean deleteBook(int bookID) {

        boolean f = false;

        try {
            String sql = "delete from book where bookID=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, bookID);

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;

    }

    @Override
    public boolean updateBook(Book_data book_data) {

        boolean f = false;

        try {
            String sql = "update book set bookName=?, author=?, price=?, category=?, status=? where bookID=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, book_data.getBookName());
            ps.setString(2, book_data.getAuthor());
            ps.setString(3, book_data.getPrice());
            ps.setString(4, book_data.getCategory());
            ps.setString(5, book_data.getStatus());
            ps.setInt(6, book_data.getBookID());


            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();


        }
        return f;
    }

    @Override
    public List<Book_data> getNewBook() {

        List<Book_data> list = new ArrayList<Book_data>();
        Book_data b = null;
        try {

            String sql = "select * from book where category=? and status=? order by bookID desc";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "New");
            ps.setString(2, "Active");

            ResultSet rs = ps.executeQuery();

            int i = 1;
            while (rs.next() && i <= 4) {
                b = new Book_data();
                b.setBookID(rs.getInt("bookID"));
                b.setBookName(rs.getString("bookName"));
                b.setAuthor(rs.getString("author"));
                b.setPrice(rs.getString("price"));
                b.setCategory(rs.getString("category"));
                b.setStatus(rs.getString("status"));
                b.setPhoto(rs.getString("photo"));
                b.setUser_email(rs.getString("user_email"));
                list.add(b);
                i++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;

    }

    @Override
    public List<Book_data> getOldBook() {

        List<Book_data> list = new ArrayList<Book_data>();
        Book_data b = null;
        try {

            String sql = "select * from book where category=? and status=? order by bookID desc";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Old");
            ps.setString(2, "Active");

            ResultSet rs = ps.executeQuery();

            int i = 1;
            while (rs.next() && i <= 4) {
                b = new Book_data();
                b.setBookID(rs.getInt("bookID"));
                b.setBookName(rs.getString("bookName"));
                b.setAuthor(rs.getString("author"));
                b.setPrice(rs.getString("price"));
                b.setCategory(rs.getString("category"));
                b.setStatus(rs.getString("status"));
                b.setPhoto(rs.getString("photo"));
                b.setUser_email(rs.getString("user_email"));
                list.add(b);
                i++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public List<Book_data> getRecentBook() {

        List<Book_data> list = new ArrayList<Book_data>();
        Book_data b = null;
        try {

            String sql = "select * from book where status=? order by bookID desc";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Active");

            ResultSet rs = ps.executeQuery();

            int i = 1;
            while (rs.next() && i <= 4) {
                b = new Book_data();
                b.setBookID(rs.getInt("bookID"));
                b.setBookName(rs.getString("bookName"));
                b.setAuthor(rs.getString("author"));
                b.setPrice(rs.getString("price"));
                b.setCategory(rs.getString("category"));
                b.setStatus(rs.getString("status"));
                b.setPhoto(rs.getString("photo"));
                b.setUser_email(rs.getString("user_email"));
                list.add(b);
                i++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public List<Book_data> getAllRecentBook() {
        List<Book_data> list = new ArrayList<Book_data>();
        Book_data b = null;
        try {

            String sql = "select * from book where status=? order by bookID desc";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Active");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                b = new Book_data();
                b.setBookID(rs.getInt("bookID"));
                b.setBookName(rs.getString("bookName"));
                b.setAuthor(rs.getString("author"));
                b.setPrice(rs.getString("price"));
                b.setCategory(rs.getString("category"));
                b.setStatus(rs.getString("status"));
                b.setPhoto(rs.getString("photo"));
                b.setUser_email(rs.getString("user_email"));
                list.add(b);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public List<Book_data> getAllNewBook() {

        List<Book_data> list = new ArrayList<Book_data>();
        Book_data b = null;
        try {

            String sql = "select * from book where category=? and status=? order by bookID asc";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "New");
            ps.setString(2, "Active");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                b = new Book_data();
                b.setBookID(rs.getInt("bookID"));
                b.setBookName(rs.getString("bookName"));
                b.setAuthor(rs.getString("author"));
                b.setPrice(rs.getString("price"));
                b.setCategory(rs.getString("category"));
                b.setStatus(rs.getString("status"));
                b.setPhoto(rs.getString("photo"));
                b.setUser_email(rs.getString("user_email"));
                list.add(b);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public List<Book_data> getAllOldBook() {
        List<Book_data> list = new ArrayList<Book_data>();
        Book_data b = null;
        try {

            String sql = "select * from book where category=? and status=? order by bookID desc";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Old");
            ps.setString(2, "Active");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                b = new Book_data();
                b.setBookID(rs.getInt("bookID"));
                b.setBookName(rs.getString("bookName"));
                b.setAuthor(rs.getString("author"));
                b.setPrice(rs.getString("price"));
                b.setCategory(rs.getString("category"));
                b.setStatus(rs.getString("status"));
                b.setPhoto(rs.getString("photo"));
                b.setUser_email(rs.getString("user_email"));
                list.add(b);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public List<Book_data> searchBook(String search) {

        List<Book_data> list = new ArrayList<Book_data>();
        Book_data b = null;
        try {

            String sql = "select * from book where bookName like ? or author like ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + search + "%");
            ps.setString(2, "%" + search + "%");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                b = new Book_data();
                b.setBookID(rs.getInt("bookID"));
                b.setBookName(rs.getString("bookName"));
                b.setAuthor(rs.getString("author"));
                b.setPrice(rs.getString("price"));
                b.setCategory(rs.getString("category"));
                b.setStatus(rs.getString("status"));
                b.setPhoto(rs.getString("photo"));
                b.setUser_email(rs.getString("user_email"));
                list.add(b);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;

    }

    @Override
    public List<Book_data> getBookByOld(String email, String category) {

        List<Book_data> list = new ArrayList<Book_data>();

        try {

            String sql = "select * from book where user_email=? and category=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, category);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Book_data b = new Book_data();
                b.setBookID(rs.getInt("bookID"));
                b.setBookName(rs.getString("bookName"));
                b.setAuthor(rs.getString("author"));
                b.setPrice(rs.getString("price"));
                b.setCategory(rs.getString("category"));
                b.setStatus(rs.getString("status"));
                b.setPhoto(rs.getString("photo"));
                b.setUser_email(rs.getString("user_email"));
                list.add(b);
            }


        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;

    }

    @Override
    public boolean deleteOldBook(String email, String category, int id) {

        boolean f = false;
        try {
            String sql = "delete from book where user_email=? and category=? and bookID=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, category);
            ps.setInt(3, id);

            int i = ps.executeUpdate();
            if (i > 0) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;


    }

    @Override
    public List<Book_data> getBookBySort(String sortCriteria, String sortOrder) {
        List<Book_data> list = new ArrayList<>();
        String query = "SELECT * FROM book ORDER BY " + sortCriteria + " " + sortOrder;

        try (PreparedStatement pst = this.conn.prepareStatement(query)) {
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Book_data book = new Book_data();
                // Set book data from ResultSet
                list.add(book);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
