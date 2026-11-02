# StudyFlow – Demo Chủ đề 04: Thiết kế giao diện đa phong cách và nguyên tắc UX

Ứng dụng Flutter minh họa trực quan, tinh gọn, được **tách thành các file nhỏ theo từng phần lý thuyết** khớp với bài thuyết trình của nhóm.

---

## 1. Phân công thực hiện theo thành viên

| Thành viên | Tài khoản GitHub | Module / File phụ trách | Tỷ lệ đóng góp |
| :--- | :--- | :--- | :---: |
| **Lê Nguyễn Trường Giang** | [@11legiang](https://github.com/11legiang) | **Hệ thiết kế & Khung trang:** Lõi widgets, chuyển đổi Material Design & Cupertino, `Scaffold`, `AppBar`, `AlertDialog` / `CupertinoAlertDialog`<br>File: `lib/screens/home_screen.dart`, `lib/widgets/theme_control_panel.dart`, `lib/models/study_task.dart` | **50%** |
| **Võ Huy Hùng** | [@hung070405-bot](https://github.com/hung070405-bot) | **Chủ đề giao diện & Nguyên tắc UX:** `ThemeData`, `ColorScheme.fromSeed`, `TextTheme`, `InkWell`, `SnackBar`, `TextScaler`, `Semantics`, `Tooltip`<br>File: `lib/main.dart`, `lib/theme/app_theme.dart`, `lib/widgets/task_tile.dart` | **50%** |

---

## 2. Cấu trúc thư mục (`lib/`)

```text
studyflow_demo/
├── lib/
│   ├── main.dart                       # Khởi tạo MaterialApp, theme, darkTheme, TextScaler
│   ├── models/
│   │   └── study_task.dart             # Mô hình dữ liệu công việc đơn giản
│   ├── theme/
│   │   └── app_theme.dart              # Cấu hình ThemeData, ColorScheme.fromSeed (Phần của Hùng)
│   ├── screens/
│   │   └── home_screen.dart            # Khung trang Scaffold, AppBar, SnackBar, Dialog (Phần của Giang)
│   └── widgets/
│       ├── theme_control_panel.dart    # Khung chọn Material/Cupertino, Màu chủ đạo & Cỡ chữ (Phần của Giang)
│       └── task_tile.dart              # Dòng công việc: InkWell, Switch/CupertinoSwitch, Semantics (Phần của Hùng)
├── docs/
│   └── HUONG_DAN_THUYET_TRINH.md       # Hướng dẫn giải thích code và kịch bản demo
├── test/
│   └── widget_test.dart                # Kiểm thử giao diện tự động
└── tao_va_chay.bat                     # Tự động khởi tạo bộ khung và chạy trên Chrome
```

---

## 3. Hướng dẫn cài đặt và chạy dự án (Installation)

### Yêu cầu môi trường
- **Flutter SDK**: `>= 3.4.0 < 4.0.0` (kiểm tra bằng lệnh `flutter doctor`).
- **Thiết bị chạy**: Google Chrome (Web), Windows Desktop, Android Emulator hoặc iOS Simulator.

### Các bước cài đặt
1. **Clone kho mã nguồn từ GitHub:**
   ```bash
   git clone https://github.com/hung070405-bot/studyflow-theme-ux-demo.git
   cd studyflow-theme-ux-demo
   ```
2. **Cách 1 – Chạy tự động trên Windows (Khuyên dùng):**
   - Nhấp đúp vào file `tao_va_chay.bat` (hoặc chạy `.\tao_va_chay.bat` trong Terminal).
   - Script sẽ tự động khởi tạo thư mục runner, nạp thư viện (`flutter pub get`) và mở ứng dụng trên Chrome.
3. **Cách 2 – Chạy thủ công bằng dòng lệnh:**
   ```bash
   flutter create --platforms=android,web --project-name studyflow_demo .
   flutter pub get
   flutter run -d chrome
   ```

---

## 4. Cấu hình biến môi trường (`.env`) và dịch vụ ngoài (`google-services.json`)

- **Trạng thái hiện tại:** Dự án sử dụng 100% thư viện cốt lõi của Flutter SDK (`flutter/material.dart` và `flutter/cupertino.dart`) và dữ liệu mẫu trên bộ nhớ tạm (In-memory state) để tập trung minh họa **Hệ thống thiết kế (Theme/Material/Cupertino)** và **Nguyên tắc UX**. Do đó, dự án **không yêu cầu** file `.env` hay `google-services.json` để biên dịch và chạy thử.
- **Khi mở rộng kết nối Backend / Firebase:**
  - Tạo file `.env` ở thư mục gốc theo mẫu:
    ```env
    APP_ENV=development
    API_BASE_URL=https://api.example.com
    ```
  - Nếu tích hợp Firebase trên Android/iOS: Đặt file `google-services.json` vào thư mục `android/app/google-services.json` (và `GoogleService-Info.plist` vào `ios/Runner/`).
