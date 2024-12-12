import 'package:flutter/material.dart';

class RiwayatPesananPage extends StatelessWidget {
  const RiwayatPesananPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riwayat Pesanan"), // Menampilkan judul AppBar "Riwayat Pesanan"
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0), // Menambahkan padding di sekitar ListView
        children: const [
          // Pesanan pertama
          ListTile(
            leading: Icon(Icons.receipt_long, color: Colors.blue), // Ikon untuk menandakan pesanan
            title: Text("Pelanggan: Antonio"), // Menampilkan nama pelanggan
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Menyusun teks subtitle di kiri
              children: [
                Text("Nomor Meja: 5"), // Menampilkan nomor meja
                Text("Pesanan: Nasi Goreng, Es Teh"), // Menampilkan menu pesanan
                Text("Tanggal: 2023-11-01"), // Menampilkan tanggal pesanan
              ],
            ),
            isThreeLine: true, // Mengizinkan subtitle untuk menampilkan 3 baris teks
          ),
          Divider(), // Garis pembatas antara pesanan

          // Pesanan kedua
          ListTile(
            leading: Icon(Icons.receipt_long, color: Colors.blue), // Ikon untuk menandakan pesanan
            title: Text("Pelanggan: Budi"), // Menampilkan nama pelanggan
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Menyusun teks subtitle di kiri
              children: [
                Text("Nomor Meja: 3"), // Menampilkan nomor meja
                Text("Pesanan: Ayam Bakar, Jus Jeruk"), // Menampilkan menu pesanan
                Text("Tanggal: 2023-11-02"), // Menampilkan tanggal pesanan
              ],
            ),
            isThreeLine: true, // Mengizinkan subtitle untuk menampilkan 3 baris teks
          ),
          Divider(), // Garis pembatas antara pesanan

          // Pesanan ketiga
          ListTile(
            leading: Icon(Icons.receipt_long, color: Colors.blue), // Ikon untuk menandakan pesanan
            title: Text("Pelanggan: Siti"), // Menampilkan nama pelanggan
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Menyusun teks subtitle di kiri
              children: [
                Text("Nomor Meja: 8"), // Menampilkan nomor meja
                Text("Pesanan: Sate Ayam, Es Kopi"), // Menampilkan menu pesanan
                Text("Tanggal: 2023-11-03"), // Menampilkan tanggal pesanan
              ],
            ),
            isThreeLine: true, // Mengizinkan subtitle untuk menampilkan 3 baris teks
          ),
          Divider(), // Garis pembatas terakhir
        ],
      ),
    );
  }
}
