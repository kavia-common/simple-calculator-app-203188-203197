import 'package:flutter_test/flutter_test.dart';
import 'package:calculator_mobile_frontend/main.dart';

void main() {
  testWidgets('Shows calculator title and display', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Calculator'), findsOneWidget);
    expect(find.byKey(const Key('calc_display')), findsOneWidget);
    expect(find.text('0'), findsOneWidget);
  });

  testWidgets('Performs a basic addition: 7 + 8 = 15', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byKey(const Key('btn_7')));
    await tester.tap(find.byKey(const Key('btn_plus')));
    await tester.tap(find.byKey(const Key('btn_8')));
    await tester.tap(find.byKey(const Key('btn_equals')));
    await tester.pump();

    expect(find.text('15'), findsOneWidget);
  });

  testWidgets('Handles clear (C) resetting the display to 0', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byKey(const Key('btn_9')));
    await tester.tap(find.byKey(const Key('btn_clear')));
    await tester.pump();

    expect(find.text('0'), findsOneWidget);
  });
}
