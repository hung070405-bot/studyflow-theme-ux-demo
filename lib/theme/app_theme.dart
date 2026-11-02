import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Quản lý tập trung Theme, ColorScheme và Typography cho toàn ứng dụng
class AppTheme {
  /// Danh sách màu chủ đạo mẫu để người dùng thử nghiệm ColorScheme.fromSeed
  static const List<Color> seedColors = [
    Color(0xFF00838A), // Teal (Màu chủ đạo trên slide nhóm)
    Color(0xFF3F51B5), // Indigo
    Color(0xFFE65100), // Cam
    Color(0xFFC2185B), // Hồng
  ];

  /// Tạo ThemeData cho chế độ Sáng (Brightness.light) hoặc Tối (Brightness.dark)
  static ThemeData buildTheme({
    required Color seedColor,
    required Brightness brightness,
  }) {
    // 1. Sinh bảng màu tự động đảm bảo độ tương phản từ 1 màu gốc (seedColor)
    final colorScheme = ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: brightness,
    );

    // 2. Trả về cấu hình ThemeData thống nhất
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      // Đồng bộ màu sang cả các widget Cupertino (iOS)
      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: brightness,
        primaryColor: colorScheme.primary,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surfaceContainer,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        centerTitle: false,
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
