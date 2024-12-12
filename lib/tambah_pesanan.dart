import 'package:antriankasir/struk_pesanan.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key, required List menuItems});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final TextEditingController _customerNameController = TextEditingController();
  final TextEditingController _tableNumberController = TextEditingController();
  final TextEditingController _itemQuantityController = TextEditingController();
  final TextEditingController _itemPriceController = TextEditingController();

  String? _selectedItem; // Menyimpan item yang dipilih
  final List<Map<String, dynamic>> _menuItems = [
    {"name": "Nasi Goreng", "price": 20000},
    {"name": "Mie Goreng", "price": 18000},
    {"name": "Ayam Goreng", "price": 25000},
    {"name": "Es Teh", "price": 5000},
    {"name": "Es Jeruk", "price": 7000},
  ]; // Daftar menu

  final List<Map<String, dynamic>> _orderList = [];
  double _totalPrice = 0.0;
  
  get customerName => null;
  
  get tableNumber => null;

  void _addItemToOrder() {
    if (_selectedItem != null) {
      final quantity = int.tryParse(_itemQuantityController.text) ?? 0;
      final price = double.tryParse(_itemPriceController.text) ?? 0.0;

      if (quantity > 0 && price > 0) {
        setState(() {
          _orderList.add({
            'name': _selectedItem,
            'quantity': quantity,
            'price': price,
          });
          _totalPrice += quantity * price;

          // Clear fields after adding
          _itemQuantityController.clear();
          _itemPriceController.clear();
          _selectedItem = null; // Reset dropdown
        });
      }
    }
  }

  // ignore: unused_element
  void _saveOrder() {
    // Save order logic
    // ignore: avoid_print
    print('Order saved: $_orderList');
  }

  // Update price field based on selected item
  void _updatePrice() {
    if (_selectedItem != null) {
      final selectedItem = _menuItems.firstWhere(
        (item) => item['name'] == _selectedItem,
        orElse: () => {'price': 0.0}, // Default value if not found
      );
      _itemPriceController.text = selectedItem['price'].toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Pesanan'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nama Pelanggan
            TextField(
              controller: _customerNameController,
              decoration: const InputDecoration(
                labelText: 'Nama Pelanggan',
              ),
            ),
            const SizedBox(height: 16.0),

            // Nomor Meja
            TextField(
              controller: _tableNumberController,
              decoration: const InputDecoration(
                labelText: 'Nomor Meja',
              ),
            ),
            const SizedBox(height: 16.0),

            // Tambah Item Pesanan
            const Text(
              'Tambah Item Pesanan',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),

            // Dropdown untuk memilih item
            DropdownButtonFormField<String>(
              value: _selectedItem,
              hint: const Text('Pilih Menu'),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                border: const OutlineInputBorder(),
              ),
              items: _menuItems.map((item) {
                return DropdownMenuItem<String>(
                  value: item['name'], // Set value to item name
                  child: Text(item['name']),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedItem = value;
                });
                _updatePrice(); // Update the price when item is selected
              },
            ),
            const SizedBox(height: 8.0),

            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _itemQuantityController,
                    decoration: const InputDecoration(
                      labelText: 'Jumlah',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextField(
                    controller: _itemPriceController,
                    decoration: const InputDecoration(
                      labelText: 'Harga per Item',
                    ),
                    keyboardType: TextInputType.number,
                    readOnly: true, // Make the price field read-only
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),

            // Tombol Tambahkan Item
            ElevatedButton(
              onPressed: _addItemToOrder,
              child: const Text('Tambahkan Item'),
            ),
            const SizedBox(height: 16.0),

            // Daftar Pesanan
            const Text(
              'Daftar Pesanan',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _orderList.length,
              itemBuilder: (context, index) {
                final item = _orderList[index];
                return ListTile(
                  title: Text(item['name']),
                  subtitle: Text(
                      'Jumlah: ${item['quantity']} x Rp ${item['price'].toStringAsFixed(0)}'),
                  trailing: Text(
                      'Rp ${(item['quantity'] * item['price']).toStringAsFixed(0)}'),
                );
              },
            ),
            const SizedBox(height: 16.0),

            // Total Harga
            Text(
              'Total Harga: Rp ${_totalPrice.toStringAsFixed(0)}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),


            // Tombol Simpan Pesanan
            ElevatedButton(
              onPressed: () {
                // Navigate to StrukPesanan page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StrukPesanan(
                      customerName: _customerNameController.text,
                      tableNumber: _tableNumberController.text,
                      orderList: _orderList,
                      totalPrice: _totalPrice,
                    ),
                  ),
                );
              },
              child: const Text('Proses Pesanan'),
            ),
          ],
        ),
      ),
    );
  }
}
