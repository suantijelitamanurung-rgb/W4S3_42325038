import 'package:flutter/material.dart';
import 'package:jelita_w4s3/catalog/produk.dart';

/// Halaman detail: data dikirim lewat constructor (W4S3 bagian 4.1).
class ProductDetailPage extends StatelessWidget {
  final Produk produk;
  final VoidCallback onTambahKeranjang;

  const ProductDetailPage({
    super.key,
    required this.produk,
    required this.onTambahKeranjang,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Produk')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 220,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(produk.icon, size: 110, color: Colors.deepPurple),
            ),
            const SizedBox(height: 20),
            Text(
              produk.nama,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Rp ${produk.harga}',
              style: const TextStyle(fontSize: 20, color: Colors.grey),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  onTambahKeranjang();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${produk.nama} ditambahkan ke keranjang'),
                    ),
                  );
                },
                icon: const Icon(Icons.add_shopping_cart),
                label: const Text('Tambah ke Keranjang'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
