import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pml/domain/barang.dart';
import 'package:pml/widget/rating_badge.dart';
import 'package:pml/widget/stock_badge.dart';

/// Widget Kartu Produk untuk tampilan GridView ala marketplace pemesanan makanan
/// Mengimplementasikan Hero Animation sesuai referensi Flutter Cookbook:
/// https://docs.flutter.dev/cookbook/navigation/hero-animations
class ItemBarangWidget extends StatelessWidget {
  final Barang barang;

  const ItemBarangWidget({super.key, required this.barang});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(12),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: const Color(0xFFF1F5F9),
          width: 1,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            // Navigasi ke halaman detail produk dengan Hero Animation
            context.push('/detail/${barang.id}');
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bagian Gambar Produk dengan Hero Widget & Rating Overlay
              Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 1.25,
                    child: Hero(
                      // Tag Hero unik berdasarkan ID produk
                      tag: 'hero-product-${barang.id}',
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                        child: Image.network(
                          barang.foto,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              color: const Color(0xFFF8FAFC),
                              child: const Center(
                                child: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Color(0xFFFF6B00),
                                  ),
                                ),
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: const Color(0xFFFFF7ED),
                              child: const Center(
                                child: Icon(
                                  Icons.fastfood_rounded,
                                  size: 40,
                                  color: Color(0xFFFF8E3C),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),

                  // Overlay Rating Badge di pojok kiri atas foto
                  Positioned(
                    top: 8,
                    left: 8,
                    child: RatingBadge(rating: barang.rating),
                  ),
                ],
              ),

              // Bagian Informasi Produk
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Kategori & Stok
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                barang.kategori,
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF94A3B8),
                                  letterSpacing: 0.3,
                                ),
                              ),
                              StockBadge(stok: barang.stok),
                            ],
                          ),
                          const SizedBox(height: 4),

                          // Nama Produk
                          Text(
                            barang.namaBarang,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1E293B),
                            ),
                          ),
                        ],
                      ),

                      // Harga dan Tombol Tambah ke Keranjang
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              barang.formattedHarga,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFFFF6B00),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFF6B00),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.add_rounded,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}