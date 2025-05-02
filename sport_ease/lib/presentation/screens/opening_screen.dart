import 'package:flutter/material.dart';
import '../widget/custom_button.dart';
import 'login_screen.dart';

class OpeningScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 31, 115, 241), // Gelap dari atas
            Color.fromARGB(255, 213, 226, 247), // Terang di tengah
            Color.fromARGB(255, 31, 115, 241), // Warna gelap bawah
            ],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/image/logo.png', width: 300),
                const SizedBox(height: 30),
                const Text(
                  'Kelola event olahraga lebih praktis dan efisien! \nAyo, cek fitur lengkapnya sekarang!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 70),
                CustomButton(
                  text: 'Mulai',
                  borderColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
