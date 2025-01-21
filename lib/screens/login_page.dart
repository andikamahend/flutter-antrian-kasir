// File: screens/login_page.dart

import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final AuthService _authService = AuthService();

  LoginPage({super.key});

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
            // Expanded untuk menyesuaikan konten dengan ruang yang tersedia
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  // Input Username
                  TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      labelText: "Username",
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  // Input Password
                  TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      labelText: "Password",
                      prefixIcon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),

            // Tombol Login
            ElevatedButton(
              onPressed: () {
                final username = usernameController.text;
                final password = passwordController.text;

                final isAuthenticated = _authService.login(username, password);

                if (isAuthenticated) {
                  Navigator.pushReplacementNamed(context, '/dashboard');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Username atau password salah")),
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
