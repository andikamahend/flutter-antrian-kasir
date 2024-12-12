import 'package:flutter/material.dart';

class StrukPesanan extends StatelessWidget {
  final String customerName;
  final String tableNumber;
  final List<Map<String, dynamic>> orderList;
  final double totalPrice;

  const StrukPesanan({
    super.key,
    required this.customerName,
    required this.tableNumber,
    required this.orderList,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Struk Pesanan')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama Pelanggan: $customerName'),
            Text('Nomor Meja: $tableNumber'),
            const SizedBox(height: 16.0),
            const Text('Pesanan:', style: TextStyle(fontWeight: FontWeight.bold)),
            ...orderList.map((item) => Text(
                '${item['name']} x ${item['quantity']} = Rp ${(item['quantity'] * item['price']).toStringAsFixed(0)}')),
            const SizedBox(height: 16.0),
            Text('Total Harga: Rp ${totalPrice.toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
