# Hướng dẫn Giải thích Code & Demo – Chủ đề 4

Mã nguồn của dự án đã được tách thành **6 file nhỏ gọn** theo đúng bố cục slide thuyết trình của hai thành viên (**Lê Nguyễn Trường Giang** và **Võ Huy Hùng**).

---

## 1. Phân chia file để mở khi thuyết trình

### Phần của Lê Nguyễn Trường Giang (Hệ thiết kế và khung trang)
1. **[home_screen.dart](file:///d:/download/StudyFlow_Theme_UX_Demo/studyflow_demo/lib/screens/home_screen.dart)**:
   - Chỉ ra khung trang `Scaffold` và thanh tiêu đề `AppBar`.
   - Chỉ ra sự khác biệt giữa hộp thoại `AlertDialog` (Material) và `CupertinoAlertDialog` (iOS) trong hàm `_deleteTask`.
2. **[theme_control_panel.dart](file:///d:/download/StudyFlow_Theme_UX_Demo/studyflow_demo/lib/widgets/theme_control_panel.dart)**:
   - Chỉ ra nút chuyển đổi `Material` $\leftrightarrow$ `Cupertino` và thanh trượt `Slider` $\leftrightarrow$ `CupertinoSlider`.

### Phần của Võ Huy Hùng (Theme, ColorScheme, Typography & Nguyên tắc UX)
1. **[app_theme.dart](file:///d:/download/StudyFlow_Theme_UX_Demo/studyflow_demo/lib/theme/app_theme.dart)**:
   - Minh họa `ColorScheme.fromSeed(seedColor: ..., brightness: ...)` và `ThemeData`.
   - Có sẵn màu `Teal (0xFF00838A)` trùng khớp với màu trên slide Beamer của nhóm.
2. **[main.dart](file:///d:/download/StudyFlow_Theme_UX_Demo/studyflow_demo/lib/main.dart)**:
   - Minh họa `theme`, `darkTheme`, `themeMode` trên `MaterialApp` và `TextScaler.linear(_textScale)` để phóng chữ toàn cục.
3. **[task_tile.dart](file:///d:/download/StudyFlow_Theme_UX_Demo/studyflow_demo/lib/widgets/task_tile.dart)**:
   - **Tính nhất quán**: Lấy màu qua `Theme.of(context).colorScheme` và chữ qua `Theme.of(context).textTheme`.
   - **Phản hồi tương tác**: Dùng `InkWell` tạo hiệu ứng gợn sóng khi chạm (đúng như slide 9 của Hùng).
   - **Khả năng tiếp cận**: Dùng `Semantics` cho trình đọc màn hình (TalkBack/VoiceOver) và `Tooltip` cho nút xóa (`IconButton` có vùng chạm $\ge 48\times 48\text{ dp}$).

---

## 2. Kịch bản thao tác Demo trực tiếp (2 phút)

1. **Đổi Sáng / Tối**: Bấm biểu tượng Mặt trăng/Mặt trời trên `AppBar`.
2. **Đổi Material / Cupertino**: Bấm nút `Cupertino` để thấy công tắc (`CupertinoSwitch`), thanh trượt (`CupertinoSlider`), nút `Thêm` (`CupertinoButton.filled`) và hộp thoại xóa (`CupertinoAlertDialog`) chuyển sang phong cách iOS.
3. **Đổi Màu chủ đạo & Cỡ chữ**: Bấm vào 4 chấm màu tròn để thấy toàn bộ giao diện đổi màu nhất quán; kéo thanh trượt cỡ chữ từ `85%` lên `125%`.
4. **Thử tương tác UX**: Nhập một công việc mới rồi bấm `Thêm` (quan sát `SnackBar`), bấm vào dòng công việc để thấy hiệu ứng gợn sóng `InkWell`, và bấm biểu tượng thùng rác để thấy hộp thoại xác nhận xóa.
