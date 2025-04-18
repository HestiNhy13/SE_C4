import 'package:flutter/material.dart';
import 'package:sport_ease/presentation/screen/home_screen.dart';
import 'package:sport_ease/presentation/screen/reset_password_screen.dart';
import '../widget/custom_button.dart';
import '../widget/custom_text.dart';
import '../widget/custom_card.dart';
import '../widget/custom_text.dart'; // Import file CustomTextField
import '../screen/register_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
//Digunakan untuk mengambil isi dari TextField
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isPasswordVisible = false; // Untuk mengontrol visibilitas password

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Ubah background Scaffold jadi putih
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Center(
              child: Image.asset('assets/image/logo1.png', width: 300),
            ),
            SizedBox(height: 10),
            CustomCard(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SELAMAT DATANG',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Masuk untuk melanjutkan',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Email',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    SizedBox(height: 10),
                    CustomTextField(
                      hintText: 'Masukkan Email',
                      textColor: Colors.black,
                      controller: emailController,
                      borderColor: Colors.black87,
                      fillColor: Colors.white60,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Password',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    SizedBox(height: 10),
                    CustomTextField(
                      hintText: 'Masukkan Password',
                      textColor: Colors.black,
                      borderColor: Colors.black87,
                      fillColor: Colors.white60,
                      controller: passwordController,
                      obscureText: !_isPasswordVisible, // Toggle visibilitas password
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context, 
                          MaterialPageRoute(builder: (context) => ResetPassword()));
                        },
                        child: Text(
                          'Lupa Kata Sandi?',
                          style: TextStyle(color: Colors.black, decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                    //button masuk
                    SizedBox(height: 15),
                    Center(
                      child: CustomButton(
                        text: 'Masuk',
                        borderColor: Colors.black,
                        color: Colors.blue.shade900,
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                        },
                      ),
                    ),
                    const SizedBox(height: 15),
                    Center(
                      child: Text(
                        'atau',
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                    ),
                    SizedBox(height: 15),
                    Center(
                      child: CustomButton(
                        text: 'Daftar',
                        color: Colors.white,
                        textColor: Colors.black,
                        borderColor: Colors.black,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RegisterScreen()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
