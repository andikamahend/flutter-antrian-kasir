import 'package:flutter/material.dart';
import '../models/menu_item_model.dart';
import '../services/menu_item_service.dart';

class DaftarMenuPage extends StatelessWidget {
  const DaftarMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final MenuItemService menuItemService = MenuItemService();
    final List<MenuItemModel> menuItems = menuItemService.getMenuItems();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Menu"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final menuItem = menuItems[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              leading: Image.asset(
                menuItem.imageUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(menuItem.name),
              subtitle: Text('${menuItem.description} - Rp${menuItem.price.toStringAsFixed(0)}'),
              onTap: () {
                // Implementasi untuk menampilkan detail menu atau untuk mengedit menu
                _showMenuItemDetails(context, menuItem);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigasi ke halaman untuk menambahkan menu baru
          Navigator.pushNamed(context, '/tambahMenu');
        },
        // ignore: sort_child_properties_last
        child: const Icon(Icons.add),
        tooltip: 'Tambah Menu',
      ),
    );
  }

  // Metode untuk menampilkan detail menu dalam dialog
  void _showMenuItemDetails(BuildContext context, MenuItemModel menuItem) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(menuItem.name),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                menuItem.imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 10),
              Text('Harga: Rp${menuItem.price.toStringAsFixed(0)}'),
              Text('Deskripsi: ${menuItem.description}'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Tutup'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}