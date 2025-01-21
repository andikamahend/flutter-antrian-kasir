import 'package:flutter/material.dart';
import '../services/riwayat_pesanan_service.dart';
import '../models/riwayat_pesanan_model.dart';

class RiwayatPesananPage extends StatelessWidget {
  const RiwayatPesananPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RiwayatPesananService riwayatService = RiwayatPesananService();
    final List<RiwayatPesananModel> riwayatPesanan = riwayatService.getRiwayatPesanan();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Riwayat Pesanan"),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemCount: riwayatPesanan.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final pesanan = riwayatPesanan[index];
          return ListTile(
            leading: const Icon(Icons.receipt_long, color: Colors.blue),
            title: Text("Pelanggan: ${pesanan.pelanggan}"),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Nomor Meja: ${pesanan.nomorMeja}"),
                Text("Pesanan: ${pesanan.pesanan}"),
                Text("Tanggal: ${pesanan.tanggal}"),
                Text("Nomor Antrian: ${pesanan.nomorPesanan}"),
                Text("Total Harga: ${pesanan.totalHarga}"),
              ],
            ),
            isThreeLine: true,
            trailing: ElevatedButton(
              onPressed: () {
                // Fungsi untuk mencetak struk
                _cetakStruk(context, pesanan);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text("Cetak Struk"),
            ),
          );
        },
      ),
    );
  }

  void _cetakStruk(BuildContext context, RiwayatPesananModel pesanan) {
    // Contoh implementasi cetak struk
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Cetak Struk"),
          content: Text(
            // ignore: prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation
            "Pelanggan: ${pesanan.pelanggan}\n" +
            "Nomor Meja: ${pesanan.nomorMeja}\n" +
            "Pesanan: ${pesanan.pesanan}\n" +
            "Tanggal: ${pesanan.tanggal}\n"
            "Nomor Antrian: ${pesanan.nomorPesanan}\n"
            "Total Harga: ${pesanan.totalHarga}\n"

          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
