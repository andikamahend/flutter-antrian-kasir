// File: models/order_model.dart

class OrderItem {
  final String name;
  final int quantity;
  final double price;

  OrderItem({
    required this.name,
    required this.quantity,
    required this.price,
  });
}

class Order {
  final String customerName;
  final int tableNumber;
  final List<OrderItem> items;

  Order({
    required this.customerName,
    required this.tableNumber,
    required this.items,
  });

  // Menghitung total harga pesanan
  double getTotalPrice() {
    return items.fold(0.0, (total, item) => total + (item.quantity * item.price));
  }
}
