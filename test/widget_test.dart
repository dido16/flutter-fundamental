import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pml/main.dart';

class _CustomHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (cert, host, port) => true;
  }
}

void main() {
  setUpAll(() {
    HttpOverrides.global = _CustomHttpOverrides();
  });

  testWidgets('Aplikasi FoodMart memuat daftar menu dan identitas mahasiswa',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump();

    // Memverifikasi judul aplikasi FoodMart
    expect(find.text('FoodMart'), findsOneWidget);

    // Memverifikasi salah satu menu makanan muncul pada GridView
    expect(find.text('Ayam Goreng Krispi'), findsOneWidget);

    // Scroll sampai ke footer yang berisi identitas mahasiswa
    final footerFinder = find.text('Dido Fajar Satria');
    await tester.scrollUntilVisible(
      footerFinder,
      300,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.pumpAndSettle();

    // Memverifikasi nama dan NIM di footer
    expect(footerFinder, findsOneWidget);
    expect(find.text('NIM: 23.52.0007'), findsOneWidget);
  });
}
