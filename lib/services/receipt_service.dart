// services/receipt_service.dart

import '../models/receipt_model.dart';

class ReceiptService {
  // Fungsi untuk menghasilkan struk berdasarkan input pelanggan
  Receipt generateReceipt(String customerName, int tableNumber, List<ReceiptItem> items) {
    return Receipt(
      customerName: customerName,
      tableNumber: tableNumber,
      items: items,
    );
  }
}
