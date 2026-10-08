import 'package:flutter/material.dart';

/// ====== UBAH DATA DIRI DI SINI ======
const String namaMahasiswa = 'Nama Mahasiswa';
const String nimMahasiswa = '0000000000';
const String prodiMahasiswa = 'Program Studi Anda';
const String emailMahasiswa = 'email@contoh.com';
/// ====================================

class ProfileTab extends StatelessWidget {
  final int jumlahKeranjang;
  final int jumlahProduk;

  const ProfileTab({
    super.key,
    required this.jumlahKeranjang,
    this.jumlahProduk = 0,
  });

  @override
  Widget build(BuildContext context) {
    final warna = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      child: Column(
        children: [
          // ---------- Header gradasi + avatar ----------
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 170,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [warna.primary, warna.tertiary],
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36),
                  ),
                ),
              ),
              Positioned(
                bottom: -55,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.2),
                        blurRadius: 14,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 52,
                    backgroundColor: warna.primaryContainer,
                    child: Icon(Icons.person, size: 56, color: warna.primary),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 66),

          // ---------- Nama & NIM ----------
          const Text(
            namaMahasiswa,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
            decoration: BoxDecoration(
              color: warna.primaryContainer,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'NIM $nimMahasiswa',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: warna.onPrimaryContainer,
              ),
            ),
          ),
          const SizedBox(height: 24),

          // ---------- Kartu statistik ----------
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: _KartuStatistik(
                    icon: Icons.shopping_cart,
                    angka: '$jumlahKeranjang',
                    label: 'Item Keranjang',
                    warna: Colors.orange,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _KartuStatistik(
                    icon: Icons.inventory_2,
                    angka: '$jumlahProduk',
                    label: 'Total Produk',
                    warna: Colors.teal,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // ---------- Kartu informasi ----------
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Card(
              elevation: 0,
              color: Colors.grey[100],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                children: [
                  _BarisInfo(
                    icon: Icons.school,
                    judul: 'Program Studi',
                    isi: prodiMahasiswa,
                  ),
                  Divider(height: 1, indent: 16, endIndent: 16),
                  _BarisInfo(
                    icon: Icons.email,
                    judul: 'Email',
                    isi: emailMahasiswa,
                  ),
                  Divider(height: 1, indent: 16, endIndent: 16),
                  _BarisInfo(
                    icon: Icons.menu_book,
                    judul: 'Mata Kuliah',
                    isi: 'Pengembangan Aplikasi Mobile',
                  ),
                  Divider(height: 1, indent: 16, endIndent: 16),
                  _BarisInfo(
                    icon: Icons.flag,
                    judul: 'Tugas',
                    isi: 'Mini Katalog Produk - W4S3',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

/// Kartu kecil berisi ikon, angka besar, dan keterangan.
class _KartuStatistik extends StatelessWidget {
  final IconData icon;
  final String angka;
  final String label;
  final Color warna;

  const _KartuStatistik({
    required this.icon,
    required this.angka,
    required this.label,
    required this.warna,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: warna.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: warna.withValues(alpha: 0.25),
            child: Icon(icon, color: warna),
          ),
          const SizedBox(height: 10),
          Text(
            angka,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(fontSize: 12, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }
}

/// Satu baris informasi: ikon di kiri, judul kecil dan isi di kanan.
class _BarisInfo extends StatelessWidget {
  final IconData icon;
  final String judul;
  final String isi;

  const _BarisInfo({
    required this.icon,
    required this.judul,
    required this.isi,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
      title: Text(
        judul,
        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
      ),
      subtitle: Text(
        isi,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }
}
