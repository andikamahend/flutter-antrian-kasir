// models/receipt_model.dart

class ReceiptItem {
  final String name;
  final int quantity;
  final double price;

  ReceiptItem({
    required this.name,
    required this.quantity,
    required this.price,
  });

  // Menghitung total harga per item
  double get totalPrice => quantity * price;
}

class Receipt {
  final String customerName;
  final int tableNumber;
  final List<ReceiptItem> items;

  Receipt({
    required this.customerName,
    required this.tableNumber,
    required this.items,
  });

  // Menghitung total harga seluruh pesanan
  double get totalPrice => items.fold(0.0, (total, item) => total + item.totalPrice);
}
