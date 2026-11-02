# StudyFlow – Demo Chủ đề 4: Thiết kế giao diện đa phong cách và nguyên tắc UX

Ứng dụng Flutter minh họa trực quan, tinh gọn, được **tách thành các file nhỏ theo từng phần lý thuyết** khớp với bài thuyết trình của nhóm.

## Phân công thực hiện

| Thành viên | Tài khoản GitHub | Nội dung phụ trách | Đóng góp |
| :--- | :--- | :--- | :---: |
| **Lê Nguyễn Trường Giang** | [@11legiang](https://github.com/11legiang) | Hệ thiết kế và khung trang: lõi widgets, Material Design, Cupertino, `Scaffold` và `AppBar` (`home_screen.dart`, `theme_control_panel.dart`). | 50% |
| **Võ Huy Hùng** | [@hung070405-bot](https://github.com/hung070405-bot) | `Theme`, `ColorScheme`, `Typography` và các nguyên tắc UX (`app_theme.dart`, `task_tile.dart`, `main.dart`). | 50% |

---

## 1. Cấu trúc thư mục (`lib/`)

Mỗi file trong `lib/` chỉ dài từ **20 – 150 dòng**, tương ứng trực tiếp với phần thuyết trình của 2 thành viên:

```text
studyflow_demo/
├── lib/
│   ├── main.dart                       # Khởi tạo MaterialApp, theme, darkTheme, TextScaler
│   ├── models/
│   │   └── study_task.dart             # Mô hình dữ liệu công việc đơn giản
│   ├── theme/
│   │   └── app_theme.dart              # Cấu hình ThemeData, ColorScheme.fromSeed (Phần của Hùng)
│   ├── screens/
│   │   └── home_screen.dart            # Khung trang Scaffold, AppBar, SnackBar, Dialog (Phần của Giang & Hùng)
│   └── widgets/
│       ├── theme_control_panel.dart    # Khung chọn Material/Cupertino, Màu chủ đạo & Cỡ chữ
│       └── task_tile.dart              # Dòng công việc: InkWell, Switch/CupertinoSwitch, Semantics, Tooltip
├── docs/
│   └── HUONG_DAN_THUYET_TRINH.md       # Hướng dẫn giải thích code và kịch bản demo
├── test/
│   └── widget_test.dart                # Kiểm thử giao diện
└── tao_va_chay.bat                     # Tự động chép toàn bộ thư mục lib/ và chạy trên Chrome
```

---

## 2. Cách chạy nhanh

### Cách 1: Chạy tự động bằng `tao_va_chay.bat`
Nhấp đúp vào `tao_va_chay.bat`. Script sẽ tự động chép toàn bộ thư mục `lib/` vào `generated_app/lib/` và mở ứng dụng trên trình duyệt Chrome.

### Cách 2: Chạy thủ công bằng dòng lệnh
```bash
flutter create --platforms=android,web --project-name studyflow_demo generated_app
xcopy /E /I /Y lib generated_app\lib
copy /Y pubspec.yaml generated_app\pubspec.yaml
cd generated_app
flutter run -d chrome
```
