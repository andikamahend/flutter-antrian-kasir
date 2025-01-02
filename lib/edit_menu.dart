import 'package:flutter/material.dart';

/// Halaman untuk mengedit data menu yang sudah ada.
class EditMenuPage extends StatefulWidget {
  /// Parameter yang diperlukan:
  /// - [namaMenu]: Nama menu yang akan diedit.
  /// - [harga]: Harga menu yang akan diedit.
  final String namaMenu;
  final String harga;

  const EditMenuPage({
    super.key,
    required this.namaMenu,
    required this.harga,
  });

  @override
  // Membuat state untuk halaman ini
  _EditMenuPageState createState() => _EditMenuPageState();
}

class _EditMenuPageState extends State<EditMenuPage> {
  /// Controller untuk input nama menu
  late TextEditingController _namaMenuController;
  /// Controller untuk input harga menu
  late TextEditingController _hargaController;
  /// Variabel untuk menyimpan pilihan menu yang dipilih
  String? _selectedMenu;

  @override
  void initState() {
    super.initState();
    // Menginisialisasi controller dengan nilai awal dari widget
    _namaMenuController = TextEditingController(text: widget.namaMenu);
    _hargaController = TextEditingController(text: widget.harga);

    // Menentukan pilihan menu berdasarkan nama menu awal
    if (widget.namaMenu == 'Nasi Goreng') {
      _selectedMenu = 'Menu 1';
    } else if (widget.namaMenu == 'Mie Ayam') {
      _selectedMenu = 'Menu 2';
    } else if (widget.namaMenu == 'Ayam Goreng') {
      _selectedMenu = 'Menu 3';
    } else if (widget.namaMenu == 'Es Teh') {
      _selectedMenu = 'Menu 4';
    } else if (widget.namaMenu == 'Es Jeruk') {
      _selectedMenu = 'Menu 5';
    }
  }

  @override
  void dispose() {
    // Membersihkan controller saat widget dihancurkan
    _namaMenuController.dispose();
    _hargaController.dispose();
    super.dispose();
  }

  /// Fungsi untuk menyimpan perubahan data menu
  void _saveChanges() {
    // Mengambil nilai input dari field
    final updatedNamaMenu = _namaMenuController.text;
    final updatedHarga = _hargaController.text;

    // Validasi jika ada field yang kosong
    if (updatedNamaMenu.isEmpty || updatedHarga.isEmpty || _selectedMenu == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Semua kolom harus diisi.")),
      );
      return; // Menghentikan proses jika ada kesalahan
    }

    // Mengirim data yang diperbarui kembali ke halaman sebelumnya
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
            // Input untuk Nama Menu
            TextField(
              controller: _namaMenuController,
              decoration: const InputDecoration(
                labelText: "Nama Menu",
                labelStyle: TextStyle(color: Colors.grey),
                border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            // Input untuk Harga Menu
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
            // Dropdown untuk memilih jenis menu
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
            // Tombol untuk menyimpan perubahan
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
