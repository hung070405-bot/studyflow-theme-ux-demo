import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/study_task.dart';
import '../widgets/task_tile.dart';
import '../widgets/theme_control_panel.dart';

/// Màn hình chính sử dụng khung trang Scaffold và AppBar
class HomeScreen extends StatefulWidget {
  const HomeScreen({
    required this.isDarkMode,
    required this.isCupertino,
    required this.seedColor,
    required this.textScale,
    required this.onDarkModeChanged,
    required this.onStyleChanged,
    required this.onSeedColorChanged,
    required this.onTextScaleChanged,
    super.key,
  });

  final bool isDarkMode;
  final bool isCupertino;
  final Color seedColor;
  final double textScale;
  final ValueChanged<bool> onDarkModeChanged;
  final ValueChanged<bool> onStyleChanged;
  final ValueChanged<Color> onSeedColorChanged;
  final ValueChanged<double> onTextScaleChanged;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<StudyTask> _tasks = StudyTask.sampleTasks();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Hiển thị SnackBar phản hồi tương tác (Feedback)
  void _showSnackBar(String text) {
    final messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(SnackBar(content: Text(text)));
  }

  /// Thêm công việc mới
  void _addTask() {
    final text = _controller.text.trim();
    if (text.isEmpty) {
      _showSnackBar('Vui lòng nhập tên công việc!');
      return;
    }
    setState(() {
      _tasks.insert(0, StudyTask(title: text));
      _controller.clear();
    });
    _showSnackBar('Đã thêm công việc mới.');
  }

  /// Đổi trạng thái hoàn thành
  void _toggleTask(StudyTask task, bool value) {
    setState(() => task.isDone = value);
    _showSnackBar(value ? 'Đã hoàn thành công việc.' : 'Đã bỏ đánh dấu.');
  }

  /// Xóa công việc kèm hộp thoại xác nhận theo phong cách Material hoặc Cupertino
  Future<void> _deleteTask(int index) async {
    final task = _tasks[index];
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => widget.isCupertino
          ? CupertinoAlertDialog(
              title: const Text('Xóa công việc?'),
              content: Text('Bạn có muốn xóa "${task.title}" không?'),
              actions: [
                CupertinoDialogAction(
                  onPressed: () => Navigator.pop(ctx, false),
                  child: const Text('Hủy'),
                ),
                CupertinoDialogAction(
                  isDestructiveAction: true,
                  onPressed: () => Navigator.pop(ctx, true),
                  child: const Text('Xóa'),
                ),
              ],
            )
          : AlertDialog(
              title: const Text('Xóa công việc?'),
              content: Text('Bạn có muốn xóa "${task.title}" không?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx, false),
                  child: const Text('Hủy'),
                ),
                FilledButton(
                  onPressed: () => Navigator.pop(ctx, true),
                  child: const Text('Xóa'),
                ),
              ],
            ),
    );

    if (confirmed == true) {
      setState(() => _tasks.removeAt(index));
      _showSnackBar('Đã xóa công việc.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final doneCount = _tasks.where((t) => t.isDone).length;

    return Scaffold(
      // 1. Thanh tiêu đề AppBar chuẩn
      appBar: AppBar(
        title: const Text('StudyFlow'),
        actions: [
          Tooltip(
            message: widget.isDarkMode ? 'Chế độ Sáng' : 'Chế độ Tối',
            child: IconButton(
              onPressed: () => widget.onDarkModeChanged(!widget.isDarkMode),
              icon: Icon(
                widget.isDarkMode ? Icons.light_mode : Icons.dark_mode_outlined,
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),

      // 2. Nội dung chính đơn giản, gói gọn trên 1 màn hình
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Khu vực 1: Bảng chỉnh Theme & Đa phong cách
              ThemeControlPanel(
                isCupertino: widget.isCupertino,
                seedColor: widget.seedColor,
                textScale: widget.textScale,
                onStyleChanged: widget.onStyleChanged,
                onSeedColorChanged: widget.onSeedColorChanged,
                onTextScaleChanged: widget.onTextScaleChanged,
              ),
              const SizedBox(height: 16),

              // Khu vực 2: Ô nhập thêm công việc nhanh
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      onSubmitted: (_) => _addTask(),
                      decoration: const InputDecoration(
                        hintText: 'Nhập công việc mới...',
                        border: OutlineInputBorder(),
                        isDense: true,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  widget.isCupertino
                      ? CupertinoButton.filled(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          onPressed: _addTask,
                          child: const Text('Thêm'),
                        )
                      : FilledButton(
                          onPressed: _addTask,
                          child: const Text('Thêm'),
                        ),
                ],
              ),
              const SizedBox(height: 20),

              // Khu vực 3: Danh sách công việc
              Text(
                'Công việc ($doneCount/${_tasks.length})',
                style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ...List.generate(_tasks.length, (index) {
                final task = _tasks[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: TaskTile(
                    task: task,
                    isCupertino: widget.isCupertino,
                    onToggle: (val) => _toggleTask(task, val),
                    onDelete: () => _deleteTask(index),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
