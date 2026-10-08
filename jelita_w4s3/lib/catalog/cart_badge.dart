import 'package:flutter/material.dart';

/// Ikon keranjang dengan badge angka (Stack + Positioned, lihat W4S2 2.11).
class CartBadge extends StatelessWidget {
  final int jumlah;
  final VoidCallback? onTap;

  const CartBadge({super.key, required this.jumlah, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: InkWell(
        onTap: onTap,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            const Icon(Icons.shopping_cart, size: 30),
            if (jumlah > 0)
              Positioned(
                top: -6,
                right: -6,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.red,
                  child: Text(
                    '$jumlah',
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
