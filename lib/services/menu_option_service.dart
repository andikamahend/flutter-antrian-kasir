import '../models/menu_option_model.dart';
import 'package:flutter/material.dart';

class MenuOptionService {
  // Daftar opsi menu
  List<MenuOptionModel> getMenuOptions() {
    return [
      MenuOptionModel(
        title: "Tambah Pesanan",
        icon: Icons.add_shopping_cart,
        color: Colors.blue,
        route: '/tambahPesanan',
      ),
      MenuOptionModel(
        title: "Daftar Antrian",
        icon: Icons.format_list_bulleted,
        color: Colors.green,
        route: '/daftarAntrian',
      ),
      MenuOptionModel(
        title: "Riwayat Pesanan",
        icon: Icons.history,
        color: Colors.orange,
        route: '/riwayat',
      ),
      MenuOptionModel(
        title: "Tambah Menu",
        icon: Icons.create,
        color: Colors.blue,
        route: '/tambahMenu',
      ),
      MenuOptionModel(
        title: "Pengaturan Akun",
        icon: Icons.person,
        color: Colors.purple,
        route: '/akun',
      ),
      MenuOptionModel(
        title: "Daftar Menu", // Menu baru untuk daftar menu
        icon: Icons.menu,
        color: Colors.indigo,
        route: '/daftarMenu',
      ),
    ];
  }
}