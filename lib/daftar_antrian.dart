import 'package:flutter/material.dart';

class DaftarAntrianPage extends StatefulWidget {
  const DaftarAntrianPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DaftarAntrianPageState createState() => _DaftarAntrianPageState();
}

class _DaftarAntrianPageState extends State<DaftarAntrianPage> {

  // Daftar antrian dengan data contoh
  List<Map<String, dynamic>> antrian = [
    {"id": 1, "nama": "Pesanan 1", "status": "Menunggu"},
    {"id": 2, "nama": "Pesanan 2", "status": "Diproses"},
    {"id": 3, "nama": "Pesanan 3", "status": "Selesai"},
    {"id": 4, "nama": "Pesanan 4", "status": "Menunggu"},
  ];

  // Fungsi untuk mengubah status pesanan berdasarkan indeks
  void ubahStatus(int index, String statusBaru) {
    setState(() {
      antrian[index]["status"] = statusBaru; // Mengupdate status pesanan
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Antrian"), // Judul halaman
      ),
      body: ListView.builder(
        itemCount: antrian.length, // Jumlah item dalam daftar antrian
        itemBuilder: (context, index) {
          final item = antrian[index]; // Mendapatkan item berdasarkan indeks
          return ListTile(
            title: Text(item["nama"]), // Menampilkan nama pesanan
            subtitle: Text("Status: ${item["status"]}"), // Menampilkan status pesanan
            trailing: PopupMenuButton<String>(
              onSelected: (String newStatus) {
                ubahStatus(index, newStatus); // Mengubah status saat opsi dipilih
              },
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem(
                  value: "Menunggu",
                  child: Text("Menunggu"), // Opsi untuk status "Menunggu"
                ),
                const PopupMenuItem(
                  value: "Diproses",
                  child: Text("Diproses"), // Opsi untuk status "Diproses"
                ),
                const PopupMenuItem(
                  value: "Selesai",
                  child: Text("Selesai"), // Opsi untuk status "Selesai"
                ),
              ],
              child: StatusBadge(status: item["status"]), // Menampilkan badge status
            ),
          );
        },
      ),
    );
  }
}

class StatusBadge extends StatelessWidget {
  final String status;

  // Konstruktor untuk StatusBadge
  const StatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color color;

    // Mengatur warna berdasarkan status
    if (status == "Menunggu") {
      color = Colors.orange;
    } else if (status == "Diproses") {
      color = Colors.blue;
    } else {
      color = Colors.green;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), // Padding badge
      decoration: BoxDecoration(
        color: color, // Warna latar belakang badge
        borderRadius: BorderRadius.circular(12), // Membuat sudut badge melengkung
      ),
      child: Text(
        status,
        style: const TextStyle(color: Colors.white), // Warna teks badge
      ),
    );
  }
}
