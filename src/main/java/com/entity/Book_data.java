package com.entity;

public class Book_data {
    private int bookID;
    private String bookName;
    private String author;
    private String price;
    private String category;
    private String status;
    private String photo;
    private String user_email;

    public Book_data(String bookName, String author, String price, String category, String status, String photo, String user_email) {
        this.bookName = bookName;
        this.author = author;
        this.price = price;
        this.category = category;
        this.status = status;
        this.photo = photo;
        this.user_email = user_email;
    }

    public Book_data() {

    }

    public int getBookID() {
        return bookID;
    }

    public void setBookID(int bookID) {
        this.bookID = bookID;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    @Override
    public String toString() {
        return "Book_data{" +
                "bookID=" + bookID +
                ", bookName='" + bookName + '\'' +
                ", author='" + author + '\'' +
                ", price=" + price +
                ", category='" + category + '\'' +
                ", status='" + status + '\'' +
                ", photo='" + photo + '\'' +
                ", user_email='" + user_email + '\'' +
                '}';
    }
}
