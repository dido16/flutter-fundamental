import 'package:flutter/material.dart';

/// Widget kecil untuk menampilkan nilai Rating produk dengan ikon bintang
class RatingBadge extends StatelessWidget {
  final double rating;
  final bool showLabel;

  const RatingBadge({
    super.key,
    required this.rating,
    this.showLabel = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.amber.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.amber.shade300, width: 0.8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.star_rounded,
            color: Color(0xFFF59E0B),
            size: 16,
          ),
          const SizedBox(width: 3),
          Text(
            rating.toStringAsFixed(1),
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0xFFB45309),
            ),
          ),
          if (showLabel) ...[
            const SizedBox(width: 4),
            Text(
              "Rating",
              style: TextStyle(
                fontSize: 11,
                color: Colors.amber.shade800,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
