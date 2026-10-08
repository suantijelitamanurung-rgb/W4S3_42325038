import 'package:flutter/material.dart';

class Produk {
  final String nama;
  final int harga;
  final IconData icon;

  const Produk({
    required this.nama,
    required this.harga,
    this.icon = Icons.inventory_2,
  });
}

const List<Produk> produkAwal = [
  Produk(nama: 'Kursi Minimalis', harga: 350000, icon: Icons.chair),
  Produk(nama: 'Meja Kerja Kayu', harga: 750000, icon: Icons.table_restaurant),
  Produk(nama: 'Lampu Meja LED', harga: 120000, icon: Icons.lightbulb),
  Produk(nama: 'Sofa Santai', harga: 2500000, icon: Icons.weekend),
  Produk(nama: 'Rak Buku Jati', harga: 900000, icon: Icons.menu_book),
];
