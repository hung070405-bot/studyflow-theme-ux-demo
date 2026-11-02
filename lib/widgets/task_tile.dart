import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/study_task.dart';

/// Thẻ hiển thị 1 công việc: minh họa Tính nhất quán, InkWell, Semantics và Đa phong cách
class TaskTile extends StatelessWidget {
  const TaskTile({
    required this.task,
    required this.isCupertino,
    required this.onToggle,
    required this.onDelete,
    super.key,
  });

  final StudyTask task;
  final bool isCupertino;
  final ValueChanged<bool> onToggle;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Semantics(
      label: 'Công việc ${task.title}, ${task.isDone ? "đã xong" : "chưa xong"}',
      child: Card.outlined(
        clipBehavior: Clip.antiAlias,
        // InkWell tạo hiệu ứng gợn sóng (Phản hồi tương tác) khi chạm vào thẻ
        child: InkWell(
          onTap: () => onToggle(!task.isDone),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Row(
              children: [
                // Công tắc thay đổi theo Material hoặc Cupertino
                isCupertino
                    ? CupertinoSwitch(
                        value: task.isDone,
                        onChanged: onToggle,
                      )
                    : Switch(
                        value: task.isDone,
                        onChanged: onToggle,
                      ),
                const SizedBox(width: 12),
                // Nội dung công việc dùng TextTheme và ColorScheme nhất quán
                Expanded(
                  child: Text(
                    task.title,
                    style: textTheme.bodyLarge?.copyWith(
                      decoration: task.isDone ? TextDecoration.lineThrough : null,
                      color: task.isDone
                          ? colorScheme.onSurfaceVariant
                          : colorScheme.onSurface,
                    ),
                  ),
                ),
                // Nút xóa có Tooltip và vùng chạm >= 48x48dp (Khả năng tiếp cận)
                Tooltip(
                  message: 'Xóa công việc',
                  child: IconButton(
                    onPressed: onDelete,
                    icon: Icon(
                      isCupertino ? CupertinoIcons.trash : Icons.delete_outline,
                      color: colorScheme.error,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
