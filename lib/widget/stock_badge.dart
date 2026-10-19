import 'package:flutter/material.dart';

/// Widget kecil untuk menampilkan status ketersediaan stok produk
class StockBadge extends StatelessWidget {
  final int stok;

  const StockBadge({super.key, required this.stok});

  @override
  Widget build(BuildContext context) {
    final bool isLowStock = stok <= 8;
    final Color bgColor =
        isLowStock ? const Color(0xFFFEF2F2) : const Color(0xFFF0FDF4);
    final Color textColor =
        isLowStock ? const Color(0xFFDC2626) : const Color(0xFF16A34A);
    final Color borderColor =
        isLowStock ? const Color(0xFFFECACA) : const Color(0xFFBBF7D0);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor, width: 0.8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isLowStock ? Icons.local_fire_department_rounded : Icons.inventory_2_outlined,
            size: 13,
            color: textColor,
          ),
          const SizedBox(width: 3),
          Text(
            isLowStock ? "Sisa $stok" : "Stok: $stok",
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
