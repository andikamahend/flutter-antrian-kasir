import 'package:flutter/material.dart';
import '../models/receipt_model.dart';

class ReceiptPage extends StatelessWidget {
  final Receipt receipt;
  static int _queueNumber = 1; // Nomor antrian yang dimulai dari 1

  const ReceiptPage({super.key, required this.receipt});

  // Fungsi untuk mendapatkan nomor antrian dengan format 2 digit
  String getQueueNumber() {
    String queueNumber = _queueNumber.toString().padLeft(2, '0'); // Format dua digit
    _queueNumber++; // Meningkatkan nomor antrian setelah setiap penggunaan
    return queueNumber;
  }

  // Fungsi untuk mencetak struk (simulasi)
  void _printReceipt(BuildContext context) {
    // Simulasi fungsi cetak, bisa dikembangkan untuk mencetak secara fisik
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Struk sedang dicetak...")),
    );
    // Logika cetak bisa ditambahkan di sini jika terhubung dengan printer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Struk Pesanan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  const Text(
                    'Warmindo 999',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  Text('Nama Pelanggan: ${receipt.customerName}'),
                  Text('Nomor Meja: ${receipt.tableNumber}'),
                  const Divider(),
                  // Menampilkan nomor antrian otomatis dalam format 2 digit
                  Text(
                    'Nomor Antrian: ${getQueueNumber()}',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const Divider(),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Detail Pesanan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: receipt.items.length,
                itemBuilder: (context, index) {
                  final item = receipt.items[index];
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text(
                        'Jumlah: ${item.quantity} x Rp ${item.price.toStringAsFixed(0)}'),
                    trailing: Text(
                        'Rp ${(item.quantity * item.price).toStringAsFixed(0)}'),
                  );
                },
              ),
            ),
            const Divider(),
            Text(
              'Total Harga: Rp ${receipt.totalPrice.toStringAsFixed(0)}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Kembali'),
              ),
            ),
            const SizedBox(height: 16.0), // Spacer for layout
            Center(
              child: ElevatedButton(
                onPressed: () => _printReceipt(context), // Call print function
                child: const Text('Cetak Struk'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
