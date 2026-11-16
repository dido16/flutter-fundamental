import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. Fungsi utama dengan ProviderScope (Wajib untuk Riverpod)
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

// 2. Kerangka dasar aplikasi
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductScreen(), // Memanggil layar produk
    );
  }
}

// 3. Kode Provider (Dari soal)
final productProvider = FutureProvider<List<String>>((ref) async {
  await Future.delayed(const Duration(seconds: 2));
  return [
    "Laptop",
    "Smartphone",
    "Tablet",
    "Item Dido Fajar Satria - 23.52.0007",
  ];
});

// 4. Kode UI (Sudah diperbaiki dengan asyncProducts.when)
class ProductScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncProducts = ref.watch(productProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Katalog Produk (Dido Fajar Satria)")),
      body: asyncProducts.when(
        data: (products) => ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) => ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: Text(products[index]),
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) =>
            Center(child: Text("Terjadi Kesalahan: $error")),
      ),
    );
  }
}
