import 'package:flutter/material.dart';
import 'package:jelita_w4s3/catalog/add_product_page.dart';
import 'package:jelita_w4s3/catalog/cart_badge.dart';
import 'package:jelita_w4s3/catalog/produk.dart';
import 'package:jelita_w4s3/catalog/product_detail_page.dart';
import 'package:jelita_w4s3/catalog/profile_tab.dart';
import 'package:jelita_w4s3/catalog/product_card.dart';

/// Halaman utama Mini Katalog: BottomNavigationBar (Daftar Produk | Profil).
/// State (daftar produk & jumlah keranjang) disimpan di sini dan diubah
/// dengan setState(), lalu dibagikan ke tab dan halaman lain.
class CatalogAppPage extends StatefulWidget {
  const CatalogAppPage({super.key});

  @override
  State<CatalogAppPage> createState() => _CatalogAppPageState();
}

class _CatalogAppPageState extends State<CatalogAppPage> {
  int _tabTerpilih = 0;
  int _jumlahKeranjang = 0;
  final List<Produk> _produk = List.of(produkAwal);

  void _tambahKeranjang() {
    setState(() {
      _jumlahKeranjang++;
    });
  }

  Future<void> _bukaFormTambah() async {
    final messenger = ScaffoldMessenger.of(context);
    final hasil = await Navigator.push<Produk>(
      context,
      MaterialPageRoute(builder: (_) => const AddProductPage()),
    );
    if (hasil != null) {
      setState(() {
        _produk.add(hasil);
      });
      messenger.showSnackBar(
        SnackBar(content: Text('${hasil.nama} berhasil ditambahkan')),
      );
    }
  }

  void _konfirmasiHapus(int index) {
    final messenger = ScaffoldMessenger.of(context);
    final produk = _produk[index];
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Hapus Produk?'),
        content: Text('"${produk.nama}" akan dihapus dari daftar.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              setState(() {
                _produk.removeAt(index);
              });
              messenger.showSnackBar(
                SnackBar(content: Text('${produk.nama} telah dihapus')),
              );
            },
            child: const Text('Hapus'),
          ),
        ],
      ),
    );
  }

  void _bukaDetail(Produk produk) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ProductDetailPage(
          produk: produk,
          onTambahKeranjang: _tambahKeranjang,
        ),
      ),
    );
  }

  Widget _daftarProduk() {
    if (_produk.isEmpty) {
      return const Center(child: Text('Belum ada produk'));
    }
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: _produk.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.0,
      ),
      itemBuilder: (context, index) {
        final p = _produk[index];
        return ProductCard(
          nama: p.nama,
          harga: p.harga,
          icon: p.icon,
          onTap: () => _bukaDetail(p),
          onDelete: () => _konfirmasiHapus(index),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final halaman = [
      _daftarProduk(),
      ProfileTab(jumlahKeranjang: _jumlahKeranjang),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(_tabTerpilih == 0 ? 'Katalog Produk' : 'Profil'),
        actions: [CartBadge(jumlah: _jumlahKeranjang)],
      ),
      body: halaman[_tabTerpilih],
      floatingActionButton: _tabTerpilih == 0
          ? FloatingActionButton(
              onPressed: _bukaFormTambah,
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabTerpilih,
        onTap: (index) {
          setState(() {
            _tabTerpilih = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront),
            label: 'Produk',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
