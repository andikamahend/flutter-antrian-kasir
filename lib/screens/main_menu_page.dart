import 'package:flutter/material.dart';
import '../services/menu_option_service.dart';
import '../models/menu_option_model.dart';

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final MenuOptionService menuOptionService = MenuOptionService();
    final List<MenuOptionModel> menuOptions = menuOptionService.getMenuOptions();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu Utama"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),

          // Profil dan judul
          const Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('images/Ayam_goreng.jpg'),
                ),
                SizedBox(height: 10),
                Text(
                  "Warmindo 999",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  "Menu Kasir",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // Daftar menu
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: menuOptions.length,
              itemBuilder: (context, index) {
                final menu = menuOptions[index];
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, menu.route);
                  },
                  child: Card(
                    child: ListTile(
                      leading: Icon(menu.icon, color: menu.color),
                      title: Text(menu.title),
                    ),
                  ),
                );
              },
            ),
          ),

          // Tombol Logout
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                backgroundColor: Colors.red,
                foregroundColor: Colors.black,
              ),
              child: const Text("Logout"),
            ),
          ),
        ],
      ),
    );
  }
}