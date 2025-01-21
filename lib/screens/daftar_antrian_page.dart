import 'package:flutter/material.dart';
import '../services/antrian_service.dart';
import '../models/antrian_model.dart';

class DaftarAntrianPage extends StatefulWidget {
  const DaftarAntrianPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DaftarAntrianPageState createState() => _DaftarAntrianPageState();
}

class _DaftarAntrianPageState extends State<DaftarAntrianPage> {
  final AntrianService _antrianService = AntrianService();
  late List<AntrianModel> antrian;

  @override
  void initState() {
    super.initState();
    antrian = _antrianService.getAntrian(); // Mendapatkan data antrian
  }

  // Mengubah status pesanan
  void ubahStatus(int id, String statusBaru) {
    setState(() {
      _antrianService.ubahStatus(id, statusBaru);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Antrian"),
      ),
      body: ListView.builder(
        itemCount: antrian.length,
        itemBuilder: (context, index) {
          final item = antrian[index];
          return ListTile(
            title: Text(item.nama),
            subtitle: Text("Status: ${item.status}"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                PopupMenuButton<String>(
                  onSelected: (String newStatus) {
                    ubahStatus(item.id, newStatus); // Mengubah status pesanan
                  },
                  itemBuilder: (BuildContext context) => [
                    const PopupMenuItem(
                      value: "Menunggu",
                      child: Text("Menunggu"),
                    ),
                    const PopupMenuItem(
                      value: "Diproses",
                      child: Text("Diproses"),
                    ),
                    const PopupMenuItem(
                      value: "Selesai",
                      child: Text("Selesai"),
                    ),
                  ],
                  child: StatusBadge(status: item.status),
                ),
                if (item.status == "Menunggu")
                  TextButton(
                    onPressed: () {
                      ubahStatus(item.id, "Batal"); // Mengubah status menjadi "Batal"
                    },
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class StatusBadge extends StatelessWidget {
  final String status;

  const StatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color color;

    // Mengatur warna berdasarkan status
    if (status == "Menunggu") {
      color = Colors.orange;
    } else if (status == "Diproses") {
      color = Colors.blue;
    } else if (status == "Selesai") {
      color = Colors.green;
    } else {
      color = Colors.red; // Warna untuk status "Batal"
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        status,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
