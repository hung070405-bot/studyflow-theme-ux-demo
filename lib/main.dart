import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const StudyFlowApp());
}

/// Gốc ứng dụng: Cấu hình MaterialApp, Theme (Sáng/Tối) và tỷ lệ chữ (TextScaler)
class StudyFlowApp extends StatefulWidget {
  const StudyFlowApp({super.key});

  @override
  State<StudyFlowApp> createState() => _StudyFlowAppState();
}

class _StudyFlowAppState extends State<StudyFlowApp> {
  bool _isDarkMode = false;
  bool _isCupertino = false;
  Color _seedColor = AppTheme.seedColors.first;
  double _textScale = 1.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StudyFlow',
      // Áp dụng Theme cho chế độ Sáng và Tối từ AppTheme
      theme: AppTheme.buildTheme(
        seedColor: _seedColor,
        brightness: Brightness.light,
      ),
      darkTheme: AppTheme.buildTheme(
        seedColor: _seedColor,
        brightness: Brightness.dark,
      ),
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      // Áp dụng tỷ lệ phóng chữ toàn cục (Khả năng đọc)
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.linear(_textScale),
          ),
          child: child ?? const SizedBox.shrink(),
        );
      },
      home: HomeScreen(
        isDarkMode: _isDarkMode,
        isCupertino: _isCupertino,
        seedColor: _seedColor,
        textScale: _textScale,
        onDarkModeChanged: (v) => setState(() => _isDarkMode = v),
        onStyleChanged: (v) => setState(() => _isCupertino = v),
        onSeedColorChanged: (v) => setState(() => _seedColor = v),
        onTextScaleChanged: (v) => setState(() => _textScale = v),
      ),
    );
  }
}
