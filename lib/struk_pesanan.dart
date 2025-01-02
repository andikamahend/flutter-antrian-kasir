import 'package:flutter/material.dart';

// Halaman untuk menampilkan struk pesanan pelanggan
class StrukPesanan extends StatelessWidget {
  // Deklarasi variabel yang dibutuhkan
  final String customerName; // Nama pelanggan
  final String tableNumber; // Nomor meja
  final List<Map<String, dynamic>> orderList; // Daftar pesanan
  final double totalPrice; // Total harga pesanan
  static int orderCounter = 0; // Menghitung jumlah pesanan

  // Konstruktor untuk menerima data pesanan
  StrukPesanan({
    super.key,
    required this.customerName,
    required this.tableNumber,
    required this.orderList,
    required this.totalPrice,
  }) {
    orderCounter++; // Increment nomor pesanan untuk setiap instance baru
  }

  @override
  Widget build(BuildContext context) {
    // Membuat nomor pesanan dan timestamp
    final String orderNumber = orderCounter.toString(); // Nomor pesanan
    final String dateTime = '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year} ${DateTime.now().hour}:${DateTime.now().minute}'; // Waktu pesanan

    return Scaffold(
      // Header halaman
      appBar: AppBar(title: const Text('Struk Pesanan')),

      // Isi halaman
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey), // Border abu-abu
            borderRadius: BorderRadius.circular(8.0), // Sudut membulat
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Menampilkan nomor pesanan dan waktu
              Text('No. Pesanan: $orderNumber'),
              Text('Tanggal: $dateTime'),
              const SizedBox(height: 16.0),

              // Informasi pelanggan
              Text('Nama Pelanggan: $customerName'),
              Text('Nomor Meja: $tableNumber'),
              const SizedBox(height: 16.0),

              // Daftar pesanan
              const Text('Pesanan:', style: TextStyle(fontWeight: FontWeight.bold)),
              ...orderList.map((item) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${item['name']} x ${item['quantity']}'), // Nama dan jumlah item
                        Text('Rp ${(item['quantity'] * item['price']).toStringAsFixed(0)}'), // Harga total per item
                      ],
                    ),
                  )),
              const Divider(thickness: 1.0, height: 32.0), // Garis pemisah

              // Total harga
              Text('Total Harga: Rp ${totalPrice.toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 16.0),

              // Tombol aksi untuk cetak struk dan tambah pesanan
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Tombol Cetak
                  ElevatedButton(
                    onPressed: () {
                      // Placeholder untuk logika cetak struk
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Struk berhasil dicetak!')),
                      );
                    },
                    child: const Text('Cetak'),
                  ),

                  // Tombol Tambah Pesanan
                  ElevatedButton(
                    onPressed: () {
                      // Navigasi kembali ke halaman tambah pesanan
                      Navigator.pushNamed(context, '/tambahPesanan');
                    },
                    child: const Text('Tambah Pesanan'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
