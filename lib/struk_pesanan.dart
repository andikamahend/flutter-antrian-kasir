import 'package:flutter/material.dart';

class StrukPesanan extends StatelessWidget {
  final String customerName;
  final String tableNumber;
  final List<Map<String, dynamic>> orderList;
  final double totalPrice;
  static int orderCounter = 0;

  StrukPesanan({
    super.key,
    required this.customerName,
    required this.tableNumber,
    required this.orderList,
    required this.totalPrice,
  }) {
    orderCounter++; // Increment order number for each new instance
  }

  @override
  Widget build(BuildContext context) {
    final String orderNumber = orderCounter.toString();
    final String dateTime = '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year} ${DateTime.now().hour}:${DateTime.now().minute}';

    return Scaffold(
      appBar: AppBar(title: const Text('Struk Pesanan')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('No. Pesanan: $orderNumber'),
              Text('Tanggal: $dateTime'),
              const SizedBox(height: 16.0),
              Text('Nama Pelanggan: $customerName'),
              Text('Nomor Meja: $tableNumber'),
              const SizedBox(height: 16.0),
              const Text('Pesanan:', style: TextStyle(fontWeight: FontWeight.bold)),
              ...orderList.map((item) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${item['name']} x ${item['quantity']}'),
                        Text('Rp ${(item['quantity'] * item['price']).toStringAsFixed(0)}'),
                      ],
                    ),
                  )),
              const Divider(thickness: 1.0, height: 32.0),
              Text('Total Harga: Rp ${totalPrice.toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Placeholder for printing logic
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Struk berhasil dicetak!')),
                      );
                    },
                    child: const Text('Cetak'),
                  ),
                  ElevatedButton(
                    onPressed: () {
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
