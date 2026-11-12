import 'package:flutter_test/flutter_test.dart';

import 'package:scholarship_app/main.dart';

void main() {
  testWidgets('home connects to profile and returns scholarship selection', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Pencarian Beasiswa'), findsOneWidget);
    await tester.tap(find.byTooltip('Profil'));
    await tester.pumpAndSettle();

    expect(find.text('Program Studi'), findsOneWidget);
    await tester.tap(find.text('Kembali ke Beranda'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('KIP Kuliah'));
    await tester.pumpAndSettle();

    expect(find.text('Detail Beasiswa'), findsOneWidget);
    expect(find.text('KIP Kuliah'), findsOneWidget);
    await tester.tap(find.text('Pilih Beasiswa'));
    await tester.pumpAndSettle();

    expect(find.text('Beasiswa dipilih: KIP Kuliah'), findsOneWidget);
  });
}
