import 'package:flutter/material.dart';

class UploadMenuPage extends StatelessWidget {
  const UploadMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Menu'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [ 
            const TextField(
              decoration: InputDecoration(
                labelText: 'Nama Menu',
                labelStyle: TextStyle(color: Colors.grey),
                border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Harga',
                labelStyle: TextStyle(color: Colors.grey),
                border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/editMenu');// Aksi tombol Edit
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                  ),
                  child: const Text('Edit',),
                ),
                ElevatedButton(
                  onPressed: () {
                     // Aksi tombol Upload
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                  ),
                  child: const Text('Upload',),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}