import 'package:flutter/material.dart';

// Halaman Upload Menu untuk menambahkan atau mengedit menu
class UploadMenuPage extends StatelessWidget {
  const UploadMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar sebagai header
      appBar: AppBar(
        title: const Text('Upload Menu'), // Judul halaman
        centerTitle: false, // Judul rata kiri
      ),
      
      // Body halaman dengan padding
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Konten rata kiri
          children: [ 
            // TextField untuk input nama menu
            const TextField(
              decoration: InputDecoration(
                labelText: 'Nama Menu', // Label input
                labelStyle: TextStyle(color: Colors.grey), // Warna label abu-abu
                border: UnderlineInputBorder(), // Garis bawah sebagai border
              ),
            ),
            const SizedBox(height: 16), // Jarak antar komponen

            // TextField untuk input harga menu
            const TextField(
              decoration: InputDecoration(
                labelText: 'Harga', // Label input
                labelStyle: TextStyle(color: Colors.grey), // Warna label abu-abu
                border: UnderlineInputBorder(), // Garis bawah sebagai border
              ),
            ),
            const SizedBox(height: 32), // Jarak antar komponen

            // Baris tombol Edit dan Upload
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Tombol diatur merata
              children: [
                // Tombol Edit
                ElevatedButton(
                  onPressed: () {
                    // Navigasi ke halaman edit menu
                    Navigator.pushNamed(context, '/editMenu');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300], // Warna tombol abu-abu muda
                  ),
                  child: const Text('Edit'), // Teks tombol
                ),

                // Tombol Upload
                ElevatedButton(
                  onPressed: () {
                    // Implementasi aksi untuk tombol Upload (belum diisi)
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300], // Warna tombol abu-abu muda
                  ),
                  child: const Text('Upload'), // Teks tombol
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
