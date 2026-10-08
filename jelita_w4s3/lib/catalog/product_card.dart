import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String nama;
  final int harga;
  final VoidCallback onTap;

  // Parameter opsional (tambahan untuk tugas studi kasus).
  final IconData icon;
  final VoidCallback? onDelete;

  const ProductCard({
    super.key,
    required this.nama,
    required this.harga,
    required this.onTap,
    this.icon = Icons.chair,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, size: 40, color: Colors.deepPurple),
                if (onDelete != null)
                  InkWell(
                    onTap: onDelete,
                    child: const Icon(Icons.delete_outline, color: Colors.red),
                  ),
              ],
            ),
            const Spacer(),
            Text(
              nama,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(
              'Rp $harga',
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
