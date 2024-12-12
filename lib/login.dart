import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controller untuk mendapatkan teks yang diinput pada TextField Username dan Password
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Database sementara berupa daftar pengguna
  final List<Map<String, String>> dummyUsers = [
    {"username": "dika", "password": "dika111"},
  ];

  // Variabel untuk mengontrol visibilitas password
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Kasir"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  // TextField untuk memasukkan Username
                  TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      labelText: "Username",
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  // TextField untuk memasukkan Password dengan fitur hide/show
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                    obscureText: _obscureText, // Mengatur teks menjadi tersembunyi
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                String username = usernameController.text;
                String password = passwordController.text;

                // Validasi login
                bool isValidUser = dummyUsers.any((user) =>
                    user['username'] == username && user['password'] == password);

                if (isValidUser) {
                  // Navigasi ke halaman '/dashboard' jika login berhasil
                  Navigator.pushReplacementNamed(context, '/dashboard');
                } else {
                  // Menampilkan pesan jika login gagal
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Username atau Password salah!"),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                backgroundColor: Colors.green,
                foregroundColor: Colors.black,
              ),
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
