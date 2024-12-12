// ignore_for_file: library_private_types_in_public_api

import 'package:antriankasir/tambah_menu.dart';
import 'package:flutter/material.dart';
// Pastikan file ini sudah sesuai dengan lokasi Anda

class ListMenuPage extends StatefulWidget {
  const ListMenuPage({super.key});

  @override
  _ListMenuPageState createState() => _ListMenuPageState();
}

class _ListMenuPageState extends State<ListMenuPage> {
  final List<Map<String, dynamic>> menuList = [
    {"name": "Nasi Goreng", "price": 20000},
    {"name": "Mie Goreng", "price": 18000},
    {"name": "Ayam Goreng", "price": 25000},
    {"name": "Es Teh", "price": 5000},
    {"name": "Es Jeruk", "price": 7000},
  ];

  void _addNewMenu(Map<String, dynamic> newMenu) {
    setState(() {
      menuList.add(newMenu);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tabel Menu"),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              final newMenu = await Navigator.push(
                context,
                // ignore: prefer_const_constructors
                MaterialPageRoute(builder: (context) => UploadMenuPage()),
              );
              if (newMenu != null) {
                _addNewMenu(newMenu);
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: menuList.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            final menu = menuList[index];
            return ListTile(
              leading: const Icon(Icons.restaurant_menu, color: Colors.green),
              title: Text(menu["name"]),
              trailing: Text(
                "Rp ${menu["price"]}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            );
          },
        ),
      ),
    );
  }
}