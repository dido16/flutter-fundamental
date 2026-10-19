import 'package:flutter/material.dart';

/// Widget pilihan kategori makanan yang interaktif
class CategoryChipsWidget extends StatelessWidget {
  final String selectedCategory;
  final ValueChanged<String> onSelected;

  const CategoryChipsWidget({
    super.key,
    required this.selectedCategory,
    required this.onSelected,
  });

  static const List<Map<String, dynamic>> categories = [
    {"name": "Semua", "icon": Icons.lunch_dining_rounded},
    {"name": "Makanan", "icon": Icons.ramen_dining_rounded},
    {"name": "Minuman", "icon": Icons.local_cafe_rounded},
    {"name": "Camilan", "icon": Icons.cookie_rounded},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final cat = categories[index];
          final isSelected = selectedCategory == cat["name"];

          return InkWell(
            onTap: () => onSelected(cat["name"] as String),
            borderRadius: BorderRadius.circular(12),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFFFF6B00)
                    : const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFFFF6B00)
                      : const Color(0xFFE2E8F0),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    cat["icon"] as IconData,
                    size: 16,
                    color: isSelected ? Colors.white : const Color(0xFF64748B),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    cat["name"] as String,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.w500,
                      color:
                          isSelected ? Colors.white : const Color(0xFF475569),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
