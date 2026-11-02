import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Bảng tùy chỉnh nhanh: Phong cách (Material/Cupertino), Màu chủ đạo và Cỡ chữ
class ThemeControlPanel extends StatelessWidget {
  const ThemeControlPanel({
    required this.isCupertino,
    required this.seedColor,
    required this.textScale,
    required this.onStyleChanged,
    required this.onSeedColorChanged,
    required this.onTextScaleChanged,
    super.key,
  });

  final bool isCupertino;
  final Color seedColor;
  final double textScale;
  final ValueChanged<bool> onStyleChanged;
  final ValueChanged<Color> onSeedColorChanged;
  final ValueChanged<double> onTextScaleChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Card.outlined(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Chọn phong cách: Material Design vs Cupertino
            SegmentedButton<bool>(
              segments: const [
                ButtonSegment<bool>(
                  value: false,
                  icon: Icon(Icons.android, size: 18),
                  label: Text('Material'),
                ),
                ButtonSegment<bool>(
                  value: true,
                  icon: Icon(Icons.phone_iphone, size: 18),
                  label: Text('Cupertino'),
                ),
              ],
              selected: {isCupertino},
              onSelectionChanged: (s) => onStyleChanged(s.first),
            ),
            const SizedBox(height: 12),

            // 2. Chọn màu chủ đạo (ColorScheme.fromSeed)
            Row(
              children: [
                Expanded(
                  child: Text('Màu chủ đạo:', style: textTheme.bodyMedium),
                ),
                ...AppTheme.seedColors.map((color) {
                  final isSelected = color == seedColor;
                  return Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: InkWell(
                      onTap: () => onSeedColorChanged(color),
                      customBorder: const CircleBorder(),
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                          border: isSelected
                              ? Border.all(color: colorScheme.onSurface, width: 2.5)
                              : null,
                        ),
                        child: isSelected
                            ? const Icon(Icons.check, size: 16, color: Colors.white)
                            : null,
                      ),
                    ),
                  );
                }),
              ],
            ),
            const SizedBox(height: 8),

            // 3. Kéo chỉnh cỡ chữ (Khả năng đọc - Readability)
            Row(
              children: [
                Text('Cỡ chữ:', style: textTheme.bodyMedium),
                Expanded(
                  child: isCupertino
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: CupertinoSlider(
                            value: textScale,
                            min: 0.85,
                            max: 1.25,
                            divisions: 4,
                            onChanged: onTextScaleChanged,
                          ),
                        )
                      : Slider(
                          value: textScale,
                          min: 0.85,
                          max: 1.25,
                          divisions: 4,
                          onChanged: onTextScaleChanged,
                        ),
                ),
                Text(
                  '${(textScale * 100).round()}%',
                  style: textTheme.labelLarge?.copyWith(color: colorScheme.primary),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
