package com.DAO;

import com.entity.Book_data;

import java.util.List;

public interface BookDAO {

    public boolean addBook(Book_data book_data);

    public List<Book_data> getAllBooks();

    public Book_data getBookById(int bookID);

    public boolean deleteBook(int bookID);

    public boolean updateBook(Book_data book_data);

    public List<Book_data> getNewBook();

    public List<Book_data> getOldBook();

    public List<Book_data> getRecentBook();

    public List<Book_data> getAllRecentBook();

    public List<Book_data> getAllNewBook();

    public List<Book_data> getAllOldBook();

    public List<Book_data> searchBook(String search);

    public List<Book_data> getBookByOld(String email, String category);

    public boolean deleteOldBook(String email, String category, int id);

    public List<Book_data> getBookBySort(String sortCriteria, String sortOrder);




}
