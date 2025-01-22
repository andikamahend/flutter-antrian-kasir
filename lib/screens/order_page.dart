import 'package:flutter/material.dart';
import '../models/order_model.dart';
import '../models/receipt_model.dart';
import '../services/order_service.dart';
import '../services/receipt_service.dart';
import 'receipt_page.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final TextEditingController _customerNameController = TextEditingController();
  final TextEditingController _tableNumberController = TextEditingController();
  final TextEditingController _itemQuantityController = TextEditingController();
  final TextEditingController _itemPriceController = TextEditingController();

  String? _selectedItem;
  final List<String> _menuItems = ['Ayam Goreng', 'Nasi Goreng', 'Soto', 'Es Teh', 'Es Jeruk'];
  final Map<String, double> _menuPrices = {
    'Ayam Goreng': 15000,
    'Nasi Goreng': 12000,
    'Soto': 7000,
    'Es Teh': 3000,
    'Es Jeruk': 3000,
  };

  final List<OrderItem> _orderItems = [];
  final OrderService _orderService = OrderService();
  final ReceiptService _receiptService = ReceiptService();

  void _addItemToOrder() {
    if (_selectedItem != null) {
      final quantity = int.tryParse(_itemQuantityController.text) ?? 0;
      final price = double.tryParse(_itemPriceController.text) ?? 0.0;

      if (quantity > 0 && price > 0) {
        setState(() {
          _orderItems.add(OrderItem(name: _selectedItem!, quantity: quantity, price: price));
          _itemQuantityController.clear();
          _itemPriceController.clear();
          _selectedItem = null;
        });
      }
    }
  }

  void _saveOrder() {
    final customerName = _customerNameController.text;
    final tableNumber = int.tryParse(_tableNumberController.text) ?? 0;

    if (customerName.isEmpty || tableNumber <= 0 || _orderItems.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Semua kolom harus diisi dan pesanan tidak boleh kosong!")),
      );
      return;
    }

    List<ReceiptItem> receiptItems = _orderItems.map((item) {
      return ReceiptItem(name: item.name, quantity: item.quantity, price: item.price);
    }).toList();

    final receipt = _receiptService.generateReceipt(customerName, tableNumber, receiptItems);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ReceiptPage(receipt: receipt),
      ),
    );

    final order = Order(
      customerName: customerName,
      tableNumber: tableNumber,
      items: _orderItems,
    );
    _orderService.saveOrder(order);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Pesanan berhasil disimpan!")),
    );

    _customerNameController.clear();
    _tableNumberController.clear();
    setState(() {
      _orderItems.clear();
    });
  }

  void _deleteItem(int index) {
    setState(() {
      _orderItems.removeAt(index);
    });
  }

  void _editItem(int index) {
    final item = _orderItems[index];
    _selectedItem = item.name;
    _itemQuantityController.text = item.quantity.toString();
    _itemPriceController.text = item.price.toString();

    setState(() {
      _orderItems.removeAt(index);
    });
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
            TextField(
              controller: _customerNameController,
              decoration: const InputDecoration(labelText: 'Nama Pelanggan'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _tableNumberController,
              decoration: const InputDecoration(labelText: 'Nomor Meja'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            const Text('Tambah Item Pesanan', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
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
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedItem = value;
                  _itemPriceController.text = value != null ? _menuPrices[value]!.toStringAsFixed(0) : '';
                });
              },
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _itemQuantityController,
                    decoration: const InputDecoration(labelText: 'Jumlah'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextField(
                    controller: _itemPriceController,
                    decoration: const InputDecoration(labelText: 'Harga per Item'),
                    keyboardType: TextInputType.number,
                    enabled: false, // Harga otomatis, tidak dapat diedit
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _addItemToOrder,
              child: const Text('Tambahkan Item'),
            ),
            const SizedBox(height: 16.0),
            const Text('Daftar Pesanan', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _orderItems.length,
              itemBuilder: (context, index) {
                final item = _orderItems[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text('Jumlah: ${item.quantity} x Rp ${item.price.toStringAsFixed(0)}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => _editItem(index),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _deleteItem(index),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 16.0),
            Text(
              'Total Harga: Rp ${_orderItems.fold(0.0, (total, item) => total + (item.quantity * item.price)).toStringAsFixed(0)}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _saveOrder,
              child: const Text('Proses Pesanan dan Cetak Struk'),
            ),
          ],
        ),
      ),
    );
  }
}
