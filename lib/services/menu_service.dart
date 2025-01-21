// File: services/menu_service.dart

import '../models/menu_model.dart';

class MenuService {
  // Data menu (contoh)
  final List<MenuModel> _menuList = [
    MenuModel(namaMenu: "Ayam Goreng", harga: "15000"),
    MenuModel(namaMenu: "Nasi Goreng", harga: "12000"),
    MenuModel(namaMenu: "Soto Ayam", harga: "7000"),
    MenuModel(namaMenu: "Es Teh", harga: "3000"),
    MenuModel(namaMenu: "Es Jeruk", harga: "3000"),
  ];

  // Mendapatkan semua menu
  List<MenuModel> getMenuList() {
    return _menuList;
  }

  // Memperbarui menu berdasarkan indeks
  void updateMenu(int index, MenuModel updatedMenu) {
    if (index >= 0 && index < _menuList.length) {
      _menuList[index] = updatedMenu;
    }
  }
}
