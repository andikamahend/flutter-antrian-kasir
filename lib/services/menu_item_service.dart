import '../models/menu_item_model.dart';

class MenuItemService {
  // Simulasi data menu
  // ignore: prefer_final_fields
  List<MenuItemModel> _menuItems = [
    MenuItemModel(
      id: '1',
      name: 'Ayam Goreng',
      price: 15000.0,
    ),
    MenuItemModel(
      id: '2',
      name: 'Nasi Goreng',
      price: 12000.0,
    ),
    MenuItemModel(
      id: '3',
      name: 'Soto Ayam',
      price: 7000.0,
    ),
    MenuItemModel(
      id: '4',
      name: 'Es Teh',
      price: 3000.0,
    ),
    MenuItemModel(
      id: '5',
      name: 'Es Jeruk',
      price: 3000.0,
    ),
    // Tambahkan item menu lain sesuai kebutuhan
  ];

  List<MenuItemModel> getMenuItems() {
    return _menuItems;
  }

// Anda bisa menambahkan metode lain seperti addMenuItem, updateMenuItem, deleteMenuItem di sini
}