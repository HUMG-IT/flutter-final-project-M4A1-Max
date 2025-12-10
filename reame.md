
## Thông tin sinh viên
- **Họ và tên**: Nguyễn Đức Mạnh
- **MSSV**: 2221050617
- **Lớp**: DCCTCLC67B

## Giới thiệu
Đây là yêu cầu của bài tập lớn cho một trong hai học phần **Phát triển ứng dụng di động đa nền tảng 1 (mã học phần 7080325) và Phát triển ứng dụng cho thiết bị di động + BTL (mã học phần 7080115)**. Sinh viên sẽ xây dựng một ứng dụng di động hoàn chỉnh sử dụng Flutter và Dart, áp dụng các kiến thức đã học về lập trình giao diện người dùng, quản lý trạng thái, tích hợp API hoặc/và CSDL, kiểm thử tự động và CI/CD với GitHub Actions.

## Mục tiêu
Bài tập lớn nhằm:
- Phát triển kỹ năng lập trình giao diện người dùng (UI) với Flutter và ngôn ngữ Dart.
- Hiểu và áp dụng các cách quản lý trạng thái trong ứng dụng Flutter.
- Biết tích hợp ứng dụng với backend hoặc dịch vụ backend thông qua API hoặc CSDL.
- Thực hiện được các thao tác CRUD (Create, Read, Update, Delete) cơ bản với dữ liệu.
- Biết áp dụng kiểm thử tự động để đảm bảo chất lượng ứng dụng.
- Biết áp dụng CI/CD với GitHub Actions để tự động hóa quy trình kiểm thử và triển khai.

## Ứng dụng: Quản lý Ghi chú (Note App)

### Giới thiệu ứng dụng
Ứng dụng Quản lý Ghi chú được xây dựng bằng Flutter và tích hợp với Firebase Cloud Firestore. Ứng dụng cho phép người dùng thực hiện các thao tác CRUD đầy đủ trên các ghi chú cá nhân.

### Đối tượng chính
- **Note (Ghi chú)** với các thuộc tính:
  - `id`: Định danh duy nhất
  - `title`: Tiêu đề ghi chú
  - `content`: Nội dung ghi chú
  - `timestamp`: Thời gian tạo/cập nhật

## Công nghệ và Thư viện sử dụng

| Công nghệ/Thư viện | Mục đích sử dụng |
|-------------------|------------------|
| Flutter/Dart | Xây dựng giao diện người dùng và logic ứng dụng |
| Firebase Core | Kết nối với dịch vụ Firebase |
| Cloud Firestore | CSDL NoSQL cho lưu trữ dữ liệu ghi chú |
| flutter_test | Framework kiểm thử tự động |
| GitHub Actions | Tự động hóa CI/CD pipeline |

## Cấu trúc ứng dụng

### Màn hình chính
1. **HomePage** - Hiển thị danh sách tất cả ghi chú
2. **NoteDetailsPage** - Tạo/sửa ghi chú chi tiết

### Chức năng chính
- **Tạo ghi chú mới**: Nhập tiêu đề và nội dung
- **Đọc danh sách ghi chú**: Hiển thị theo thời gian thực
- **Cập nhật ghi chú**: Chỉnh sửa tiêu đề và nội dung
- **Xóa ghi chú**: Xóa với xác nhận
- **Tìm kiếm cơ bản**: Lọc ghi chú theo tiêu đề

## Hướng dẫn cài đặt

### 1. Yêu cầu hệ thống
- Flutter SDK (phiên bản 3.0 trở lên)
- Dart SDK
- Firebase CLI
- Git

### 2. Các bước cài đặt

```bash
# 1. Clone repository
git clone <đường-dẫn-repository>
cd <tên-thư-mục>
```
```bash
# 2. Cài đặt dependencies
flutter pub get
```
```bash
# 3. Cấu hình Firebase
# - Tạo project trên Firebase Console
# - Kích hoạt Firestore Database
# - Thêm ứng dụng Flutter
# - Tải file google-services.json
flutterfire configure
```
```bash
# 4. Chạy ứng dụng
flutter run
```