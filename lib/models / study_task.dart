/// Mô hình dữ liệu cho một công việc học tập
class StudyTask {
  StudyTask({
    required this.title,
    this.isDone = false,
  });

  final String title;
  bool isDone;

  /// Dữ liệu mẫu ban đầu
  static List<StudyTask> sampleTasks() => [
        StudyTask(title: 'Tìm hiểu Material Design và Cupertino', isDone: true),
        StudyTask(title: 'Cấu hình ThemeData và ColorScheme'),
        StudyTask(title: 'Thực hành nguyên tắc UX trên Flutter'),
      ];
}
