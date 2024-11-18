
# Website Quản Lý Cửa Hàng Sách

## Mô Tả
Đây là một website quản lý cửa hàng sách trực tuyến, hỗ trợ người dùng (Admin và User) thực hiện các thao tác quản lý và mua sách. Dự án được phát triển với mục tiêu áp dụng các kiến thức về lập trình hướng đối tượng và xây dựng web động.

![image](https://github.com/user-attachments/assets/be304765-0035-44a7-86f8-4ee6a0f9405d)

---

## Công Nghệ Sử Dụng
- **Ngôn ngữ lập trình:** Java
- **Công nghệ:** Java Servlet, JSP, JDBC
- **Cơ sở dữ liệu:** MySQL
- **Công cụ build:** Maven
- **Server:** Apache Tomcat

---

## Môi Trường Cài Đặt
- **JDK:** Phiên bản từ 8 trở lên
- **Apache Tomcat Server:** Phiên bản từ 9.0 trở lên
- **MySQL Workbench:** Phiên bản từ 8.0 trở lên
- **Trình duyệt:** Hỗ trợ các trình duyệt phổ biến như Chrome, Firefox, Edge

---

## Chức Năng Chính
### **Admin**
- Quản lý sách:
  - Xem danh sách sách
  - Thêm mới sách
  - Sửa thông tin sách
  - Xóa sách
- Quản lý đơn hàng:
  - Xem danh sách đơn hàng
  - Xóa đơn hàng

### **User**
- Xem danh sách sách
- Thêm sách vào giỏ hàng
- Xem giỏ hàng
- Xóa sách khỏi giỏ hàng
- Đặt hàng

### **Chung**
- Đăng nhập, đăng xuất
- Tìm kiếm sách theo tên hoặc thể loại
- Phân trang
- Thông báo:
  - Lỗi khi nhập sai dữ liệu
  - Thành công khi thêm, sửa, xóa sách hoặc đặt hàng

---

## Cấu Trúc Thư Mục
```
src/
├── main/
│   ├── java/
│   │   └── com/
│   │       ├── .servlet/   # Các file Servlet của Admin và User
│   │       ├── entity/     # Các đối tượng 
│   │       ├── DAO/        # File Data Access Object để xử lí các thao tác và dữ liệu
│   │       └── DB/         # Kết nối Database
│   ├── webapp/
│       ├── admin/              # File JSP của Admin
│       ├── all_component/      # File CSS cho User
│       ├── book/              # File ảnh
│       ├── js/               # File JavaScript (nếu có)
│       ├── .jsp/            # Các file JSP của User
│       └── WEB-INF/
│           └── web.xml       # Cấu hình Web
```

---

## Hướng Dẫn Cài Đặt
### **Bước 1:** Clone dự án và cài đặt các gói thư viện cần thiết
```bash
git clone https://github.com/Baodeptraii/Bookstore_Manegement_Web
```
- Nếu code hiện các lỗi, hãy kiểm tra các gói thư viện, các file .jar đã được cài đặt hay chưa.
- Kiểm tra file pom.xml và các dependencies trong đó.

### **Bước 2:** Tạo cơ sở dữ liệu
- Mở MySQL Workbench.
- Tạo một database mới với tên `book_web`.
- Import file SQL (nếu có) hoặc tự tạo bảng phù hợp.
- Hình ảnh mô tả các bảng dữ liệu :
- 
  ![image](https://github.com/user-attachments/assets/31c75205-5630-4d9d-89df-fba0d3db0722)



### **Bước 3:** Cấu hình kết nối cơ sở dữ liệu
- Mở file `src/main/java/com/DB/DBConnect.java`.
- Sửa thông tin kết nối cơ sở dữ liệu (username, password) theo cấu hình của bạn:
```java
private static final String URL = "jdbc:mysql://localhost:3306/book_web";
private static final String USER = "root";
private static final String PASSWORD = "yourpassword";
```

### **Bước 4:** Build dự án
- Mở Command Prompt hoặc Terminal.
- Di chuyển đến thư mục chứa dự án và chạy lệnh:
```bash
mvn clean install
```

### **Bước 5:** Deploy lên server
- Mở Apache Tomcat Server, deploy dự án.
- Chạy server, mở trình duyệt và truy cập:
```
http://localhost:8080/bookstore
```

---

## Tài Khoản Mặc Định
- **Admin:**
  - Username: `admin@gmail.com`
  - Password: `admin`
- **User:**
  - Username: `user@gmail.com`
  - Password: `user`

---

## Demo
Link video demo: [YouTube](https://youtu.be/7XH9WSQsqxI)

---

## Lời Cảm Ơn
Xin chân thành cảm ơn các nguồn tài liệu và công cụ đã hỗ trợ quá trình phát triển sản phẩm:
- **ChatGPT**
- **Google**
- **StackOverflow**
- **YouTube**
- **Github**
- **Và đặc biệt là -> [anh Ấn Độ](https://www.youtube.com/watch?v=3cDcUtY0uLQ&list=PLQTYNpk8jwk33-kHcV0xdBy4L617EVnAt)**
---

## Tác Giả
- **Họ tên:** Trương Quốc Bảo  
- **Nickname:** Re3on  

*Dự án là bài tập lớn môn "Lập trình hướng đối tượng" - Học viện Công nghệ Bưu chính Viễn thông.*  
*Sản phẩm đã được cải tiến với thêm các chức năng và giao diện mới.*
