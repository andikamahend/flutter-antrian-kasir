import '../models/menu_item_model.dart';

class MenuItemService {
  // Simulasi data menu
  // ignore: prefer_final_fields
  List<MenuItemModel> _menuItems = [
    MenuItemModel(
      id: '1',
      name: 'Ayam Goreng',
      description: 'Ayam yang digoreng hingga kecokelatan',
      price: 15000.0,
      imageUrl: 'images/ayam_goreng.jpg',
    ),
    MenuItemModel(
      id: '2',
      name: 'Nasi Goreng',
      description: 'Nasi yang digoreng dengan bumbu spesial',
      price: 12000.0,
      imageUrl: 'images/nasi_goreng.jpg',
    ),
    MenuItemModel(
      id: '3',
      name: 'Soto Ayam',
      description: 'Sup ayam dengan rempah-rempah tradisional',
      price: 7000.0,
      imageUrl: 'images/soto.jpeg',
    ),
    MenuItemModel(
      id: '4',
      name: 'Es Teh',
      description: 'Es Teh dengan gula asli',
      price: 3000.0,
      imageUrl: 'images/Es_Teh.jpg',
    ),
    MenuItemModel(
      id: '5',
      name: 'Es Jeruk',
      description: 'Es Jeruk dengan jeruk segar',
      price: 3000.0,
      imageUrl: 'images/Es_jeruk.jpg',
    ),
    // Tambahkan item menu lain sesuai kebutuhan
  ];

  List<MenuItemModel> getMenuItems() {
    return _menuItems;
  }

// Anda bisa menambahkan metode lain seperti addMenuItem, updateMenuItem, deleteMenuItem di sini
}