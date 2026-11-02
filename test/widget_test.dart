import 'package:flutter_test/flutter_test.dart';
import 'package:studyflow_demo/main.dart';

void main() {
  testWidgets('StudyFlow hien thi giao dien chinh don gian', (tester) async {
    await tester.pumpWidget(const StudyFlowApp());

    expect(find.text('StudyFlow'), findsOneWidget);
    expect(find.text('Material'), findsOneWidget);
    expect(find.text('Cupertino'), findsOneWidget);
    expect(find.text('Công việc (1/3)'), findsOneWidget);
  });
}
