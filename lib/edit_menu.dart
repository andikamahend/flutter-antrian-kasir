import 'package:flutter/material.dart';

class EditMenuPage extends StatefulWidget {
  final String namaMenu;
  final String harga;

  const EditMenuPage({
    super.key,
    required this.namaMenu,
    required this.harga,
  });

  @override
  // ignore: library_private_types_in_public_api
  _EditMenuPageState createState() => _EditMenuPageState();
}

class _EditMenuPageState extends State<EditMenuPage> {
  late TextEditingController _namaMenuController;
  late TextEditingController _hargaController;
  String? _selectedMenu;

  @override
  void initState() {
    super.initState();
    _namaMenuController = TextEditingController(text: widget.namaMenu);
    _hargaController = TextEditingController(text: widget.harga);

    // Inisialisasi _selectedMenu berdasarkan widget.namaMenu jika memungkinkan
    // Ini penting agar dropdown menampilkan nilai yang benar saat pertama kali dibuka.
    // Anda perlu logika untuk mencocokkan widget.namaMenu dengan nilai di dropdown.
    // Contoh sederhana (perlu disesuaikan dengan data menu Anda):
    if (widget.namaMenu == 'Nasi Goreng') {
      _selectedMenu = 'Menu 1';
    } else if (widget.namaMenu == 'Mie Ayam') {
      _selectedMenu = 'Menu 2';
    } // ... tambahkan kondisi lain sesuai kebutuhan
    else if(widget.namaMenu == 'Ayam Goreng'){
      _selectedMenu = 'Menu 3';
    }
    else if(widget.namaMenu == 'Es Teh'){
      _selectedMenu = 'Menu 4';
    }
    else if(widget.namaMenu == 'Es Jeruk'){
      _selectedMenu = 'Menu 5';
    }
  }

  @override
  void dispose() {
    _namaMenuController.dispose();
    _hargaController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    final updatedNamaMenu = _namaMenuController.text;
    final updatedHarga = _hargaController.text;

    if (updatedNamaMenu.isEmpty || updatedHarga.isEmpty || _selectedMenu == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Semua kolom harus diisi.")),
      );
      return; // Penting untuk menghentikan eksekusi jika ada kesalahan
    }

    Navigator.pop(context, {
      'namaMenu': updatedNamaMenu,
      'harga': updatedHarga,
      'menu': _selectedMenu,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Menu"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _namaMenuController,
              decoration: const InputDecoration(
                labelText: "Nama Menu",
                labelStyle: TextStyle(color: Colors.grey),
                border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _hargaController,
              decoration: const InputDecoration(
                labelText: "Harga",
                labelStyle: TextStyle(color: Colors.grey),
                border: UnderlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey[300],
              ),
              child: DropdownButton<String>(
                value: _selectedMenu,
                isExpanded: true,
                underline: const SizedBox(),
                hint: const Text("Pilih Menu"),
                items: const [
                  DropdownMenuItem(value: 'Menu 1', child: Text('Nasi Goreng')),
                  DropdownMenuItem(value: 'Menu 2', child: Text('Mie Ayam')),
                  DropdownMenuItem(value: 'Menu 3', child: Text('Ayam Goreng')),
                  DropdownMenuItem(value: 'Menu 4', child: Text('Es Teh')),
                  DropdownMenuItem(value: 'Menu 5', child: Text('Es Jeruk')),
                ],
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedMenu = newValue;
                  });
                },
              ),
            ),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: _saveChanges,
                child: const Text("Update"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}