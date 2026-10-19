import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pml/pages/detail_shoping_screen.dart';
import 'package:pml/pages/shoping_screen.dart';

void main() {
  runApp(const MyApp());
}

// Konfigurasi GoRouter untuk navigasi
final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, _) => const ShopingScreen(),
      routes: [
        GoRoute(
          path: 'detail/:id',
          builder: (context, state) =>
              DetailShopingScreen(id: state.pathParameters['id'] ?? '1'),
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'FoodMart - Marketplace Pemesanan Makanan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF6B00),
          primary: const Color(0xFFFF6B00),
          secondary: const Color(0xFFFF8E3C),
          surface: Colors.white,
        ),
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF1E293B),
          elevation: 0,
        ),
      ),
    );
  }
}
