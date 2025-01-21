// File: services/order_service.dart

import '../models/order_model.dart';

class OrderService {
  final List<Order> _orderHistory = []; // Riwayat pesanan

  // Simpan pesanan
  void saveOrder(Order order) {
    _orderHistory.add(order);
  }

  // Mendapatkan riwayat pesanan
  List<Order> getOrderHistory() {
    return _orderHistory;
  }
}
