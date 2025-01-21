// File: services/menu_service.dart

import '../models/tambah_menu_model.dart';

class MenuService {
  final List<MenuModel> _menuList = []; // Daftar menu (contoh)

  // Tambahkan menu baru ke daftar
  void uploadMenu(MenuModel menu) {
    _menuList.add(menu);
  }

  // Dapatkan daftar menu
  List<MenuModel> getMenuList() {
    return _menuList;
  }
}
