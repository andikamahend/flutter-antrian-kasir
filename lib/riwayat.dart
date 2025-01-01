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
        children: [
          // Pesanan pertama
          ListTile(
            leading: const Icon(Icons.receipt_long, color: Colors.blue), // Ikon untuk menandakan pesanan
            title: const Text("Pelanggan: Antonio"), // Menampilkan nama pelanggan
            subtitle: const Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Menyusun teks subtitle di kiri
              children: [
                Text ("No. Pesanan : 1"), // Menampilkan nomor pesanan
                Text("Tanggal: 01-01-2025 21:08"), // Menampilkan tanggal pesanan
                Text("Nomor Meja: 5"), // Menampilkan nomor meja
                Text("Pesanan: Nasi Goreng x2, Es Teh x2"), // Menampilkan menu pesanan
                Text("Total Harga:Rp 46000"),
              ],
            ),
            isThreeLine: true, // Mengizinkan subtitle untuk menampilkan 3 baris teks
            trailing: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Struk pesanan Antonio dicetak!')),
                );
              },
              child: const Text('Cetak Struk'),
            ),
          ),
          const Divider(), // Garis pembatas antara pesanan

          // Pesanan kedua
          ListTile(
            leading: const Icon(Icons.receipt_long, color: Colors.blue), // Ikon untuk menandakan pesanan
            title: const Text("Pelanggan: Budi"), // Menampilkan nama pelanggan
            subtitle: const Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Menyusun teks subtitle di kiri
              children: [
                Text ("No. Pesanan : 2"), // Menampilkan nomor pesanan
                Text("Tanggal: 01-01-2025 22:08"), // Menampilkan tanggal pesanan
                Text("Nomor Meja: 2"), // Menampilkan nomor meja
                Text("Pesanan: Mie Goreng x2, Es Teh x2"), // Menampilkan menu pesanan
                Text("Total Harga:Rp 42000"),
              ],
            ),
            isThreeLine: true, // Mengizinkan subtitle untuk menampilkan 3 baris teks
            trailing: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Struk pesanan Budi dicetak!')),
                );
              },
              child: const Text('Cetak Struk'),
            ),
          ),
          const Divider(), // Garis pembatas antara pesanan

          // Pesanan ketiga
          ListTile(
            leading: const Icon(Icons.receipt_long, color: Colors.blue), // Ikon untuk menandakan pesanan
            title: const Text("Pelanggan: Siti"), // Menampilkan nama pelanggan
            subtitle: const Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Menyusun teks subtitle di kiri
              children: [
                Text ("No. Pesanan : 3"), // Menampilkan nomor pesanan
                Text("Tanggal: 02-01-2025 09:46"), // Menampilkan tanggal pesanan
                Text("Nomor Meja: 1"), // Menampilkan nomor meja
                Text("Pesanan: Nasi Goreng x3, Es Teh x3"), // Menampilkan menu pesanan
                Text("Total Harga:Rp 66000"),
              ],
            ),
            isThreeLine: true, // Mengizinkan subtitle untuk menampilkan 3 baris teks
            trailing: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Struk pesanan Siti dicetak!')),
                );
              },
              child: const Text('Cetak Struk'),
            ),
          ),
          const Divider(), // Garis pembatas terakhir
        ],
      ),
    );
  }
}
